#!/usr/bin/env python3
"""
检查数据包中使用的记分板是否已注册（全目录扫描）
"""

import re
import sys
from pathlib import Path

# 数据包 function 目录
FUNCTION_DIR = "data/age/function"

def scan_file(file_path):
    """扫描单个文件，返回 (注册集合, 使用集合)"""
    registered = set()
    used = set()
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 1. 注册：scoreboard objectives add <name> <criteria>
    reg_pattern = r'scoreboard\s+objectives\s+add\s+([^\s]+)\s+[^\s]+'
    registered.update(re.findall(reg_pattern, content))
    
    # 2. 使用：scoreboard players ... <objective>
    use_patterns = [
        r'scoreboard\s+players\s+add\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+remove\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+set\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+operation\s+\S+\s+([^\s]+)\s+[+\-*/%=&><^]+?\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+get\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+reset\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+enable\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+display\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+operation\s+\S+\s+([^\s]+)\s+[+\-*/%=&><^]+?\s+\S+',
    ]
    for pattern in use_patterns:
        matches = re.findall(pattern, content)
        for match in matches:
            if isinstance(match, tuple):
                for m in match:
                    if m and not m.startswith('#'):
                        used.add(m)
            else:
                if match and not match.startswith('#'):
                    used.add(match)
    
    return registered, used

def main():
    func_dir = Path(FUNCTION_DIR)
    if not func_dir.exists():
        print(f"❌ 目录不存在: {func_dir}")
        sys.exit(1)
    
    all_registered = set()
    all_used = set()
    file_count = 0
    
    for mc_file in func_dir.rglob("*.mcfunction"):
        file_count += 1
        reg, used = scan_file(mc_file)
        all_registered.update(reg)
        all_used.update(used)
    
    print(f"📁 扫描了 {file_count} 个 .mcfunction 文件")
    print(f"📝 注册的记分板: {len(all_registered)} 个")
    print(f"📝 使用的记分板: {len(all_used)} 个")
    
    # 找出未注册的（移除白名单，全部检查）
    unregistered = all_used - all_registered
    
    if unregistered:
        print("\n⚠️ 警告：以下记分板使用了但未注册：")
        for obj in sorted(unregistered):
            print(f"  - {obj}")
        print("\n建议在 init.mcfunction 中添加：")
        for obj in sorted(unregistered):
            print(f"  scoreboard objectives add {obj} dummy")
        sys.exit(1)
    else:
        print("\n✅ 所有使用的记分板都已注册！")
    
    unused = all_registered - all_used
    if unused:
        print(f"\n[未使用] {len(unused)} 个记分板已注册但未使用：")
        for obj in sorted(unused):
            print(f"  - {obj}")

if __name__ == "__main__":
    main()
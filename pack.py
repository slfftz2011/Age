#!/usr/bin/env python3
"""
检查数据包中使用的记分板是否已注册（带调试输出）
"""

import re
import sys
from pathlib import Path

FUNCTION_DIR = "data/age/function"

def scan_file(file_path):
    registered = set()
    used = set()
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 打印文件内容的前200字符用于调试
    print(f"\n📄 扫描文件: {file_path}")
    print(f"   内容预览: {content[:200].replace(chr(10), ' ')}...")
    
    # 注册
    reg_pattern = r'scoreboard\s+objectives\s+add\s+([^\s]+)\s+[^\s]+'
    reg_matches = re.findall(reg_pattern, content)
    registered.update(reg_matches)
    if reg_matches:
        print(f"   找到注册: {reg_matches}")
    
    # 使用
    use_patterns = [
        r'scoreboard\s+players\s+add\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+remove\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+set\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+operation\s+\S+\s+([^\s]+)\s+[+\-*/%=&><^]+?\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+get\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+reset\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+enable\s+\S+\s+([^\s]+)',
        r'scoreboard\s+players\s+display\s+\S+\s+([^\s]+)',
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
    if used:
        print(f"   找到使用: {used}")
    
    return registered, used

def main():
    func_dir = Path(FUNCTION_DIR)
    if not func_dir.exists():
        print(f"❌ 目录不存在: {func_dir.absolute()}")
        print("当前工作目录:", Path.cwd())
        sys.exit(1)
    
    print(f"📁 扫描目录: {func_dir.absolute()}")
    
    all_registered = set()
    all_used = set()
    file_count = 0
    
    for mc_file in func_dir.rglob("*.mcfunction"):
        file_count += 1
        reg, used = scan_file(mc_file)
        all_registered.update(reg)
        all_used.update(used)
    
    print(f"\n=== 统计 ===")
    print(f"扫描文件数: {file_count}")
    print(f"注册记分板: {len(all_registered)} 个")
    print(f"使用记分板: {len(all_used)} 个")
    
    unregistered = all_used - all_registered
    if unregistered:
        print("\n⚠️ 未注册的记分板：")
        for obj in sorted(unregistered):
            print(f"  - {obj}")
        sys.exit(1)
    else:
        print("\n✅ 所有使用的记分板都已注册！")

if __name__ == "__main__":
    main()
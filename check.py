#!/usr/bin/env python3
"""
检查数据包中使用的记分板是否已注册（全目录扫描，含位置信息）
"""

import re
import sys
from pathlib import Path

FUNCTION_DIR = "data/age/function"

def scan_file(file_path):
    """扫描单个文件，返回 (注册集合, 使用字典)"""
    registered = set()
    used_info = {}  # 记分板名 -> [(文件路径, 行号), ...]
    
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # 匹配记分板注册
    reg_pattern = re.compile(r'scoreboard\s+objectives\s+add\s+([^\s]+)\s+[^\s]+')
    for line in lines:
        m = reg_pattern.search(line)
        if m:
            registered.add(m.group(1))
    
    # 匹配记分板使用
    use_patterns = [
        re.compile(r'scoreboard\s+players\s+add\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+remove\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+set\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+operation\s+\S+\s+([^\s]+)\s+[+\-*/%=&><^]+?\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+get\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+reset\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+enable\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+display\s+\S+\s+([^\s]+)'),
        # 通用匹配
        re.compile(r'scoreboard\s+players\s+\w+\s+\S+\s+([^\s]+)'),
    ]
    for line_no, line in enumerate(lines, start=1):
        for pattern in use_patterns:
            matches = pattern.findall(line)
            for match in matches:
                if isinstance(match, tuple):
                    for m in match:
                        if m and not m.startswith('#'):
                            used_info.setdefault(m, []).append((str(file_path), line_no))
                else:
                    if match and not match.startswith('#'):
                        used_info.setdefault(match, []).append((str(file_path), line_no))
    
    return registered, used_info

def main():
    func_dir = Path(FUNCTION_DIR)
    if not func_dir.exists():
        print(f"❌ 目录不存在: {func_dir.absolute()}")
        sys.exit(1)
    
    all_registered = set()
    all_used_info = {}
    file_count = 0
    
    for mc_file in func_dir.rglob("*.mcfunction"):
        file_count += 1
        reg, used_info = scan_file(mc_file)
        all_registered.update(reg)
        for name, locations in used_info.items():
            all_used_info.setdefault(name, []).extend(locations)
    
    print(f"📁 扫描了 {file_count} 个 .mcfunction 文件")
    print(f"📝 注册的记分板: {len(all_registered)} 个")
    print(f"📝 使用的记分板: {len(all_used_info)} 个")
    
    unregistered = set(all_used_info.keys()) - all_registered
    
    if unregistered:
        print("\n⚠️ 警告：以下记分板使用了但未注册：")
        for obj in sorted(unregistered):
            print(f"  - {obj}")
            locations = all_used_info.get(obj, [])
            # 去重显示
            seen = set()
            for path, line in locations:
                key = (path, line)
                if key in seen:
                    continue
                seen.add(key)
                print(f"      {path}:{line}")
        print("\n建议在 init.mcfunction 中添加：")
        for obj in sorted(unregistered):
            print(f"  scoreboard objectives add {obj} dummy")
        sys.exit(1)
    else:
        print("\n✅ 所有使用的记分板都已注册！")

if __name__ == "__main__":
    main()
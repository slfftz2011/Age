#!/usr/bin/env python3
"""
检查数据包中使用的记分板是否已在 init.mcfunction 中注册
用法: python check_scoreboards.py [--strict]
"""

import re
import sys
import argparse
from pathlib import Path

# 入口文件路径
INIT_FILE = "data/age/functions/init.mcfunction"
LOOP_FILE = "data/age/functions/loop.mcfunction"

# 白名单：无需注册的记分板
WHITELIST = {
    "temperature.tmp",
    "time",
}

def extract_objectives(file_path):
    objectives = set()
    if not Path(file_path).exists():
        return objectives
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    pattern = r'scoreboard\s+objectives\s+add\s+(\S+)\s+\S+'
    objectives.update(re.findall(pattern, content))
    return objectives

def extract_usage(file_path):
    used = set()
    if not Path(file_path).exists():
        return used
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    patterns = [
        r'scoreboard\s+players\s+add\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+remove\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+set\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+operation\s+\S+\s+(\S+)\s+[+\-*/%=&><^]+?\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+get\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+reset\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+enable\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+display\s+\S+\s+(\S+)',
    ]
    for pattern in patterns:
        matches = re.findall(pattern, content)
        for match in matches:
            if isinstance(match, tuple):
                for m in match:
                    if m and not m.startswith('#'):
                        used.add(m)
            else:
                if match and not match.startswith('#'):
                    used.add(match)
    return used

def extract_function_calls(file_path):
    calls = set()
    if not Path(file_path).exists():
        return calls
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    pattern = r'function\s+(\S+)'
    matches = re.findall(pattern, content)
    for m in matches:
        if '{' not in m:
            calls.add(m)
    return calls

def collect_all_usages(start_file, visited=None):
    if visited is None:
        visited = set()
    if start_file in visited:
        return set()
    visited.add(start_file)
    all_used = set()
    all_used.update(extract_usage(start_file))
    for sub_func in extract_function_calls(start_file):
        sub_path = f"data/age/functions/{sub_func}.mcfunction"
        if Path(sub_path).exists():
            all_used.update(collect_all_usages(sub_path, visited))
    return all_used

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--strict', action='store_true',
                        help='若存在未注册记分板则返回非零退出码')
    args = parser.parse_args()

    root = Path(".")
    init_path = root / INIT_FILE
    loop_path = root / LOOP_FILE

    registered = extract_objectives(init_path)
    print(f"[已注册] {len(registered)} 个记分板")

    all_used = collect_all_usages(loop_path)
    all_used.update(extract_usage(init_path))
    all_used = all_used - WHITELIST

    print(f"[已使用] {len(all_used)} 个记分板")

    unregistered = all_used - registered
    print(f"[未注册] {len(unregistered)} 个")

    if unregistered:
        print("\n⚠️ 警告：以下记分板使用了但未在 init.mcfunction 中注册：")
        for obj in sorted(unregistered):
            print(f"  - {obj}")
        print("\n建议在 init.mcfunction 中添加：")
        for obj in sorted(unregistered):
            print(f"  scoreboard objectives add {obj} dummy")
        if args.strict:
            print("\n❌ 严格模式：存在未注册记分板，检查失败。")
            sys.exit(1)
    else:
        print("\n✅ 所有使用的记分板都已注册！")

    unused = registered - all_used
    if unused:
        print(f"\n[未使用] {len(unused)} 个记分板已注册但未使用：")
        for obj in sorted(unused):
            print(f"  - {obj}")

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""
检查数据包中使用的记分板是否已在 init.mcfunction 中注册
"""

import re
import sys
from pathlib import Path

# 入口文件路径（相对于数据包根目录）
INIT_FILE = "data/age/functions/init.mcfunction"
LOOP_FILE = "data/age/functions/loop.mcfunction"

# 白名单：无需在 init 中注册的记分板（虚拟玩家专用，如 #neg 等）
# 这些记分板由 const 函数在运行时设置，不是通过 objectives add 创建
WHITELIST = {
    "temperature.tmp",  # 通过 const 函数设置
    "time",             # 显示计时器（已在 init 中创建，这里作为补充）
}

def extract_objectives(file_path):
    """从文件中提取所有 scoreboard objectives add 注册的记分板名称"""
    objectives = set()
    if not Path(file_path).exists():
        return objectives
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    # 匹配 scoreboard objectives add <name> <criteria> [...]
    pattern = r'scoreboard\s+objectives\s+add\s+(\S+)\s+\S+'
    objectives.update(re.findall(pattern, content))
    return objectives

def extract_usage(file_path):
    """从文件中提取所有被使用的记分板名称（scoreboard players 命令中）"""
    used = set()
    if not Path(file_path).exists():
        return used
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    # 匹配 scoreboard players ... <objective>
    # 包括 add, remove, set, operation, get, reset, enable, display
    patterns = [
        r'scoreboard\s+players\s+add\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+remove\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+set\s+\S+\s+(\S+)',
        r'scoreboard\s+players\s+operation\s+\S+\s+(\S+)\s+[+\-*/%=&><^]+?\s+\S+\s+(\S+)',  # 两个记分板
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
                    if m and not m.startswith('#'):  # 排除虚拟玩家
                        used.add(m)
            else:
                if match and not match.startswith('#'):
                    used.add(match)
    return used

def extract_function_calls(file_path):
    """从文件中提取所有 function 调用的路径，用于递归检查"""
    calls = set()
    if not Path(file_path).exists():
        return calls
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    # 匹配 function <namespace>:<path>
    pattern = r'function\s+(\S+)'
    matches = re.findall(pattern, content)
    for m in matches:
        # 过滤掉带参数的宏调用（包含 {）
        if '{' not in m:
            calls.add(m)
    return calls

def collect_all_usages(start_file, visited=None):
    """递归收集所有被调用的函数中使用的记分板"""
    if visited is None:
        visited = set()
    if start_file in visited:
        return set()
    visited.add(start_file)
    
    all_used = set()
    # 当前文件的使用情况
    all_used.update(extract_usage(start_file))
    # 递归子函数
    for sub_func in extract_function_calls(start_file):
        sub_path = f"data/age/functions/{sub_func}.mcfunction"
        if Path(sub_path).exists():
            all_used.update(collect_all_usages(sub_path, visited))
    return all_used

def main():
    root = Path(".")
    init_path = root / INIT_FILE
    loop_path = root / LOOP_FILE
    
    # 1. 获取已注册的记分板
    registered = extract_objectives(init_path)
    print(f"[已注册] {len(registered)} 个记分板")
    
    # 2. 从 init 中也提取一些使用情况（如 operation 复制）
    # 但 init 本身也可能使用记分板，应该检查
    # 3. 从 loop 递归收集所有使用
    all_used = collect_all_usages(loop_path)
    # 也检查 init 本身的使用
    all_used.update(extract_usage(init_path))
    
    # 移除白名单
    all_used = all_used - WHITELIST
    
    # 4. 找出未注册的
    unregistered = all_used - registered
    
    print(f"[已使用] {len(all_used)} 个记分板")
    print(f"[未注册] {len(unregistered)} 个")
    
    if unregistered:
        print("\n⚠️ 警告：以下记分板使用了但未在 init.mcfunction 中注册：")
        for obj in sorted(unregistered):
            # 尝试找一下在哪个文件中使用，方便定位
            print(f"  - {obj}")
        print(f"\n建议在 init.mcfunction 中添加：")
        for obj in sorted(unregistered):
            print(f"  scoreboard objectives add {obj} dummy")
    else:
        print("\n✅ 所有使用的记分板都已注册！")
    
    # 5. 列出所有已注册但未使用（可选）
    unused = registered - all_used
    if unused:
        print(f"\n[未使用] {len(unused)} 个记分板已注册但未使用：")
        for obj in sorted(unused):
            print(f"  - {obj}")

if __name__ == "__main__":
    main()
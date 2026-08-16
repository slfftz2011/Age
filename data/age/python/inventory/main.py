#!/usr/bin/env python3
"""
生成 Minecraft 函数文件：
- 将指定槽位强制替换为屏障（锁定）
- 将保留槽位中已有的屏障清除（解锁）
全程使用 `item replace`，不使用 `clear` 命令。
"""

import argparse
import re
from pathlib import Path

def parse_slot_list(slot_str: str) -> list:
    """解析槽位列表，支持逗号分隔，支持范围如 container.0-26"""
    slots = []
    for part in slot_str.split(','):
        part = part.strip()
        if '-' in part:
            # 处理范围，例如 container.0-26
            base, range_str = part.split('-', 1)
            # 提取数字部分
            match = re.match(r'^(.*?)(\d+)$', base)
            if not match:
                raise ValueError(f"无法解析范围: {part}")
            prefix = match.group(1)
            start = int(match.group(2))
            end = int(range_str)
            for i in range(start, end + 1):
                slots.append(f"{prefix}{i}")
        else:
            slots.append(part)
    return slots

def main():
    parser = argparse.ArgumentParser(
        description="生成锁定/解锁槽位的 mcfunction 文件"
    )
    parser.add_argument(
        "-l", "--lock-slots", required=True,
        help="要锁定的槽位（替换为屏障），支持逗号分隔，支持范围，例如 'container.0-26'"
    )
    parser.add_argument(
        "-k", "--keep-slots", default="hotbar.0-8,weapon.offhand,armor.head,armor.chest,armor.legs,armor.feet",
        help="要保留的槽位（清除屏障），默认：hotbar.0-8,weapon.offhand,armor.head,armor.chest,armor.legs,armor.feet"
    )
    parser.add_argument(
        "-o", "--output", default="lock_slots.mcfunction",
        help="输出文件名 (默认: lock_slots.mcfunction)"
    )
    args = parser.parse_args()

    # 解析槽位列表
    lock_slots = parse_slot_list(args.lock_slots)
    keep_slots = parse_slot_list(args.keep_slots)

    # 去重、保留顺序
    lock_slots = list(dict.fromkeys(lock_slots))
    keep_slots = list(dict.fromkeys(keep_slots))

    # 检查重叠（一个槽位不能既是锁定又是保留）
    overlap = set(lock_slots) & set(keep_slots)
    if overlap:
        print(f"⚠️ 警告：以下槽位同时出现在锁定和保留列表中: {overlap}")
        print("   将从保留列表中移除这些槽位")
        keep_slots = [s for s in keep_slots if s not in overlap]

    # 生成命令
    lines = []
    lines.append("# 槽位锁定/解锁函数")
    lines.append(f"# 锁定槽位: {args.lock_slots}")
    lines.append(f"# 保留槽位: {','.join(keep_slots)}")
    lines.append("")
    name = '{text:"✖",color:"red",italic:false}'

    # 1. 清除保留槽位中的屏障
    if keep_slots:
        lines.append("# 清除保留槽位中的屏障")
        for slot in keep_slots:
            lines.append(f"execute if items entity @s {slot} minecraft:barrier[minecraft:custom_name={name}] run item replace entity @s {slot} with air")

    # 2. 强制锁定指定槽位（替换为屏障）
    lines.append("")
    lines.append("# 强制锁定指定槽位")
    for slot in lock_slots:
        lines.append(f"item replace entity @s {slot} with minecraft:barrier[minecraft:custom_name={name}]")

    # 写入文件
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"✅ 已生成函数文件: {output_path}")
    print(f"   锁定槽位数: {len(lock_slots)}")
    print(f"   保留槽位数: {len(keep_slots)}")

if __name__ == "__main__":
    main()
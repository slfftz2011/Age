#!/usr/bin/env python3
"""
综合数据包检查工具（增强统计版）
检查项目：
- 记分板注册与使用（含未使用报告）
- 标签引用（方块/物品/实体/函数）
- 谓词引用
- 进度引用
- 函数路径
- 战利品表引用
- 结构引用
- JSON 语法
- NBT 结构（可选）
"""

import re
import sys
import json
from pathlib import Path

PACK_ROOT = Path(".")
NAMESPACE = "age"

FUNCTION_DIR = PACK_ROOT / "data" / NAMESPACE / "function"
TAG_DIR = PACK_ROOT / "data" / NAMESPACE / "tags"
PREDICATE_DIR = PACK_ROOT / "data" / NAMESPACE / "predicates"
ADVANCEMENT_DIR = PACK_ROOT / "data" / NAMESPACE / "advancement"
LOOT_TABLE_DIR = PACK_ROOT / "data" / NAMESPACE / "loot_table"
STRUCTURE_DIR = PACK_ROOT / "data" / NAMESPACE / "structure"

def scan_mcfunction(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    lines = content.splitlines()
    
    result = {
        'scoreboard_registered': set(),
        'scoreboard_used': set(),
        'tag_refs': {'block': set(), 'item': set(), 'entity': set(), 'function': set()},
        'predicate_refs': set(),
        'advancement_refs': set(),
        'function_calls': set(),
        'loot_table_refs': set(),
        'structure_refs': set(),
    }
    
    # 记分板注册
    reg_pattern = re.compile(r'scoreboard\s+objectives\s+add\s+([^\s]+)\s+[^\s]+')
    # 记分板使用
    use_patterns = [
        re.compile(r'scoreboard\s+players\s+add\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+remove\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+set\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+operation\s+\S+\s+([^\s]+)\s+[+\-*/%=&><^]+?\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+get\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+reset\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+enable\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+display\s+\S+\s+([^\s]+)'),
        re.compile(r'scoreboard\s+players\s+\w+\s+\S+\s+([^\s]+)'),
    ]
    
    # 标签引用
    tag_pattern = re.compile(r'#age:([a-zA-Z0-9_/]+)')
    # 谓词
    pred_pattern = re.compile(r'predicate\s+age:([a-zA-Z0-9_/]+)')
    # 进度
    adv_pattern = re.compile(r'advancement\s+(grant|revoke)\s+\S+\s+(?:only\s+)?age:([a-zA-Z0-9_/]+)')
    # 函数调用
    func_pattern = re.compile(r'function\s+age:([a-zA-Z0-9_/]+)')
    # 战利品表
    loot_pattern = re.compile(r'loot\s+(give|replace|spawn)\s+.*?age:([a-zA-Z0-9_/]+)')
    # 结构
    struct_pattern = re.compile(r'structure\s+(load|place)\s+age:([a-zA-Z0-9_/]+)')
    
    for line in lines:
        # 记分板
        m = reg_pattern.search(line)
        if m:
            result['scoreboard_registered'].add(m.group(1))
        for pat in use_patterns:
            matches = pat.findall(line)
            for match in matches:
                if isinstance(match, tuple):
                    for m in match:
                        if m and not m.startswith('#'):
                            result['scoreboard_used'].add(m)
                else:
                    if match and not match.startswith('#'):
                        result['scoreboard_used'].add(match)
        
        # 标签分类
        for m in tag_pattern.finditer(line):
            tag_path = m.group(1)
            context = line.lower()
            if 'block' in context or 'setblock' in context or 'fill' in context:
                result['tag_refs']['block'].add(tag_path)
            elif ('items' in context or 'item' in context or 'clear' in context or
                  'container' in context or 'inventory' in context or
                  'give' in context or 'replaceitem' in context or 'loot' in context):
                result['tag_refs']['item'].add(tag_path)
            elif 'entity' in context or 'tag' in context or 'type' in context or 'summon' in context:
                result['tag_refs']['entity'].add(tag_path)
            else:
                result['tag_refs']['function'].add(tag_path)
        
        # 谓词
        for m in pred_pattern.finditer(line):
            result['predicate_refs'].add(m.group(1))
        
        # 进度
        for m in adv_pattern.finditer(line):
            result['advancement_refs'].add(m.group(2))
        
        # 函数
        for m in func_pattern.finditer(line):
            result['function_calls'].add(m.group(1))
        
        # 战利品表
        for m in loot_pattern.finditer(line):
            result['loot_table_refs'].add(m.group(2))
        
        # 结构
        for m in struct_pattern.finditer(line):
            result['structure_refs'].add(m.group(2))
    
    return result

def check_tags(tag_refs):
    missing = {'block': [], 'item': [], 'entity': [], 'function': []}
    for tag_type, paths in tag_refs.items():
        for path in paths:
            tag_file = TAG_DIR / tag_type / f"{path}.json"
            if not tag_file.exists():
                tag_file = TAG_DIR / tag_type / path
                if not tag_file.suffix:
                    tag_file = tag_file.with_suffix('.json')
                if not tag_file.exists():
                    missing[tag_type].append(path)
    return missing

def check_predicates(pred_refs):
    missing = []
    for path in pred_refs:
        pred_file = PREDICATE_DIR / f"{path}.json"
        if not pred_file.exists():
            pred_file = PREDICATE_DIR / path
            if not pred_file.suffix:
                pred_file = pred_file.with_suffix('.json')
            if not pred_file.exists():
                missing.append(path)
    return missing

def check_advancements(adv_refs):
    missing = []
    for path in adv_refs:
        adv_file = ADVANCEMENT_DIR / f"{path}.json"
        if not adv_file.exists():
            adv_file = ADVANCEMENT_DIR / path
            if not adv_file.suffix:
                adv_file = adv_file.with_suffix('.json')
            if not adv_file.exists():
                missing.append(path)
    return missing

def check_function_calls(func_refs):
    missing = []
    for path in func_refs:
        func_file = FUNCTION_DIR / f"{path}.mcfunction"
        if not func_file.exists():
            func_file = FUNCTION_DIR / path
            if not func_file.suffix:
                func_file = func_file.with_suffix('.mcfunction')
            if not func_file.exists():
                missing.append(path)
    return missing

def check_loot_tables(loot_refs):
    missing = []
    for path in loot_refs:
        loot_file = LOOT_TABLE_DIR / f"{path}.json"
        if not loot_file.exists():
            loot_file = LOOT_TABLE_DIR / path
            if not loot_file.suffix:
                loot_file = loot_file.with_suffix('.json')
            if not loot_file.exists():
                missing.append(path)
    return missing

def check_structures(struct_refs):
    missing = []
    for path in struct_refs:
        struct_file = STRUCTURE_DIR / f"{path}.nbt"
        if not struct_file.exists():
            struct_file = STRUCTURE_DIR / path
            if not struct_file.suffix:
                struct_file = struct_file.with_suffix('.nbt')
            if not struct_file.exists():
                missing.append(path)
    return missing

def check_json_syntax():
    errors = []
    for json_file in PACK_ROOT.glob("data/**/*.json"):
        if json_file.parent == PACK_ROOT:
            continue
        try:
            with open(json_file, 'r', encoding='utf-8') as f:
                json.load(f)
        except json.JSONDecodeError as e:
            errors.append(f"{json_file}: {e}")
    return errors

def check_nbt():
    try:
        import nbtlib
    except ImportError:
        print("⚠️  nbtlib 未安装，跳过 NBT 检查。")
        return []
    errors = []
    for nbt_file in PACK_ROOT.glob("data/**/*.nbt"):
        try:
            nbtlib.load(nbt_file)
        except Exception as e:
            errors.append(f"{nbt_file}: {e}")
    return errors

def main():
    if not FUNCTION_DIR.exists():
        print(f"❌ 函数目录不存在: {FUNCTION_DIR}")
        sys.exit(1)
    
    all_registered = set()
    all_used = set()
    tag_refs = {'block': set(), 'item': set(), 'entity': set(), 'function': set()}
    pred_refs = set()
    adv_refs = set()
    func_calls = set()
    loot_refs = set()
    struct_refs = set()
    
    for mc_file in FUNCTION_DIR.rglob("*.mcfunction"):
        result = scan_mcfunction(mc_file)
        all_registered.update(result['scoreboard_registered'])
        all_used.update(result['scoreboard_used'])
        for k in tag_refs:
            tag_refs[k].update(result['tag_refs'][k])
        pred_refs.update(result['predicate_refs'])
        adv_refs.update(result['advancement_refs'])
        func_calls.update(result['function_calls'])
        loot_refs.update(result['loot_table_refs'])
        struct_refs.update(result['structure_refs'])
    
    print(f"📁 扫描了 {len(list(FUNCTION_DIR.rglob('*.mcfunction')))} 个 .mcfunction 文件")
    print(f"📝 注册的记分板: {len(all_registered)} 个")
    print(f"📝 使用的记分板: {len(all_used)} 个")
    
    # ===== 未使用的记分板 =====
    unused = all_registered - all_used
    if unused:
        print("\n[未使用] 以下记分板已注册但未使用：")
        for obj in sorted(unused):
            print(f"  - {obj}")
        print()
    
    # ===== 检查缺失 =====
    unregistered = all_used - all_registered
    if unregistered:
        print("⚠️ 未注册的记分板：")
        for obj in sorted(unregistered):
            print(f"  - {obj}")
        print("\n建议在 init.mcfunction 中添加：")
        for obj in sorted(unregistered):
            print(f"  scoreboard objectives add {obj} dummy")
        print()
    
    missing_tags = check_tags(tag_refs)
    if any(missing_tags.values()):
        print("⚠️ 缺失的标签：")
        for tag_type, paths in missing_tags.items():
            if paths:
                print(f"  [{tag_type}]")
                for p in paths:
                    print(f"    - {p}")
        print()
    
    missing_preds = check_predicates(pred_refs)
    if missing_preds:
        print("⚠️ 缺失的谓词：")
        for p in sorted(missing_preds):
            print(f"  - {p}")
        print()
    
    missing_advs = check_advancements(adv_refs)
    if missing_advs:
        print("⚠️ 缺失的进度：")
        for p in sorted(missing_advs):
            print(f"  - {p}")
        print()
    
    missing_funcs = check_function_calls(func_calls)
    if missing_funcs:
        print("⚠️ 缺失的函数文件：")
        for p in sorted(missing_funcs):
            print(f"  - {p}")
        print()
    
    missing_loots = check_loot_tables(loot_refs)
    if missing_loots:
        print("⚠️ 缺失的战利品表：")
        for p in sorted(missing_loots):
            print(f"  - {p}")
        print()
    
    missing_structs = check_structures(struct_refs)
    if missing_structs:
        print("⚠️ 缺失的结构文件：")
        for p in sorted(missing_structs):
            print(f"  - {p}")
        print()
    
    json_errors = check_json_syntax()
    if json_errors:
        print("⚠️ JSON 语法错误：")
        for err in json_errors:
            print(f"  {err}")
        print()
    
    nbt_errors = check_nbt()
    if nbt_errors:
        print("⚠️ NBT 文件错误：")
        for err in nbt_errors:
            print(f"  {err}")
        print()
    
    # ===== 统计汇总 =====
    print("\n=== 统计汇总 ===")
    print(f"总函数文件数: {len(list(FUNCTION_DIR.rglob('*.mcfunction')))}")
    print(f"注册记分板: {len(all_registered)}")
    print(f"使用记分板: {len(all_used)}")
    print(f"未使用记分板: {len(unused)}")
    print(f"未注册记分板: {len(unregistered)}")
    print(f"标签引用: {sum(len(v) for v in tag_refs.values())} (block: {len(tag_refs['block'])}, item: {len(tag_refs['item'])}, entity: {len(tag_refs['entity'])}, function: {len(tag_refs['function'])})")
    print(f"谓词引用: {len(pred_refs)}")
    print(f"进度引用: {len(adv_refs)}")
    print(f"函数调用: {len(func_calls)}")
    print(f"战利品表引用: {len(loot_refs)}")
    print(f"结构引用: {len(struct_refs)}")
    print(f"JSON 语法错误: {len(json_errors)}")
    print(f"NBT 错误: {len(nbt_errors)}")
    
    total_issues = (len(unregistered) + sum(len(v) for v in missing_tags.values()) +
                    len(missing_preds) + len(missing_advs) + len(missing_funcs) +
                    len(missing_loots) + len(missing_structs) + len(json_errors) + len(nbt_errors))
    if total_issues == 0:
        print("\n✅ 所有检查通过！")
        sys.exit(0)
    else:
        print(f"\n❌ 发现 {total_issues} 个问题，请修复。")
        sys.exit(1)

if __name__ == "__main__":
    main()
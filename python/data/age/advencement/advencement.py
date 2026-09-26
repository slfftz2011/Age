import json
import re
import sys
from pathlib import Path

# ======================== 索引生成 ========================

def generate_child_index(parent_index, child_order, total_children):
    match = re.match(r'^(\d+)([a-z]?)$', parent_index)
    if not match:
        raise ValueError(f"Invalid parent index: {parent_index}")
    num = int(match.group(1))
    letter = match.group(2)
    new_num = num + 1
    if letter:
        return f"{new_num}{letter}"
    else:
        if total_children == 1:
            return str(new_num)
        else:
            if child_order > 26:
                raise ValueError("Too many children, only 26 letters available")
            return f"{new_num}{chr(96 + child_order)}"

# ======================== 构建显示组件 ========================

def build_display(title, description, icon, hidden=False, frame="goal", strikethrough=False, announce=True):
    display = {
        "title": title,
        "description": description,
        "icon": icon,
        "frame": frame,
        "show_toast": True,
        "announce_to_chat": announce,
        "hidden": hidden
    }
    if strikethrough:
        if isinstance(description, str):
            display["description"] = {"text": description, "strikethrough": True}
        elif isinstance(description, (list, dict)):
            import copy
            desc = copy.deepcopy(description)
            def add_strikethrough(obj):
                if isinstance(obj, dict):
                    if "text" in obj:
                        obj["strikethrough"] = True
                    for v in obj.values():
                        add_strikethrough(v)
                elif isinstance(obj, list):
                    for item in obj:
                        add_strikethrough(item)
            add_strikethrough(desc)
            display["description"] = desc
    return display

# ======================== 构建 criteria ========================

def build_criteria(custom_criteria=None):
    """构建 criteria 对象，如果提供了自定义则使用，否则使用 impossible"""
    if custom_criteria and isinstance(custom_criteria, dict):
        return custom_criteria
    return {"complete": {"trigger": "minecraft:impossible"}}

# ======================== 生成分支根节点 ========================

def generate_branch_root(branch_config, age, age_text, age_color):
    title_suffix = branch_config.get("title.suffix", "挑战")
    icon = branch_config.get("icon", {"id": "minecraft:emerald"})
    description = branch_config.get("description", "完成各项挑战任务，推动时代前进")
    
    title_component = [
        {"text": age_text, "color": age_color},
        {"text": f"·{title_suffix}", "color": "gold", "bold": True}
    ]
    
    return {
        "display": {
            "title": title_component,
            "description": description,
            "icon": icon,
            "background": "minecraft:block/stone",
            "frame": "task",
            "show_toast": False,
            "announce_to_chat": False,
            "hidden": False
        },
        "criteria": {
            "granted": {
                "trigger": "minecraft:impossible"
            }
        },
        "rewards": {}
    }

# ======================== 生成分支任务 ========================

def generate_branch(branch_data, index, age):
    title_component = [
        "",
        {"text": f"挑战{index}:", "color": "aqua", "bold": True},
        f" {branch_data['title.name']}"
    ]
    display = build_display(
        title=title_component,
        description=branch_data['description'],
        icon=branch_data['icon'],
        hidden=False,
        frame="challenge",
        announce=False
    )
    # 支持自定义 criteria
    custom_criteria = branch_data.get('criteria')
    criteria = build_criteria(custom_criteria)
    
    return {
        "display": display,
        "parent": f"age:{age}/branch_root",
        "criteria": criteria,
        "rewards": {"function": f"age:task/{age}/branch/{index}"}
    }

# ======================== 主线节点生成 ========================

def generate_main_nodes(node, index, parent_index, age, results):
    value = node.get('value', {})
    children = node.get('child', [])
    hidden = value.get('hidden', False)
    custom_criteria = value.get('criteria', None)

    is_hidden_task = hidden

    if is_hidden_task:
        # ===== 隐藏任务：只生成展示进度 =====
        show_parent = f"age:{age}/phase_{parent_index}" if parent_index else f"age:{age}/root"
        show_title = [
            "",
            {"text": f"阶段{index}:", "color": "dark_purple", "bold": True},
            f" {value['title.name']}"
        ]
        show_display = build_display(
            title=show_title,
            description=value.get('description', ''),
            icon=value.get('icon', {"id": "minecraft:flint"}),
            hidden=True,
            frame="challenge",
            strikethrough=False,
            announce=False
        )
        criteria = build_criteria(custom_criteria)
        show = {
            "display": show_display,
            "parent": show_parent,
            "criteria": criteria,
            "rewards": {"function": f"age:task/{age}/main/{index}_complete"}
        }
        results[f"{age}/phase_{index}.json"] = show

    else:
        # ===== 普通任务：生成解锁器 + 展示进度 =====

        # ----- 解锁器 -----
        unlocker_title = [
            "",
            {"text": f"阶段{index}:", "color": "green", "bold": True},
            f" {value['title.name']} - 任务已发布"
        ]
        unlocker_parent = f"age:{age}/phase_{parent_index}" if parent_index else f"age:{age}/root"
        unlocker = {
            "display": {
                "title": unlocker_title,
                "description": value.get('description', ''),
                "icon": value.get('icon', {"id": "minecraft:flint"}),
                "hidden": False,
                "show_toast": True,
                "announce_to_chat": False
            },
            "parent": unlocker_parent,
            "criteria": {
                "unlock": {
                    "trigger": "minecraft:impossible"
                }
            },
            "rewards": {
                "function": f"age:task/{age}/main/{index}_unlock"
            }
        }

        # ----- 展示进度 -----
        show_title = [
            "",
            {"text": f"阶段{index}:", "color": "green", "bold": True},
            f" {value['title.name']}"
        ]
        show_display = build_display(
            title=show_title,
            description=value.get('description', ''),
            icon=value.get('icon', {"id": "minecraft:flint"}),
            hidden=True,
            frame="goal",
            strikethrough=True,
            announce=False
        )
        # 展示进度使用自定义 criteria（如果有），否则默认 impossible
        criteria = build_criteria(custom_criteria)
        show = {
            "display": show_display,
            "parent": f"age:{age}/phase_{index}_unlocker",
            "criteria": criteria,
            "rewards": {"function": f"age:task/{age}/main/{index}_complete"}
        }

        results[f"{age}/phase_{index}_unlocker.json"] = unlocker
        results[f"{age}/phase_{index}.json"] = show

    # 递归子节点
    total = len(children)
    for i, child in enumerate(children, 1):
        child_index = generate_child_index(index, i, total)
        generate_main_nodes(child, child_index, index, age, results)

# ======================== 主函数 ========================

def main():
    if len(sys.argv) >= 2:
        input_file = Path(sys.argv[1])
    else:
        script_dir = Path(__file__).parent
        input_file = script_dir / "advencement.json"

    if not input_file.exists():
        print(f"❌ 找不到输入文件: {input_file}")
        print("用法: python advencement.py [path/to/advencement.json]")
        sys.exit(1)

    with open(input_file, "r", encoding="utf-8") as f:
        data = json.load(f)

    age_key = "old_stone_age"
    age_data = data[age_key]

    mappings = data.get("mappings", {})
    ages_map = mappings.get("ages", {})
    age_info = ages_map.get(age_key, {})
    age_text = age_info.get("text", "旧石器时代")
    age_color = age_info.get("color", "#424529")

    output_dir = Path("advancement")
    output_dir.mkdir(parents=True, exist_ok=True)

    # ===== 根进度 =====
    root_info = age_data.get("root", {})
    suffix = root_info.get("title.suffix", "文明萌芽")
    background_id = root_info.get("background", "stone")

    root_title_component = [
        {"text": age_text, "color": age_color},
        {"text": f"·{suffix}", "color": "green", "bold": True}
    ]
    root = {
        "display": {
            "title": root_title_component,
            "description": "完成所有主线任务，推动时代前进",
            "icon": root_info.get("icon", {"id": "minecraft:flint"}),
            "background": f"minecraft:block/{background_id}",
            "frame": "challenge",
            "show_toast": False,
            "announce_to_chat": False,
            "hidden": False
        },
        "criteria": {
            "granted": {
                "trigger": "minecraft:impossible"
            }
        },
        "rewards": {}
    }

    (output_dir / age_key).mkdir(parents=True, exist_ok=True)
    with open(output_dir / age_key / "root.json", "w", encoding="utf-8") as f:
        json.dump(root, f, indent=2, ensure_ascii=False)

    # ===== 分支根节点 =====
    branch_config = age_data.get("branch_root", {})
    branch_root = generate_branch_root(branch_config, age_key, age_text, age_color)
    with open(output_dir / age_key / "branch_root.json", "w", encoding="utf-8") as f:
        json.dump(branch_root, f, indent=2, ensure_ascii=False)

    # ===== 分支任务 =====
    branch_list = age_data.get("branch", [])
    for i, branch in enumerate(branch_list, 1):
        obj = generate_branch(branch, i, age_key)
        with open(output_dir / age_key / f"branch_{i}.json", "w", encoding="utf-8") as f:
            json.dump(obj, f, indent=2, ensure_ascii=False)

    # ===== 主线任务 =====
    main_data = age_data.get("main", {})
    main_value = main_data.get("value")
    main_child = main_data.get("child", [])

    if main_value:
        root_node = {"value": main_value, "child": main_child}
        results = {}
        generate_main_nodes(root_node, "1", None, age_key, results)

        for rel_path, obj in results.items():
            full_path = output_dir / rel_path
            full_path.parent.mkdir(parents=True, exist_ok=True)
            with open(full_path, "w", encoding="utf-8") as f:
                json.dump(obj, f, indent=2, ensure_ascii=False)

    print(f"✅ 所有进度文件已生成到 {output_dir}")

if __name__ == "__main__":
    main()
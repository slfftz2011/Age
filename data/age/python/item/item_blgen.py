import json
import os
import sys

# ---------- 工具函数 ----------
def load_tag_definitions(tags_folder):
    """
    递归读取 tags_folder/items/ 下所有 JSON 文件，构建标签名到物品列表的映射。
    标签名格式：命名空间:路径，例如 "minecraft:logs"
    """
    tags_dir = os.path.join(tags_folder, "item")
    if not os.path.isdir(tags_dir):
        raise ValueError(f"找不到 item 目录: {tags_dir}")

    tag_map = {}  # tag_name -> list of item ids (可能包含其他标签，需要后续展开)
    for root, dirs, files in os.walk(tags_dir):
        for file in files:
            if not file.endswith(".json"):
                continue
            full_path = os.path.join(root, file)
            # 相对路径作为命名空间:路径
            rel_path = os.path.relpath(full_path, tags_dir)  # e.g. "minecraft/logs.json"
            # 转换为命名空间:路径（去掉 .json）
            rel_path_no_ext = os.path.splitext(rel_path)[0]
            # 用 os.path.sep 替换为 ':'
            tag_name = rel_path_no_ext.replace(os.path.sep, ":")
            try:
                with open(full_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                values = data.get("values", [])
                # 确保每个条目是字符串
                tag_map[tag_name] = [str(v) for v in values]
            except Exception as e:
                print(f"警告: 解析 {full_path} 失败: {e}", file=sys.stderr)
                continue
    return tag_map

def expand_tag(tag_name, tag_map, visited=None):
    """
    递归展开一个标签，返回包含的物品 ID 集合。
    """
    if visited is None:
        visited = set()
    if tag_name in visited:
        # 防止循环引用
        return set()
    visited.add(tag_name)
    if tag_name not in tag_map:
        # 如果是未知标签，视为空集合
        print(f"警告: 标签 {tag_name} 未定义", file=sys.stderr)
        return set()

    result = set()
    for entry in tag_map[tag_name]:
        if entry.startswith("#"):
            # 递归展开子标签
            sub_tag = entry[1:]  # 去掉 '#'
            result.update(expand_tag(sub_tag, tag_map, visited))
        else:
            # 普通物品 ID
            result.add(entry)
    return result

def main():
    if len(sys.argv) < 5:   
        print("用法: python item_blgen.py <白名单文件> <标签文件夹> <输出黑名单文件> <all_items.json>")
        print("示例: python item_blgen.py old_stone_age.json ./tags banned.json all_items.json")
        sys.exit(1)

    whitelist_file = sys.argv[1]
    tags_folder = sys.argv[2]
    output_file = sys.argv[3]
    all_items_file = sys.argv[4]

    # ---- 新增：读取所有物品列表 ----
    try:
        with open(all_items_file, 'r', encoding='utf-8') as f:
            all_items_data = json.load(f)
        # 假设 all_items.json 顶层是一个列表
        if not isinstance(all_items_data, list):
            print("错误：all_items.json 的根元素必须是一个列表。", file=sys.stderr)
            sys.exit(1)
        # 转化为集合以备后续求差集，同时自动去重
        ALL_ITEMS = set(all_items_data)
        print(f"成功加载 {len(ALL_ITEMS)} 个物品。")
    except Exception as e:
        print(f"读取 all_items.json 失败: {e}", file=sys.stderr)
        sys.exit(1)

    # 读取白名单
    try:
        with open(whitelist_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
        whitelist_entries = data.get("values", [])
    except Exception as e:
        print(f"读取白名单失败: {e}", file=sys.stderr)
        sys.exit(1)

    # 加载标签定义
    try:
        tag_map = load_tag_definitions(tags_folder)
    except Exception as e:
        print(f"加载标签失败: {e}", file=sys.stderr)
        sys.exit(1)

    # 展开白名单中的所有标签，获得允许物品集合
    allowed = set()
    for entry in whitelist_entries:
        if not isinstance(entry, str):
            continue
        if entry.startswith("#"):
            tag = entry[1:]
            allowed.update(expand_tag(tag, tag_map))
        else:
            allowed.add(entry)

    # 从所有物品中减去允许的，得到黑名单
    banned = sorted(set(ALL_ITEMS) - allowed)   # 排序并去重（已经去重）

    # 输出黑名单
    output = {"values": banned}
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"生成黑名单成功: {output_file}")
    print(f"允许物品数: {len(allowed)}")
    print(f"黑名单物品数: {len(banned)}")

if __name__ == "__main__":
    main()
    
# 2785502678417124396
# python python/item/item_blgen.py tags/item/allow/old_stone_age.json python/item/tags tags/item/ban/old_stone_age.json
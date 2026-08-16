import json
import os
import sys

def load_item_whitelist(file_path):
    """加载物品白名单，返回物品ID集合（忽略标签）"""
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    ids = set()
    for entry in data.get('values', []):
        if isinstance(entry, str) and not entry.startswith('#'):
            if ':' not in entry:
                entry = f'minecraft:{entry}'
            ids.add(entry)
    return ids

def parse_recipe_file(file_path, base_dir):
    """
    解析一个配方文件，返回 (recipe_id, output_item_id)
    base_dir: recipes 文件夹的根路径（用于计算相对路径）
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        result = data.get('result')
        if not result:
            return None
        if isinstance(result, dict):
            item_id = result.get('id')
        else:
            item_id = result
        if ':' not in item_id:
            item_id = f'minecraft:{item_id}'

        # 计算相对路径作为配方 ID
        rel_path = os.path.relpath(file_path, base_dir)
        rel_path = rel_path.replace('\\', '/')  # Windows 兼容
        recipe_id = os.path.splitext(rel_path)[0]  # 去掉 .json
        # 确保有命名空间（如果路径没有，补上 minecraft:）
        if '/' in recipe_id:
            ns, path = recipe_id.split('/', 1)
            recipe_id = f'{ns}:{path}'
        else:
            recipe_id = f'minecraft:{recipe_id}'
        return recipe_id, item_id
    except Exception:
        return None


def main():
    if len(sys.argv) < 4:
        print("用法: python gen_blacklist_advanced.py <配方文件夹> <白名单物品文件> <输出白名单文件> [补充配方文件]")
        print("示例: python gen_blacklist_advanced.py ./recipes whitelist_item.json allow_recipes.json extra_recipes.json")
        sys.exit(1)

    # 配置路径
    recipes_folder = sys.argv[1]          # 原版 recipes 文件夹
    item_whitelist_file = sys.argv[2]
    if len(sys.argv) == 5:
        extra_recipes_file = sys.argv[4]# 手动补充配方（可选）
    output_file = sys.argv[3]

    # 加载物品白名单
    allowed_items = load_item_whitelist(item_whitelist_file)
    print(f"物品白名单数量: {len(allowed_items)}")

    if not os.path.isdir(recipes_folder):
        print(f"错误: 未找到配方目录 {recipes_folder}")
        print("请确保从原版数据包中提取了 recipes 文件夹，并放在当前目录下。")
        return

    # 遍历所有配方文件
    recipe_whitelist = set()
    for root, _, files in os.walk(recipes_folder):
        for file in files:
            if not file.endswith('.json'):
                continue
            file_path = os.path.join(root, file)
            parsed = parse_recipe_file(file_path, recipes_folder)
            if parsed is None:
                continue
            recipe_id, item_id = parsed
            if item_id in allowed_items:
                recipe_whitelist.add(recipe_id)

    print(f"通过配方解析得到的配方数量: {len(recipe_whitelist)}")

    # 加载额外手动添加的配方
    if len(sys.argv) == 5 and os.path.exists(extra_recipes_file):
        with open(extra_recipes_file, 'r', encoding='utf-8') as f:
            extra = json.load(f)
        for r in extra:
            recipe_whitelist.add(r)
        print(f"额外添加配方: {len(extra)} 个")

    # 输出排序后的白名单
    result = sorted(recipe_whitelist)
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)

    print(f"最终配方白名单已生成: {output_file}")
    print(f"共 {len(result)} 个配方。")

if __name__ == '__main__':
    main()
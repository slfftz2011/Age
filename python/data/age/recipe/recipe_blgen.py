import json
import argparse
from pathlib import Path
from typing import Set, List, Union, Optional

# ---------- 工具函数 ----------

def get_item_id(item_obj: Union[str, dict]) -> str:
    """从配方解析中提取物品 ID（或标签 ID）。"""
    if isinstance(item_obj, str):
        return item_obj
    if isinstance(item_obj, dict):
        if "id" in item_obj:
            return item_obj["id"]
        if "item" in item_obj:
            return item_obj["item"]
        if "tag" in item_obj:
            return f"#{item_obj['tag']}"
    raise ValueError(f"无法解析物品: {item_obj}")

def get_ingredients(recipe_data: dict) -> List[str]:
    """从配方数据中提取所有输入物品的 ID（包括标签）。"""
    ingredients = []
    if "key" in recipe_data:
        for value in recipe_data["key"].values():
            if isinstance(value, list):
                for item in value:
                    ingredients.append(get_item_id(item))
            else:
                ingredients.append(get_item_id(value))
    elif "ingredients" in recipe_data:
        ing_list = recipe_data["ingredients"]
        if isinstance(ing_list, list):
            for item in ing_list:
                if isinstance(item, list):
                    for sub in item:
                        ingredients.append(get_item_id(sub))
                else:
                    ingredients.append(get_item_id(item))
        else:
            ingredients.append(get_item_id(ing_list))
    elif "ingredient" in recipe_data:
        ing = recipe_data["ingredient"]
        if isinstance(ing, list):
            for item in ing:
                ingredients.append(get_item_id(item))
        else:
            ingredients.append(get_item_id(ing))
    return ingredients

def get_output_item(recipe_data: dict) -> Optional[str]:
    """提取输出物品的基础 ID（不带颜色/NBT）。"""
    result = recipe_data.get("result")
    if result is None:
        return None
    if isinstance(result, str):
        return result
    if isinstance(result, dict):
        if "id" in result:
            return result["id"]
        if "item" in result:
            return result["item"]
    return None

def get_recipe_type(recipe_data: dict) -> str:
    """获取配方类型。"""
    return recipe_data.get("type", "")

def normalize_id(item_id: str) -> str:
    """标准化物品 ID：确保有命名空间（默认为 minecraft:）"""
    if item_id.startswith("#"):
        return item_id
    if ":" not in item_id:
        return f"minecraft:{item_id}"
    return item_id

def load_list_file(file_path: str) -> Set[str]:
    """加载 JSON 列表或标签文件，返回标准化后的集合。"""
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    if isinstance(data, list):
        return {normalize_id(item) for item in data}
    elif isinstance(data, dict) and "values" in data:
        return {normalize_id(item) for item in data["values"]}
    else:
        raise ValueError(f"文件格式错误: {file_path}")

def is_dye_recipe(recipe_data: dict) -> bool:
    """判断是否为染色配方（armor_dye）。"""
    return get_recipe_type(recipe_data) == "minecraft:crafting_special_armordye"

def get_dye_result_items() -> Set[str]:
    """返回染色配方可能输出的物品列表（所有可染色的盔甲）。"""
    # 所有可染色盔甲的基础 ID
    return {
        "minecraft:leather_helmet",
        "minecraft:leather_chestplate",
        "minecraft:leather_leggings",
        "minecraft:leather_boots",
        "minecraft:wolf_armor",
        "minecraft:shulker_box",
    }

# ---------- 主处理 ----------

def main():
    parser = argparse.ArgumentParser(description='根据物品白名单和原版配方文件生成配方白名单')
    parser.add_argument('-r', '--recipe-list', required=True,
                        help='原版配方ID列表文件 (JSON数组)')
    parser.add_argument('-f', '--recipes-folder', required=True,
                        help='原版配方文件夹路径')
    parser.add_argument('-w', '--whitelist-items', required=True,
                        help='白名单物品列表文件')
    parser.add_argument('-b', '--blacklist-recipes', default=None,
                        help='额外黑名单配方列表文件')
    parser.add_argument('-o', '--output-whitelist', default='recipe_whitelist.json',
                        help='输出配方白名单文件')
    parser.add_argument('-g', '--gen-blacklist', action='store_true',
                        help='是否生成黑名单函数')
    parser.add_argument('-ob', '--output-blacklist', default='take_banned_recipes.mcfunction',
                        help='黑名单函数输出文件')
    parser.add_argument('--verbose', action='store_true',
                        help='显示详细排除信息')
    args = parser.parse_args()

    # 加载数据
    all_recipe_ids = load_list_file(args.recipe_list)
    whitelist_items = load_list_file(args.whitelist_items)
    blacklist_recipes = set()
    if args.blacklist_recipes:
        try:
            blacklist_recipes = load_list_file(args.blacklist_recipes)
        except FileNotFoundError:
            print(f"警告：黑名单文件 {args.blacklist_recipes} 不存在")

    print(f"总配方数: {len(all_recipe_ids)}")
    print(f"白名单物品/标签数: {len(whitelist_items)}")
    print(f"额外黑名单配方数: {len(blacklist_recipes)}")

    # 统计
    skipped_input = []
    skipped_output = []
    skipped_blacklist = []
    skipped_no_output = []
    skipped_not_found = []
    recipe_whitelist = set()
    dye_whitelist = get_dye_result_items()

    recipes_folder_path = Path(args.recipes_folder)
    if not recipes_folder_path.exists():
        print(f"错误：配方文件夹 {args.recipes_folder} 不存在")
        return

    for recipe_id in all_recipe_ids:
        # 定位配方文件
        if ":" in recipe_id:
            namespace, path = recipe_id.split(":", 1)
        else:
            namespace = "minecraft"
            path = recipe_id
        recipe_file = recipes_folder_path / namespace / f"{path}.json"

        if not recipe_file.exists():
            skipped_not_found.append(recipe_id)
            continue

        try:
            with open(recipe_file, 'r', encoding='utf-8') as f:
                recipe_data = json.load(f)
        except Exception as e:
            print(f"警告：无法解析 {recipe_file}: {e}")
            continue

        # 特殊处理：染色配方（armor_dye）
        if is_dye_recipe(recipe_data):
            # 染色配方的输入是盔甲+染料，输出是染色后的盔甲
            # 只要输出（任意染色盔甲）在白名单中，且输入（盔甲+染料）在白名单中
            ingredients = get_ingredients(recipe_data)
            # 检查输入是否在白名单中
            all_input_ok = all(ing in whitelist_items for ing in ingredients)
            # 检查输出是否在白名单中（染色盔甲的基础ID）
            if all_input_ok:
                # 检查是否有任何一个染色输出在白名单中
                dye_output_ok = any(item in whitelist_items for item in dye_whitelist)
                if dye_output_ok and recipe_id not in blacklist_recipes:
                    recipe_whitelist.add(recipe_id)
                else:
                    if not dye_output_ok:
                        skipped_output.append(recipe_id)
                    elif recipe_id in blacklist_recipes:
                        skipped_blacklist.append(recipe_id)
            else:
                skipped_input.append(recipe_id)
            continue

        # 普通配方处理
        ingredients = get_ingredients(recipe_data)
        output = get_output_item(recipe_data)

        if output is None:
            skipped_no_output.append(recipe_id)
            continue

        output = normalize_id(output)
        all_input_ok = all(ing in whitelist_items for ing in ingredients)
        output_ok = (output in whitelist_items)
        in_blacklist = (recipe_id in blacklist_recipes)

        if all_input_ok and output_ok and not in_blacklist:
            recipe_whitelist.add(recipe_id)
        else:
            if not all_input_ok:
                skipped_input.append(recipe_id)
            elif not output_ok:
                skipped_output.append(recipe_id)
            elif in_blacklist:
                skipped_blacklist.append(recipe_id)

    # 输出统计
    print(f"\n📊 统计结果:")
    print(f"  ✅ 白名单配方: {len(recipe_whitelist)}")
    print(f"  ❌ 因输入不在白名单跳过: {len(skipped_input)}")
    print(f"  ❌ 因输出不在白名单跳过: {len(skipped_output)}")
    print(f"  ❌ 因黑名单跳过: {len(skipped_blacklist)}")
    print(f"  ⚠️ 无输出: {len(skipped_no_output)}")
    print(f"  ⚠️ 配方文件不存在: {len(skipped_not_found)}")

    if args.verbose:
        if skipped_input:
            print(f"\n输入不在白名单的配方示例: {skipped_input[:10]}")
        if skipped_output:
            print(f"输出不在白名单的配方示例: {skipped_output[:10]}")
        if skipped_blacklist:
            print(f"黑名单配方示例: {skipped_blacklist[:10]}")

    # 输出配方白名单
    with open(args.output_whitelist, 'w', encoding='utf-8') as f:
        json.dump(sorted(recipe_whitelist), f, indent=2, ensure_ascii=False)
    print(f"\n✅ 配方白名单已保存至 {args.output_whitelist}")

    # 生成黑名单函数
    if args.gen_blacklist:
        banned = sorted(all_recipe_ids - recipe_whitelist)
        with open(args.output_blacklist, 'w', encoding='utf-8') as f:
            f.write('# 黑名单配方锁定（由脚本生成）\n')
            f.write(f'# 总数: {len(banned)}\n')
            for recipe_id in banned:
                f.write(f'recipe take @s {recipe_id}\n')
        print(f"✅ 黑名单函数已生成 {args.output_blacklist}")

if __name__ == "__main__":
    main()
    
# python python/recipe/recipe_blgen.py -r python/recipe/recipes.json -f python/recipe/recipes -w tags/item/allow/old_stone_age.json -b python/recipe/extra.json -o python/recipe/allow_recipes.json -g -ob function/recipe_take/old_stone_age.mcfunction
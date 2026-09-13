import json
import os


# 12 种木材类型的基础 ID 前缀
WOOD_TYPES = [
    "oak", "spruce", "birch", "jungle", "acacia", "dark_oak",
    "mangrove", "cherry", "pale_oak",
    "crimson", "warped", "bamboo"
]

# 每种木材类型对应的 18 个方块 ID 后缀（已补充 wall_hanging_sign 和 shelf）
BLOCK_SUFFIXES = [
    "log", "wood", "stripped_log", "stripped_wood",
    "planks", "stairs", "slab", "fence", "fence_gate",
    "door", "trapdoor", "button", "pressure_plate",
    "sign", "wall_sign", "hanging_sign", "wall_hanging_sign",
    "shelf"
]

# 特殊映射：下界木材和竹块使用不同的后缀
SPECIAL_SUFFIX_MAP = {
    "crimson": {
        "log": "stem",
        "wood": "hyphae",
        "stripped_log": "stripped_stem",
        "stripped_wood": "stripped_hyphae"
    },
    "warped": {
        "log": "stem",
        "wood": "hyphae",
        "stripped_log": "stripped_stem",
        "stripped_wood": "stripped_hyphae"
    },
    "bamboo": {
        "log": "block",
        "wood": "block",           # 竹块没有独立的 wood 变体
        "stripped_log": "stripped_block",
        "stripped_wood": "stripped_block"
    }
}

# 战利品表 JSON 模板
LOOT_TABLE_TEMPLATE = {
    "type": "minecraft:block",
    "pools": [
        {
            "rolls": 1,
            "conditions": [
                {
                    "condition": "minecraft:match_tool",
                    "predicate": {
                        "items": "#minecraft:axes"
                    }
                }
            ],
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:{block_id}"
                }
            ]
        }
    ]
}

def get_block_id(wood_type, suffix):
    """根据木材类型和后缀生成完整的方块 ID。"""
    special = SPECIAL_SUFFIX_MAP.get(wood_type, {})
    actual_suffix = special.get(suffix, suffix)
    if actual_suffix.startswith("stripped_"):
        base = actual_suffix[len("stripped_"):]
        return f"stripped_{wood_type}_{base}"
    else:
        return f"{wood_type}_{actual_suffix}"


def main():
    loot_dir = os.path.join("data", "minecraft", "loot_table", "blocks")
    os.makedirs(loot_dir, exist_ok=True)

    count = 0
    for wood_type in WOOD_TYPES:
        for suffix in BLOCK_SUFFIXES:
            block_id = get_block_id(wood_type, suffix)
            loot_table = json.loads(json.dumps(LOOT_TABLE_TEMPLATE))
            loot_table["pools"][0]["entries"][0]["name"] = f"minecraft:{block_id}"

            file_path = os.path.join(loot_dir, f"{block_id}.json")
            with open(file_path, "w", encoding="utf-8") as f:
                json.dump(loot_table, f, indent=2, ensure_ascii=False)

            count += 1
            print(f"已生成: {block_id}.json")

    print(f"\n完成！共生成 {count} 个战利品表文件，输出目录: {loot_dir}")

if __name__ == "__main__":
    main()
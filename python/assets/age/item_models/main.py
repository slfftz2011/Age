#!/usr/bin/env python3
"""
自动扫描纹理文件，生成对应的模型和物品定义文件。
适用于 Minecraft 1.21.4+ 的 item_model 组件系统。

推荐用法（按目录分类，前缀自动剥离）：
  textures/item/handheld/sword.png -> models/item/sword.json  (handheld)
  textures/item/generated/apple.png -> models/item/apple.json  (generated)
  textures/item/misc/foo.png        -> models/item/misc/foo.json (默认 parent)
"""

import argparse
import fnmatch
import json
from pathlib import Path

PARENT_GENERATED = "minecraft:item/generated"
PARENT_HANDHELD = "minecraft:item/handheld"


def flatten(nested):
    return [item for sub in nested for item in sub]


def generate_model(namespace, texture_path, parent):
    return {
        "parent": parent,
        "textures": {"layer0": f"{namespace}:{texture_path}"},
    }


def generate_item_model(namespace, model_path):
    return {
        "model": {
            "type": "minecraft:model",
            "model": f"{namespace}:{model_path}",
        }
    }


def scan_textures(textures_dir):
    if not textures_dir.exists():
        print(f"⚠️ 纹理目录不存在: {textures_dir}")
        return []
    return sorted(
        png.relative_to(textures_dir).with_suffix("").as_posix()
        for png in textures_dir.rglob("*.png")
    )


def build_dir_rules(handheld_dirs, generated_dirs):
    rules = []
    for d in handheld_dirs:
        d = d.strip("/")
        if d:
            rules.append((d, PARENT_HANDHELD))
    for d in generated_dirs:
        d = d.strip("/")
        if d:
            rules.append((d, PARENT_GENERATED))
    # 长前缀优先，处理嵌套目录（如 a 与 a/b）
    rules.sort(key=lambda x: len(x[0]), reverse=True)
    return rules


def build_glob_rules(handheld_globs, generated_globs):
    # generated 优先于 handheld
    rules = [(g, PARENT_GENERATED) for g in generated_globs]
    rules += [(g, PARENT_HANDHELD) for g in handheld_globs]
    return rules


def classify(tex_path, dir_rules, glob_rules):
    """
    返回 (model_rel, parent_or_None)
    - 目录规则命中：剥离前缀，返回剩余路径
    - glob 规则命中：路径不变
    - 都未命中：路径不变，parent=None（调用方用默认）
    """
    for prefix, parent in dir_rules:
        if tex_path.startswith(prefix + "/"):
            return tex_path[len(prefix) + 1:], parent
    for pattern, parent in glob_rules:
        if fnmatch.fnmatch(tex_path, pattern):
            return tex_path, parent
    return tex_path, None


def main():
    parser = argparse.ArgumentParser(
        description="扫描纹理并自动生成模型和物品定义文件（Minecraft 1.21.4+）",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "示例：\n"
            "  # 推荐：按目录分类，前缀自动剥离\n"
            "  %(prog)s -n age --handheld-dir handheld --generated-dir generated\n"
            "       textures/item/handheld/sword.png -> models/item/sword.json (handheld)\n"
            "       textures/item/generated/apple.png -> models/item/apple.json (generated)\n"
            "       textures/item/misc/foo.png        -> models/item/misc/foo.json (默认)\n"
            "\n"
            "  # 兼容旧用法：glob 匹配（不剥离前缀）\n"
            "  %(prog)s -n age --handheld 'tools/*' 'weapons/*'\n"
        ),
    )
    parser.add_argument("-n", "--namespace", required=True, help="命名空间，例如 age")
    parser.add_argument(
        "-r", "--resource-root", default=".",
        help="资源包根目录（包含 assets/ 的目录），默认为当前目录",
    )
    parser.add_argument(
        "--parent", default=PARENT_GENERATED,
        help=f"未命中任何规则的纹理使用的父模型（默认 {PARENT_GENERATED}）",
    )
    parser.add_argument("--texture-subdir", default="item", help="纹理子目录，默认 'item'")
    parser.add_argument(
        "--block", action="store_true",
        help="方块模式（父模型 minecraft:block/cube_all，纹理路径 block/）",
    )
    parser.add_argument(
        "--handheld-dir", action="append", default=[], metavar="DIR",
        help="此目录下的纹理剥离前缀并使用 minecraft:item/handheld；可多次指定",
    )
    parser.add_argument(
        "--generated-dir", action="append", default=[], metavar="DIR",
        help="此目录下的纹理剥离前缀并使用 minecraft:item/generated；可多次指定",
    )
    parser.add_argument(
        "--handheld", action="append", default=[], nargs="+", metavar="PATTERN",
        help="[兼容] glob 匹配，命中则 handheld，不剥离路径；可多次指定",
    )
    parser.add_argument(
        "--generated", action="append", default=[], nargs="+", metavar="PATTERN",
        help="[兼容] glob 匹配，命中则强制 generated，不剥离；优先级高于 --handheld",
    )
    parser.add_argument("--force", action="store_true", help="覆盖已存在的文件")
    parser.add_argument("--dry-run", action="store_true", help="只显示，不写入")
    parser.add_argument("--no-items", action="store_true", help="不生成 items/ 定义文件")
    args = parser.parse_args()

    handheld_dirs = list(args.handheld_dir)
    generated_dirs = list(args.generated_dir)
    handheld_globs = flatten(args.handheld)
    generated_globs = flatten(args.generated)

    if args.block:
        args.parent = "minecraft:block/cube_all"
        args.texture_subdir = "block"
        if handheld_dirs or generated_dirs or handheld_globs or generated_globs:
            print("⚠️ --block 模式下所有分类参数将被忽略")
            handheld_dirs = []
            generated_dirs = []
            handheld_globs = []
            generated_globs = []

    dir_rules = build_dir_rules(handheld_dirs, generated_dirs)
    glob_rules = build_glob_rules(handheld_globs, generated_globs)

    resource_root = Path(args.resource_root).resolve()
    assets_dir = resource_root / "assets" / args.namespace
    textures_dir = assets_dir / "textures" / args.texture_subdir
    models_dir = assets_dir / "models" / args.texture_subdir
    items_dir = assets_dir / "items"

    print(f"📁 资源包根目录: {resource_root}")
    print(f"📁 命名空间: {args.namespace}")
    print(f"📁 纹理目录: {textures_dir}")
    print(f"📁 模型目录: {models_dir}")
    if not args.no_items:
        print(f"📁 物品定义目录: {items_dir}")
    print(f"🔧 默认父模型: {args.parent}")
    if dir_rules:
        print("🔧 目录规则（前缀剥离）:")
        for prefix, parent in dir_rules:
            print(f"     {prefix}/ -> {parent}")
    if glob_rules:
        print("🔧 Glob 规则（不剥离）:")
        for pattern, parent in glob_rules:
            print(f"     {pattern} -> {parent}")
    print()

    textures = scan_textures(textures_dir)
    if not textures:
        print("❌ 没有找到任何纹理文件")
        return

    print(f"🔍 找到 {len(textures)} 个纹理文件\n")

    created_models = 0
    created_items = 0
    skipped_models = 0
    skipped_items = 0
    parent_stats = {}

    for tex_path in textures:
        model_rel, matched_parent = classify(tex_path, dir_rules, glob_rules)
        parent = matched_parent or args.parent
        parent_stats[parent] = parent_stats.get(parent, 0) + 1

        model_file = models_dir / f"{model_rel}.json"
        item_file = items_dir / f"{model_rel}.json"

        # layer0 用原始 tex_path（含 parent），模型/items 路径用 model_rel（剥离 parent）
        model_data = generate_model(
            args.namespace,
            f"{args.texture_subdir}/{tex_path}",
            parent,
        )
        item_data = generate_item_model(
            args.namespace,
            f"{args.texture_subdir}/{model_rel}",
        )

        stripped = tex_path != model_rel
        note = f"(tex: {args.texture_subdir}/{tex_path})" if stripped else ""

        if model_file.exists() and not args.force:
            skipped_models += 1
            if args.dry_run:
                print(f"[DRY] 跳过（已存在）: {model_file.relative_to(resource_root)}")
        else:
            if args.dry_run:
                msg = f"[DRY] 模型: {model_file.relative_to(resource_root)} -> {parent}"
                if note:
                    msg += f" {note}"
                print(msg)
            else:
                model_file.parent.mkdir(parents=True, exist_ok=True)
                with open(model_file, "w", encoding="utf-8") as f:
                    json.dump(model_data, f, indent=2, ensure_ascii=False)
                created_models += 1

        if not args.no_items:
            if item_file.exists() and not args.force:
                skipped_items += 1
                if args.dry_run:
                    print(f"[DRY] 跳过（已存在）: {item_file.relative_to(resource_root)}")
            else:
                if args.dry_run:
                    print(f"[DRY] 物品: {item_file.relative_to(resource_root)}")
                else:
                    item_file.parent.mkdir(parents=True, exist_ok=True)
                    with open(item_file, "w", encoding="utf-8") as f:
                        json.dump(item_data, f, indent=2, ensure_ascii=False)
                    created_items += 1


if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""
自动扫描纹理文件，生成对应的模型和物品定义文件。
适用于 Minecraft 1.21.4+ 的 item_model 组件系统。
"""

import argparse
import json
from pathlib import Path

def generate_model(namespace: str, texture_path: str, parent: str = "minecraft:item/generated"):
    """
    生成模型 JSON 内容。
    texture_path: 相对于命名空间的纹理路径，如 "item/chopper"
    """
    return {
        "parent": parent,
        "textures": {
            "layer0": f"{namespace}:{texture_path}"
        }
    }

def generate_item_model(namespace: str, model_path: str):
    """
    生成物品定义 JSON 内容（1.21.4+ 的 items/ 格式）。
    model_path: 相对于命名空间的模型路径，如 "item/chopper"
    """
    return {
        "model": {
            "type": "minecraft:model",
            "model": f"{namespace}:{model_path}"
        }
    }

def scan_textures(textures_dir: Path, namespace: str):
    """
    扫描纹理目录，返回所有 .png 文件的相对路径（不含扩展名）。
    例如：textures/item/chopper.png -> "item/chopper"
    """
    results = []
    if not textures_dir.exists():
        print(f"⚠️ 纹理目录不存在: {textures_dir}")
        return results

    for png in textures_dir.rglob("*.png"):
        rel = png.relative_to(textures_dir)
        # 去掉 .png 后缀
        rel_no_ext = rel.with_suffix("")
        # 转为 POSIX 路径（用 / 分隔）
        rel_str = rel_no_ext.as_posix()
        results.append(rel_str)

    return sorted(results)

def main():
    parser = argparse.ArgumentParser(
        description="扫描纹理并自动生成模型和物品定义文件（Minecraft 1.21.4+）"
    )
    parser.add_argument(
        "-n", "--namespace", required=True,
        help="命名空间，例如 age"
    )
    parser.add_argument(
        "-r", "--resource-root", default=".",
        help="资源包根目录（包含 assets/ 的目录），默认为当前目录"
    )
    parser.add_argument(
        "--parent", default="minecraft:item/generated",
        help="模型父级，物品用 'minecraft:item/generated'，方块用 'minecraft:block/cube_all'"
    )
    parser.add_argument(
        "--texture-subdir", default="item",
        help="纹理子目录，默认 'item'（对应 textures/item/）"
    )
    parser.add_argument(
        "--block", action="store_true",
        help="使用方块模式（父模型为 minecraft:block/cube_all，纹理路径为 block/）"
    )
    parser.add_argument(
        "--force", action="store_true",
        help="覆盖已存在的文件"
    )
    parser.add_argument(
        "--dry-run", action="store_true",
        help="只显示将要生成的文件，不实际写入"
    )
    parser.add_argument(
        "--no-items", action="store_true",
        help="不生成 items/ 定义文件（只生成 models/）"
    )
    args = parser.parse_args()

    # 处理方块模式
    if args.block:
        args.parent = "minecraft:block/cube_all"
        args.texture_subdir = "block"

    # 路径配置
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
    print()

    # 扫描纹理
    textures = scan_textures(textures_dir, args.namespace)
    if not textures:
        print("❌ 没有找到任何纹理文件")
        return

    print(f"🔍 找到 {len(textures)} 个纹理文件\n")

    # 统计
    created_models = 0
    created_items = 0
    skipped_models = 0
    skipped_items = 0

    for tex_path in textures:
        # tex_path 形如 "item/chopper" 或 "item/tools/axe"
        # 去掉最前面的 "item/" 或 "block/" 前缀
        prefix = args.texture_subdir + "/"
        if tex_path.startswith(prefix):
            model_rel = tex_path[len(prefix):]  # "chopper" 或 "tools/axe"
        else:
            model_rel = tex_path

        # 模型文件路径
        model_file = models_dir / f"{model_rel}.json"
        # 物品定义文件路径
        item_file = items_dir / f"{model_rel}.json"

        # 模型内容
        model_data = generate_model(
            args.namespace,
            f"{args.texture_subdir}/{model_rel}",
            args.parent
        )

        # 物品定义内容
        item_data = generate_item_model(
            args.namespace,
            f"{args.texture_subdir}/{model_rel}"
        )

        # 写入模型
        if model_file.exists() and not args.force:
            skipped_models += 1
        else:
            if args.dry_run:
                print(f"[DRY] 模型: {model_file.relative_to(resource_root)}")
            else:
                model_file.parent.mkdir(parents=True, exist_ok=True)
                with open(model_file, "w", encoding="utf-8") as f:
                    json.dump(model_data, f, indent=2, ensure_ascii=False)
                created_models += 1

        # 写入物品定义
        if not args.no_items:
            if item_file.exists() and not args.force:
                skipped_items += 1
            else:
                if args.dry_run:
                    print(f"[DRY] 物品: {item_file.relative_to(resource_root)}")
                else:
                    item_file.parent.mkdir(parents=True, exist_ok=True)
                    with open(item_file, "w", encoding="utf-8") as f:
                        json.dump(item_data, f, indent=2, ensure_ascii=False)
                    created_items += 1

    print()
    print("=" * 50)
    print(f"✅ 完成")
    print(f"   模型: 新建 {created_models}，跳过 {skipped_models}")
    if not args.no_items:
        print(f"   物品: 新建 {created_items}，跳过 {skipped_items}")
    print("=" * 50)

if __name__ == "__main__":
    main()
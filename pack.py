#!/usr/bin/env python3
"""
Minecraft 数据包打包工具（支持宏替换）
用法: python pack.py
将从 defines.yml 读取宏定义，替换占位符，打包成 Age-<VERSION>.zip
"""

import os
import sys
import zipfile
import re
import yaml
from pathlib import Path

# ===== 配置 =====
EXTENSIONS = {'.json', '.mcfunction', '.nbt'}          # 只打包这些后缀的文件
KEEP_FILES = {'README', 'LICENSE', 'pack.mcmeta'}     # 根目录下必须保留的文件（无论后缀）
IGNORE_DIRS = {'python', '__pycache__', '.git'}       # 忽略的目录名
OUTPUT_DIR = 'output'                                  # 输出目录
MACRO_FILE = 'defines.yml'                             # 宏定义文件（位于根目录）

# ===== 工具函数 =====
def should_ignore(path_parts):
    """检查路径中是否包含需要忽略的目录"""
    for part in path_parts:
        if part in IGNORE_DIRS:
            return True
    return False

def clean_mcfunction(content):
    """删除 .mcfunction 中的注释行（以 # 开头）和空行"""
    lines = content.splitlines()
    cleaned = []
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('#'):
            continue
        if stripped == '':
            continue
        cleaned.append(line)
    return '\n'.join(cleaned)

def replace_macros(content, macros):
    """替换内容中的宏占位符（如 @VERSION@ -> 实际值）"""
    if not macros:
        return content
    # 按长度降序排序，避免部分匹配问题
    for key in sorted(macros.keys(), key=len, reverse=True):
        pattern = re.escape(f'@{key}@')
        content = re.sub(pattern, str(macros[key]), content)
    return content

def collect_files(source_dir):
    """遍历目录，收集需要打包的文件"""
    source = Path(source_dir).resolve()
    files = []
    for root, dirs, files_list in os.walk(source):
        root_path = Path(root)
        rel_root = root_path.relative_to(source)
        if should_ignore(rel_root.parts):
            continue
        for name in files_list:
            file_path = root_path / name
            rel_path = file_path.relative_to(source)
            if should_ignore(rel_path.parts):
                continue
            # 根目录下的保留文件
            if len(rel_path.parts) == 1 and name in KEEP_FILES:
                files.append(file_path)
                continue
            # data 目录下允许的扩展名
            if rel_path.parts[0] == 'data' and file_path.suffix.lower() in EXTENSIONS:
                files.append(file_path)
    return files

def pack(source_dir, output_zip, macros):
    source = Path(source_dir).resolve()
    files = collect_files(source)
    if not files:
        print("警告：没有找到任何符合规则的文件，将只打包空压缩包。")
    
    # 确保输出目录存在
    output_path = Path(output_zip).parent
    output_path.mkdir(parents=True, exist_ok=True)
    
    with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for file_path in files:
            arcname = file_path.relative_to(source)
            # 判断是否需要宏替换（仅对 .mcfunction 和 .json）
            if file_path.suffix.lower() in {'.mcfunction', '.json'}:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                # 如果为 mcfunction，先清理注释
                if file_path.suffix.lower() == '.mcfunction':
                    content = clean_mcfunction(content)
                # 替换宏
                content = replace_macros(content, macros)
                zipf.writestr(str(arcname), content)
            else:
                # .nbt 或其他文件直接复制（不处理宏）
                zipf.write(file_path, arcname)
    print(f"打包完成：{output_zip} (共 {len(files)} 个文件)")

def load_macros(source_dir):
    """从 defines.yml 加载宏定义"""
    macro_path = Path(source_dir) / MACRO_FILE
    if not macro_path.exists():
        print(f"警告：未找到宏定义文件 {MACRO_FILE}，将使用空宏。")
        return {}
    try:
        with open(macro_path, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f) or {}
        # 只保留字符串或数字类型的值（可转为字符串）
        macros = {}
        for k, v in data.items():
            if isinstance(v, (str, int, float)):
                macros[k] = str(v)
        return macros
    except Exception as e:
        print(f"错误：读取 {MACRO_FILE} 失败：{e}")
        sys.exit(1)

# ===== 命令行入口 =====
if __name__ == '__main__':
    # 默认当前目录为源目录
    src_dir = '.'
    source = Path(src_dir).resolve()
    
    # 加载宏定义
    macros = load_macros(source)
    
    # 确定版本号（用于文件名）
    version = macros.get('VERSION', '0.0.0')
    zip_name = f"Age-{version}.zip"
    output_zip = Path(OUTPUT_DIR) / zip_name
    
    # 执行打包
    pack(src_dir, str(output_zip), macros)
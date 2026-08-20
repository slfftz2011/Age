#!/usr/bin/env python3
"""
Minecraft 数据包打包工具（支持宏替换 + 命令 JSON 压缩）
"""

import os
import sys
import zipfile
import re
import json
import yaml
from pathlib import Path

EXTENSIONS = {'.json', '.mcfunction', '.nbt'}
KEEP_FILES = {'README', 'LICENSE', 'pack.mcmeta'}
IGNORE_DIRS = {'python', '__pycache__', '.git'}
OUTPUT_DIR = 'output'
MACRO_FILE = 'defines.yml'

# ===== 工具函数 =====

def should_ignore(path_parts):
    for part in path_parts:
        if part in IGNORE_DIRS:
            return True
    return False

def compress_json(content):
    try:
        data = json.loads(content)
        return json.dumps(data, ensure_ascii=False, separators=(',', ':'))
    except json.JSONDecodeError:
        return content

def compress_command_json(command):
    """
    如果命令包含 JSON 数组或对象，将其压缩为紧凑格式。
    """
    # 查找第一个 [ 或 { 的位置
    start = -1
    for i, ch in enumerate(command):
        if ch in '[{':
            start = i
            break
    if start == -1:
        return command

    # 从 start 开始计数括号，找到匹配的结束位置
    stack = []
    end = start
    for i in range(start, len(command)):
        ch = command[i]
        if ch in '[{':
            stack.append(ch)
        elif ch in ']}':
            if not stack:
                break
            expected = ']' if stack[-1] == '[' else '}'
            if ch == expected:
                stack.pop()
                if not stack:
                    end = i
                    break
            else:
                # 不匹配，继续
                pass
    if not stack and end > start:
        json_part = command[start:end+1]
        try:
            data = json.loads(json_part)
            compressed = json.dumps(data, ensure_ascii=False, separators=(',', ':'))
            new_command = command[:start] + compressed + command[end+1:]
            return new_command
        except json.JSONDecodeError:
            return command
    return command

def fold_multiline_commands(content):
    """
    将 .mcfunction 中跨多行的命令折叠为一行，并压缩其中的 JSON。
    改进：检测行中是否包含 tellraw/title/bossbar 等关键词，而不仅仅匹配行开头。
    """
    lines = content.splitlines()
    result = []
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        # 检测是否包含需要折叠的关键词
        # 匹配 tellraw、title、bossbar set ... name 等
        # 注意：使用 \b 确保是完整单词
        keywords = re.compile(r'\b(tellraw|title|bossbar\s+set\s+\S+\s+name)\s+')
        match = keywords.search(stripped)
        if not match:
            result.append(line)
            i += 1
            continue
        
        # 检查该行（或合并后）的括号是否未闭合
        # 由于该行可能已经包含 JSON 的一部分，我们需要检查括号平衡
        open_brackets = stripped.count('[') + stripped.count('{') + stripped.count('(')
        close_brackets = stripped.count(']') + stripped.count('}') + stripped.count(')')
        
        # 如果括号已经平衡且不以 [ 或 { 结尾，则不需要折叠
        if open_brackets == close_brackets and not (stripped.endswith('[') or stripped.endswith('{') or stripped.endswith('(')):
            result.append(line)
            i += 1
            continue
        
        # 否则，开始合并后续行直到括号闭合
        merged = line
        j = i + 1
        open_brackets = merged.count('[') + merged.count('{') + merged.count('(')
        close_brackets = merged.count(']') + merged.count('}') + merged.count(')')
        while j < len(lines) and open_brackets > close_brackets:
            next_line = lines[j].strip()
            # 如果下一行是注释，停止合并（注释不应出现在命令中间）
            if next_line.startswith('#'):
                break
            merged += ' ' + next_line
            open_brackets = merged.count('[') + merged.count('{') + merged.count('(')
            close_brackets = merged.count(']') + merged.count('}') + merged.count(')')
            j += 1
        
        # 如果合并后括号仍未闭合（可能文件不完整），则不折叠，保留原样
        if open_brackets != close_brackets:
            # 保持原行不变，但为了避免无限循环，我们将原行加入结果并跳过已合并的行？
            # 更安全：将合并后的内容原样加入，但可能导致语法错误，不过用户应当保证文件完整。
            # 这里我们直接将合并后的内容加入（可能不完整），但继续。
            result.append(merged)
            i = j
            continue
        
        # 合并后，压缩命令中的 JSON
        merged = compress_command_json(merged)
        result.append(merged)
        i = j
    
    return '\n'.join(result)

def clean_mcfunction(content):
    """删除注释行和空行，然后折叠多行命令"""
    lines = content.splitlines()
    cleaned = []
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('#'):
            continue
        if stripped == '':
            continue
        cleaned.append(line)
    content = '\n'.join(cleaned)
    content = fold_multiline_commands(content)
    return content

def replace_macros(content, macros):
    if not macros:
        return content
    for key in sorted(macros.keys(), key=len, reverse=True):
        pattern = re.escape(f'@{key}@')
        content = re.sub(pattern, str(macros[key]), content)
    return content

def collect_files(source_dir):
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
            if len(rel_path.parts) == 1 and name in KEEP_FILES:
                files.append(file_path)
                continue
            if rel_path.parts[0] == 'data' and file_path.suffix.lower() in EXTENSIONS:
                files.append(file_path)
    return files

def pack(source_dir, output_zip, macros):
    source = Path(source_dir).resolve()
    files = collect_files(source)
    if not files:
        print("警告：没有找到任何符合规则的文件。")
    output_path = Path(output_zip).parent
    output_path.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for file_path in files:
            arcname = file_path.relative_to(source)
            if file_path.suffix.lower() == '.mcfunction':
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                content = replace_macros(content, macros)
                content = clean_mcfunction(content)
                zipf.writestr(str(arcname), content)
            elif file_path.suffix.lower() == '.json':
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                content = replace_macros(content, macros)
                content = compress_json(content)
                zipf.writestr(str(arcname), content)
            else:
                zipf.write(file_path, arcname)
    print(f"打包完成：{output_zip} (共 {len(files)} 个文件)")

def load_macros(source_dir):
    macro_path = Path(source_dir) / MACRO_FILE
    if not macro_path.exists():
        print(f"警告：未找到 {MACRO_FILE}，将使用空宏。")
        return {}
    try:
        with open(macro_path, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f) or {}
        macros = {}
        for k, v in data.items():
            if isinstance(v, (str, int, float)):
                macros[k] = str(v)
        return macros
    except Exception as e:
        print(f"错误：读取 {MACRO_FILE} 失败：{e}")
        sys.exit(1)

if __name__ == '__main__':
    src_dir = '.'
    source = Path(src_dir).resolve()
    macros = load_macros(source)
    version = macros.get('VERSION', '0.0.0')
    zip_name = f"Age-{version}.zip"
    output_zip = Path(OUTPUT_DIR) / zip_name
    pack(src_dir, str(output_zip), macros)
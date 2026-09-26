
import os
import json
import argparse

def list_files(directory, recursive=False, full_path=False):
    """
    获取目录下的文件名列表。
    
    :param directory: 要扫描的目录路径
    :param recursive: 是否递归扫描子目录
    :param full_path: 是否返回完整路径（绝对路径或相对于当前工作目录）
    :return: 文件名列表
    """
    files = []
    if recursive:
        # 递归遍历所有子目录
        for root, dirs, filenames in os.walk(directory):
            for f in filenames:
                if full_path:
                    files.append(os.path.join(root, f))
                else:
                    # 仅返回文件名（不含路径），若需要相对路径可改用 os.path.relpath
                    files.append(f)
    else:
        # 只扫描当前目录
        for item in os.listdir(directory):
            item_path = os.path.join(directory, item)
            if os.path.isfile(item_path):
                files.append(item_path if full_path else item)
    return files

def main():
    parser = argparse.ArgumentParser(description='将目录中的文件名导出为 JSON 格式')
    parser.add_argument('dir', nargs='?', default='.',
                        help='要扫描的目录路径（默认为当前目录）')
    parser.add_argument('-r', '--recursive', action='store_true',
                        help='递归扫描子目录')
    parser.add_argument('-f', '--full-path', action='store_true',
                        help='输出文件的完整路径')
    parser.add_argument('-o', '--output', 
                        help='输出 JSON 文件路径（不指定则打印到终端）')
    args = parser.parse_args()

    # 获取文件列表
    file_list = list_files(args.dir, args.recursive, args.full_path)
    # 生成 JSON 字符串（带缩进便于阅读）
    json_str = json.dumps(file_list, indent=2, ensure_ascii=False)

    if args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            f.write(json_str)
        print(f"JSON 已保存至: {args.output}")
    else:
        print(json_str)

if __name__ == '__main__':
    main()
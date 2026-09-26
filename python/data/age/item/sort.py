import json
import sys

def main(input_file, output_file=None):
    try:
        # 读取 JSON 文件
        with open(input_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except FileNotFoundError:
        print(f"错误：文件 '{input_file}' 未找到。")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"错误：'{input_file}' 不是有效的 JSON 格式。")
        sys.exit(1)

    # 确保数据是一个列表
    if not isinstance(data, list):
        print("错误：JSON 根元素必须是列表。")
        sys.exit(1)

    # 去重（保持原有元素类型，假设均为可哈希的，如字符串）
    unique_items = list(set(data))

    # 按字母表排序（如果是字符串列表）
    # 如果元素是数字或其他类型，请根据实际情况调整排序键
    try:
        unique_items.sort()  # 原地排序，按字母顺序（对字符串有效）
    except TypeError:
        print("警告：列表中包含不可比较的类型，将使用默认排序（可能失败）。")
        # 可以自定义排序键，例如将元素转为字符串再比较
        unique_items.sort(key=lambda x: str(x))

    # 输出结果
    if output_file is None:
        # 如果未指定输出文件，则打印到标准输出
        print(json.dumps(unique_items, ensure_ascii=False, indent=2))
    else:
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(unique_items, f, ensure_ascii=False, indent=2)
        print(f"处理完成，结果已保存至 '{output_file}'。")

if __name__ == "__main__":
    # 用法：python sort.py input.json [output.json]
    if len(sys.argv) < 2:
        print("用法: python sort.py <输入JSON文件> [输出JSON文件]")
        print("  如果省略输出文件，结果将打印到控制台。")
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    main(input_file, output_file)
from PIL import Image

# 16x16 像素画
# . = 透明
# a = 深轮廓 / 阴影
# b = 暗灰斑块
# c = 暗灰
# d = 燧石主色
# f = 打制刃口高光
ROWS = [
    "................",
    "................",
    "......aaaa......",
    "....aaccccaa....",
    "...acddddddca...",
    "..acddbdddddca..",
    ".acddddbdddddca.",
    ".acddddddbdddffa",
    "acddbdddddddffa.",
    "acddddbddddffa..",
    ".acddbddddffa...",
    "..acddbddffa....",
    "...acdbdffa.....",
    "....acdffa......",
    ".....aafa.......",
    "......aa........",
]

# 参考原版燧石的灰阶配色
PALETTE = {
    ".": (0, 0, 0, 0),        # 透明
    "a": (28, 28, 28, 255),   # 轮廓/暗影
    "b": (45, 45, 45, 255),   # 暗斑
    "c": (60, 60, 60, 255),   # 暗灰
    "d": (78, 78, 78, 255),   # 燧石主色
    "f": (125, 125, 125, 255) # 刃口高光
}

img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
pixels = []

for row in ROWS:
    for ch in row:
        pixels.append(PALETTE[ch])

img.putdata(pixels)
img.save("chopper.png")

# 可选：生成一个放大预览图，方便查看
img.resize((256, 256), Image.NEAREST).save("chopper_preview.png")
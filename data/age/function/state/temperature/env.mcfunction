# ===== 计算环境温度（缩放值） =====

# 1. 基础温度 25°C → 50
scoreboard players set @s env_temp 50

# 2. 生物群系偏移（直接 add/remove 数字）
execute if predicate age:biome/freezing run scoreboard players remove @s env_temp 30   # 极寒 -15°C → -30
execute if predicate age:biome/cold run scoreboard players remove @s env_temp 15      # 寒冷 -7.5°C → -15
# 温和无偏移
execute if predicate age:biome/warm run scoreboard players add @s env_temp 15         # 温暖 +7.5°C → +15
execute if predicate age:biome/hot run scoreboard players add @s env_temp 30          # 炎热 +15°C → +30
execute if predicate age:biome/nether run scoreboard players add @s env_temp 20       # 下界 +10°C → +20

# 3. 湿度修正（根据当前温度方向）
# 热的地方湿度高更热，冷的地方湿度高更冷
scoreboard players set @s temp_humid_dir 0
execute if score @s env_temp matches 51.. run scoreboard players set @s temp_humid_dir 1
execute if score @s env_temp matches ..49 run scoreboard players set @s temp_humid_dir -1

execute if predicate age:biome/humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 5
execute if predicate age:biome/humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 5

execute if predicate age:biome/very_humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 8
execute if predicate age:biome/very_humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 8

# 4. 高度修正（Y > 80 每10格降低1缩放值，使用 operation /=）
execute store result score @s temp_y run data get entity @s Pos[1] 100
scoreboard players operation @s temp_height = @s temp_y
scoreboard players operation @s temp_height /= #height_div temperature.tmp   # 除以10
execute if score @s temp_y matches 81.. run scoreboard players remove @s env_temp @s temp_height

# 5. 限制范围 0~80
execute if score @s env_temp matches 81.. run scoreboard players set @s env_temp 80
execute if score @s env_temp matches ..-1 run scoreboard players set @s env_temp 0
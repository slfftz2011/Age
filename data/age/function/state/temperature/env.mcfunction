# ===== 计算环境温度（缩放值，范围 0~80） =====

# 1. 基础温度 25°C → 50
scoreboard players set @s env_temp 50

# 2. 生物群系偏移
execute if predicate age:biome/freezing run scoreboard players remove @s env_temp 30
execute if predicate age:biome/cold run scoreboard players remove @s env_temp 15
# 温和无偏移
execute if predicate age:biome/warm run scoreboard players add @s env_temp 15
execute if predicate age:biome/hot run scoreboard players add @s env_temp 30
execute if predicate age:biome/nether run scoreboard players add @s env_temp 20
execute if predicate age:biome/end run scoreboard players remove @s env_temp 20

# 3. 湿度修正（热时增，冷时减）
scoreboard players set @s temp_humid_dir 0
execute if score @s env_temp matches 51.. run scoreboard players set @s temp_humid_dir 1
execute if score @s env_temp matches ..49 run scoreboard players set @s temp_humid_dir -1

execute if predicate age:biome/humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 5
execute if predicate age:biome/humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 5

execute if predicate age:biome/very_humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 8
execute if predicate age:biome/very_humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 8

# 4. 天气修正
execute if predicate age:weather/is_raining run scoreboard players remove @s env_temp 5
execute if predicate age:weather/is_thundering run scoreboard players remove @s env_temp 3
execute if predicate age:weather/is_raining if predicate age:biome/freezing run scoreboard players remove @s env_temp 10

# 雨后效应（使用玩家个人晴朗计时器）
execute if predicate age:weather/is_clear if score @s weather_clear_timer matches 1..120 run scoreboard players remove @s env_temp 3
execute if predicate age:weather/is_clear if score @s weather_clear_timer matches 121..420 run scoreboard players add @s env_temp 2

# 5. 时间修正（一天内温度变化）
execute store result score @s time_of_day run time query daytime
scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 0..3000 run scoreboard players set @s time_offset -10
execute if score @s time_of_day matches 3001..6000 run scoreboard players set @s time_offset -5
execute if score @s time_of_day matches 6001..9000 run scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 9001..12000 run scoreboard players set @s time_offset 5
execute if score @s time_of_day matches 12001..15000 run scoreboard players set @s time_offset 10
execute if score @s time_of_day matches 15001..18000 run scoreboard players set @s time_offset 5
execute if score @s time_of_day matches 18001..21000 run scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 21001..24000 run scoreboard players set @s time_offset -5
scoreboard players operation @s env_temp += @s time_offset

# 白天/夜晚偏移
execute if score @s time_of_day matches 0..12000 run scoreboard players remove @s env_temp 2
execute if score @s time_of_day matches 12001..24000 run scoreboard players add @s env_temp 2

# 6. 高度修正（Y > 80 每10格降低1缩放值）
execute store result score @s temp_y run data get entity @s Pos[1] 100
scoreboard players operation @s temp_height = @s temp_y
scoreboard players operation @s temp_height /= #height_div temperature.tmp
execute if score @s temp_y matches 81.. run scoreboard players remove @s env_temp @s temp_height

# 7. 限制范围 0~80
execute if score @s env_temp matches 81.. run scoreboard players set @s env_temp 80
execute if score @s env_temp matches ..-1 run scoreboard players set @s env_temp 0
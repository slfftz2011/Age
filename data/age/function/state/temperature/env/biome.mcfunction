# ===== 生物群系偏移 =====

execute if predicate age:biome/freezing run scoreboard players remove @s env_temp 35
execute if predicate age:biome/cold run scoreboard players remove @s env_temp 18
execute if predicate age:biome/warm run scoreboard players add @s env_temp 10
execute if predicate age:biome/hot run scoreboard players add @s env_temp 22
execute if predicate age:biome/nether run scoreboard players add @s env_temp 25
execute if predicate age:biome/end run scoreboard players remove @s env_temp 15

# 湿度修正（热时增，冷时减）
scoreboard players set @s temp_humid_dir 0
execute if score @s env_temp matches 26.. run scoreboard players set @s temp_humid_dir 1
execute if score @s env_temp matches ..24 run scoreboard players set @s temp_humid_dir -1

execute if predicate age:biome/humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 4
execute if predicate age:biome/humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 4

execute if predicate age:biome/very_humid if score @s temp_humid_dir matches 1 run scoreboard players add @s env_temp 6
execute if predicate age:biome/very_humid if score @s temp_humid_dir matches -1 run scoreboard players remove @s env_temp 6
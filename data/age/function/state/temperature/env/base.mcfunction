# ===== 基础环境温度 =====

# 基础温度 30°C
scoreboard players set @s env_temp 30

# 时间修正
execute store result score @s time_of_day run time query daytime
scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 0..3000 run scoreboard players set @s time_offset -5
execute if score @s time_of_day matches 3001..6000 run scoreboard players set @s time_offset -2
execute if score @s time_of_day matches 6001..9000 run scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 9001..12000 run scoreboard players set @s time_offset 2
execute if score @s time_of_day matches 12001..15000 run scoreboard players set @s time_offset 5
execute if score @s time_of_day matches 15001..18000 run scoreboard players set @s time_offset 2
execute if score @s time_of_day matches 18001..21000 run scoreboard players set @s time_offset 0
execute if score @s time_of_day matches 21001..24000 run scoreboard players set @s time_offset -2
scoreboard players operation @s env_temp += @s time_offset

# 白天/夜晚偏移
execute if score @s time_of_day matches 0..12000 run scoreboard players remove @s env_temp 2
execute if score @s time_of_day matches 12001..24000 run scoreboard players add @s env_temp 2

# 高度修正（每10格降低1）
execute store result score @s temp_y run data get entity @s Pos[1] 100
scoreboard players operation @s temp_height = @s temp_y
scoreboard players operation @s temp_height /= #height_div temperature.tmp
execute if score @s temp_y matches 81.. run scoreboard players operation @s env_temp -= @s temp_height
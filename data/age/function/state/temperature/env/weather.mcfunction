# ===== 天气偏移 =====

execute if predicate age:weather/is_raining run scoreboard players remove @s env_temp 4
execute if predicate age:weather/is_thundering run scoreboard players remove @s env_temp 2
execute if predicate age:weather/is_raining if predicate age:biome/freezing run scoreboard players remove @s env_temp 8

# 雨后效应
execute if predicate age:weather/is_clear if score @s weather_clear_timer matches 1..120 run scoreboard players remove @s env_temp 2
execute if predicate age:weather/is_clear if score @s weather_clear_timer matches 121..420 run scoreboard players add @s env_temp 2
# ===== 每秒更新晴朗计时器 =====

# 如果天气晴朗，秒数 +1；否则重置为 0
execute if predicate age:weather/is_clear run scoreboard players add @s weather_clear_timer 1
execute unless predicate age:weather/is_clear run scoreboard players set @s weather_clear_timer 0
# ===== 每 tick 更新状态 =====

# 全局状态计时器（每秒重置）
scoreboard players add @a global_state_timer 1
execute as @a if score @s global_state_timer matches 20.. run scoreboard players set @s global_state_timer 0

# 秒级更新（当 global_state_timer 达到 20 时执行）
execute as @a if score @s global_state_timer matches 20.. run function age:state/temperature/weather_timer

# 温度计时器（每10 tick）
scoreboard players add @a temperature_timer 1
execute as @a if score @s temperature_timer matches 10.. run function age:state/temperature/update
execute as @a if score @s 
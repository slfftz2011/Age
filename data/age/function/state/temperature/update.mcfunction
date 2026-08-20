# ===== 体感温度平滑更新（每10 tick） =====

execute as @s run function age:state/temperature/env

# 1. 计算差值
scoreboard players operation @s temp_diff = @s env_temp
scoreboard players operation @s temp_diff -= @s temperature

# 2. 判断是否直接趋同（差值≤1）
execute if score @s temp_diff matches -1..1 run scoreboard players operation @s temperature = @s env_temp
execute if score @s temp_diff matches -1..1 run scoreboard players set @s temperature_delta 0

# 3. 否则，计算步长（变化量）
execute unless score @s temp_diff matches -1..1 run function age:state/temperature/step

# 4. 记录变化量（用于趋势判断）
scoreboard players operation @s temperature_delta = @s temperature
scoreboard players operation @s temperature_delta -= @s temperature_prev

# 5. 更新上次温度记录
scoreboard players operation @s temperature_prev = @s temperature

# 6. 判定趋势
scoreboard players set @s temperature_trend 0
execute if score @s temperature_delta matches 2.. run scoreboard players set @s temperature_trend 1
execute if score @s temperature_delta matches ..-2 run scoreboard players set @s temperature_trend -1

scoreboard players set @s temperature_timer 0
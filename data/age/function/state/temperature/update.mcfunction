# ===== 每10 tick 执行温度平滑更新 =====

function age:state/temperature/env

# 1. 计算差值 diff = env_temp - temperature
scoreboard players operation @s diff = @s env_temp
scoreboard players operation @s diff -= @s temperature

# 2. 若差值在 -1~1 之间，直接趋同并停止
execute if score @s diff matches -1..1 run scoreboard players set @s temperature_timer 0
execute if score @s diff matches -1..1 run scoreboard players operation @s temperature = @s env_temp
execute if score @s diff matches -1..1 run scoreboard players operation @s temperature_prev = @s temperature
execute if score @s diff matches -1..1 run scoreboard players set @s temperature_trend 0
execute if score @s diff matches -1..1 run return 0

# 3. 计算步长（只有差值超出 -1~1 时才会执行到这里）
scoreboard players operation @s step_abs = @s diff
execute if score @s diff matches ..-1 run scoreboard players operation @s step_abs *= #neg temperature.tmp
scoreboard players operation @s step_abs /= #two temperature.tmp
execute if score @s step_abs matches 0 run scoreboard players set @s step_abs 1

# 4. 应用步长
execute if score @s diff matches 1.. run scoreboard players operation @s temperature += @s step_abs
execute if score @s diff matches ..-1 run scoreboard players operation @s temperature -= @s step_abs

# 5. 限制温度范围 0~80
execute if score @s temperature matches 81.. run scoreboard players set @s temperature 80
execute if score @s temperature matches ..-1 run scoreboard players set @s temperature 0

# 6. 计算变化量
scoreboard players operation @s temperature_delta = @s temperature
scoreboard players operation @s temperature_delta -= @s temperature_prev

# 7. 更新上次温度
scoreboard players operation @s temperature_prev = @s temperature

# 8. 判定趋势
scoreboard players set @s temperature_trend 0
execute if score @s temperature_delta matches 2.. run scoreboard players set @s temperature_trend 1
execute if score @s temperature_delta matches ..-2 run scoreboard players set @s temperature_trend -1

scoreboard players set @s temperature_timer 0
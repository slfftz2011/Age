
# 1. 比较当前温度与上次温度，确定趋势
execute if score @s temperature > @s temperature_prev run scoreboard players set @s temperature_trend 1
execute if score @s temperature < @s temperature_prev run scoreboard players set @s temperature_trend -1
execute if score @s temperature = @s temperature_prev run scoreboard players set @s temperature_trend 0

# 2. 更新上次温度记录
scoreboard players operation @s temperature_prev = @s temperature

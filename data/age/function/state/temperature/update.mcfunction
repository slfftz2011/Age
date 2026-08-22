# ===== 每10 tick 更新体感温度 =====

# 1. 环境温度
function age:state/temperature/env

# 2. 热源/冷源修正（直接加减 env_temp）
function age:state/temperature/hot_cold

# 3. 铜套检测：直接赋值 temperature = env_temp 并返回（跳过装备修正和步长）
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players operation @s temperature = @s env_temp
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players set @s temp_trend 0
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players set @s temp_timer 0
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run return 0

# 4. 装备修正（非全铜才执行）
function age:state/temperature/equipment

# 5. 计算差值 diff = env_temp - temperature
scoreboard players operation @s temp_diff = @s env_temp
scoreboard players operation @s temp_diff -= @s temperature

# 6. 若差值在 -1~1 之间，直接趋同并停止
execute if score @s temp_diff matches -1..1 run scoreboard players set @s temp_timer 0
execute if score @s temp_diff matches -1..1 run scoreboard players operation @s temperature = @s env_temp
execute if score @s temp_diff matches -1..1 run scoreboard players operation @s temp_prev = @s temperature
execute if score @s temp_diff matches -1..1 run scoreboard players set @s temp_trend 0
execute if score @s temp_diff matches -1..1 run return 0

# 7. 计算步长 step_abs = max(1, floor(|diff|/2))
scoreboard players operation @s temp_step_abs = @s temp_diff
execute if score @s temp_diff matches ..-1 run scoreboard players operation @s temp_step_abs *= #neg temperature.tmp
scoreboard players operation @s temp_step_abs /= #two temperature.tmp
execute if score @s temp_step_abs matches 0 run scoreboard players set @s temp_step_abs 1

# 8. 应用步长
execute if score @s temp_diff matches 1.. run scoreboard players operation @s temperature += @s temp_step_abs
execute if score @s temp_diff matches ..-1 run scoreboard players operation @s temperature -= @s temp_step_abs

# 9. 限制温度范围 0~80
execute if score @s temperature matches 81.. run scoreboard players set @s temperature 80
execute if score @s temperature matches ..-1 run scoreboard players set @s temperature 0

# 10. 计算变化量
scoreboard players operation @s temp_delta = @s temperature
scoreboard players operation @s temp_delta -= @s temp_prev

# 11. 更新上次温度
execute if score @s temperature matches 72.. if score @s temp_prev matches 65..71 run function age:state/temperature/debuff/stroke

scoreboard players operation @s temp_prev = @s temperature

# 12. 判定趋势
scoreboard players set @s temp_trend 0
execute if score @s temp_delta matches 2.. run scoreboard players set @s temp_trend 1
execute if score @s temp_delta matches ..-2 run scoreboard players set @s temp_trend -1

# 13. 重置计时器
scoreboard players set @s temp_timer 0
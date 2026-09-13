# ===== 每10 tick 更新体感温度 =====

# 0. 先应用上个周期挂起的步长（延迟生效）
execute if score @s temp_step_pending matches 1.. run scoreboard players operation @s temperature += @s temp_step_pending
execute if score @s temp_step_pending matches ..-1 run scoreboard players operation @s temperature += @s temp_step_pending
execute if score @s temp_step_pending matches 1.. run scoreboard players set @s temp_step_pending 0
execute if score @s temp_step_pending matches ..-1 run scoreboard players set @s temp_step_pending 0

# 1. 环境温度计算（全部操作 env_temp）
function age:state/temperature/env/base
function age:state/temperature/env/biome
function age:state/temperature/env/weather
function age:state/temperature/env/block

# 2. 铜套检测：直接赋值 temperature = env_temp 并返回（逻辑不变）
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players operation @s temperature = @s env_temp
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players set @s temp_trend 0
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run scoreboard players set @s temp_step_pending 0
execute if items entity @s armor.head minecraft:copper_helmet if items entity @s armor.chest minecraft:copper_chestplate if items entity @s armor.legs minecraft:copper_leggings if items entity @s armor.feet minecraft:copper_boots run return 0

# 3. 玩家修正（直接改 temperature）
function age:state/temperature/player/equipment
function age:state/temperature/player/items
function age:state/temperature/player/clamp

# 4. 计算差值 diff = env_temp - temperature
scoreboard players operation @s temp_diff = @s env_temp
scoreboard players operation @s temp_diff -= @s temperature

# 5. 若差值在 -1~1 之间，直接趋同并停止
execute if score @s temp_diff matches -1..1 run scoreboard players operation @s temperature = @s env_temp
execute if score @s temp_diff matches -1..1 run scoreboard players set @s temp_step_pending 0
# 寒冷 ↔ 冻僵
execute if score @s temperature matches ..-21 if score @s temp_prev matches -20..11 run function age:state/temperature/debuff/frozen_on
execute if score @s temperature matches -20..11 if score @s temp_prev matches ..-21 run function age:state/temperature/debuff/frozen_off

# 适宜 ↔ 寒冷
execute if score @s temperature matches -20..11 if score @s temp_prev matches 12..22 run function age:state/temperature/debuff/chill_on
execute if score @s temperature matches 12..22 if score @s temp_prev matches -20..11 run function age:state/temperature/debuff/chill_off

# 适宜 ↔ 温热
execute if score @s temperature matches 23..33 if score @s temp_prev matches 12..22 run function age:state/temperature/debuff/warm_on
execute if score @s temperature matches 12..22 if score @s temp_prev matches 23..33 run function age:state/temperature/debuff/warm_off

# 温热 ↔ 炎热
execute if score @s temperature matches 34..42 if score @s temp_prev matches 23..33 run function age:state/temperature/debuff/scorch_on
execute if score @s temperature matches 23..33 if score @s temp_prev matches 34..42 run function age:state/temperature/debuff/scorch_off

# 炎热 ↔ 中暑
execute if score @s temperature matches 43..50 if score @s temp_prev matches 34..42 run function age:state/temperature/debuff/heatstroke_on
execute if score @s temperature matches 34..42 if score @s temp_prev matches 43..50 run function age:state/temperature/debuff/heatstroke_off
execute if score @s temp_diff matches -1..1 run scoreboard players operation @s temp_prev = @s temperature
execute if score @s temp_diff matches -1..1 run scoreboard players set @s temp_trend 0
execute if score @s temp_diff matches -1..1 run return 0



# 6. 计算步长 step_abs = max(1, floor(|diff|/2))
scoreboard players operation @s temp_step_abs = @s temp_diff
execute if score @s temp_diff matches ..-1 run scoreboard players operation @s temp_step_abs *= #neg temperature.tmp
scoreboard players operation @s temp_step_abs /= #two temperature.tmp
execute if score @s temp_step_abs matches 0 run scoreboard players set @s temp_step_abs 1

# 7. 按方向生成带符号的 pending 步长（延迟到下次生效）
execute if score @s temp_diff matches 1.. run scoreboard players operation @s temp_step_pending = @s temp_step_abs
execute if score @s temp_diff matches ..-1 run scoreboard players operation @s temp_step_pending = @s temp_step_abs
execute if score @s temp_diff matches ..-1 run scoreboard players operation @s temp_step_pending *= #neg temperature.tmp

# 8. 重置计时器
scoreboard players set @s temp_timer 0
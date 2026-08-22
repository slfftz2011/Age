# ===== 每 tick 更新口渴值 =====

# 获取当前饥饿值和饱和度
execute store result score @s food_cur run data get entity @s foodLevel
execute store result score @s sat_cur run data get entity @s foodSaturationLevel

# 计算差值
scoreboard players operation @s food_diff = @s food_prev
scoreboard players operation @s food_diff -= @s food_cur
scoreboard players operation @s sat_diff = @s sat_prev
scoreboard players operation @s sat_diff -= @s sat_cur

# 应用食物消耗导致的口渴减少
# 饥饿值下降
execute if score @s food_diff matches 1.. run scoreboard players remove @s 1
# 饱食度下降
execute if score @s sat_diff matches 1.. run scoreboard players remove @s 1

# 如果存在口渴buff（thirst_buff_timer > 0），额外再减1
execute if score @s thirst_buff_timer matches 1.. if score @s food_diff matches 1.. run scoreboard players remove @s thirst 1
execute if score @s thirst_buff_timer matches 1.. if score @s sat_diff matches 1.. run scoreboard players remove @s thirst 1

execute if score @s thirst matches ..0 run scoreboard players set @s thirst 0
execute if score @s thirst matches 21.. run scoreboard players set @s thirst 20

execute if score @s thirst_buff_timer matches 1.. run scoreboard players add @s thirst_buff_timer -1
execute if score @s thirst_buff_timer matches ..0 run scoreboard players set @s thirst_buff_timer 0

function age:state/thirst/hydrate

# 更新记录
scoreboard players operation @s food_prev = @s food_cur
scoreboard players operation @s sat_prev = @s sat_cur

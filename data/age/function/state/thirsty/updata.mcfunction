# ===== 每 tick 更新口渴值（联动食物消耗） =====

# 获取当前饥饿值和饱和度
execute store result score @s food_cur run data get entity @s foodLevel
execute store result score @s sat_cur run data get entity @s foodSaturationLevel

# 检测饥饿值是否下降
scoreboard players operation @s food_diff = @s food_prev
scoreboard players operation @s food_diff -= @s food_cur
execute if score @s food_diff matches 1.. run scoreboard players remove @s thirst @s food_diff

# 检测饱和度是否下降
scoreboard players operation @s sat_diff = @s sat_prev
scoreboard players operation @s sat_diff -= @s sat_cur
execute if score @s sat_diff matches 1.. run scoreboard players remove @s thirst @s sat_diff

# 更新记录
scoreboard players operation @s food_prev = @s food_cur
scoreboard players operation @s sat_prev = @s sat_cur

# 限制口渴值范围 0~20
execute if score @s thirst matches ..0 run scoreboard players set @s thirst 0
execute if score @s thirst matches 21.. run scoreboard players set @s thirst 20

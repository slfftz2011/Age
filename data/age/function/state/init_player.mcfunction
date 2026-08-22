execute store result score @s food_cur run data get entity @s foodLevel
execute store result score @s sat_cur run data get entity @s foodSaturationLevel
scoreboard players operation @s food_prev = @s food_cur
scoreboard players operation @s sat_prev = @s sat_cur

scoreboard players set @s thirst 20
scoreboard players set @s thirst_max 20
scoreboard players set @s mana 0
scoreboard players set @s mana_max 0
scoreboard players set @s sanity 100
scoreboard players set @s sanity_max 100
scoreboard players set @s energy 20
scoreboard players set @s energy_max 20


scoreboard players set @s temperature 50
scoreboard players set @s temp_prev 50
scoreboard players set @s temp_delta 0
scoreboard players set @s temp_trend 0
scoreboard players set @s temp_timer 0

# 记录上一次值（用于检测变化）
scoreboard players operation @s thirst_prev = @s thirst
scoreboard players operation @s mana_prev = @s mana
scoreboard players operation @s sanity_prev = @s sanity
scoreboard players operation @s energy_prev = @s energy

# 重置计时器
scoreboard players set @s global_state_timer 0
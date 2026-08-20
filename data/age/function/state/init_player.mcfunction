scoreboard players set @s thirst 20
scoreboard players set @s thirst_max 20
scoreboard players set @s mana 0
scoreboard players set @s mana_max 0
scoreboard players set @s sanity 100
scoreboard players set @s sanity_max 100
scoreboard players set @s energy 20
scoreboard players set @s energy_max 20
scoreboard players set @s temperature 25


scoreboard players operation @s temperature_prev = @s temperature

scoreboard players set @s temperature_trend 0


# 记录上一次值（用于检测变化）
scoreboard players operation @s thirst_prev = @s thirst
scoreboard players operation @s mana_prev = @s mana
scoreboard players operation @s sanity_prev = @s sanity
scoreboard players operation @s energy_prev = @s energy

# 重置计时器
scoreboard players set @s global_state_timer 0
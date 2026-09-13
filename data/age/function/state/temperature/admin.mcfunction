# ===== 管理员菜单 =====

scoreboard players enable @a[gamemode=creative] admin
scoreboard players add @a[gamemode=creative] is_admin 1
execute as @a if score @s is_admin matches 1 run tellraw @s ["\n\n\n",{"text":"are you cheating or setting up?","color":"red","underlined":true},"\n\nit doesn't matter anyway, when you use ",{"text":"/trigger admin","clickEvent":{"action":"suggest_command","value":"/trigger admin"},"underlined":true,"color":"blue"}," you open the admin menu\n\n\n "]
scoreboard players reset @a[gamemode=survival] is_admin

execute as @a[gamemode=creative] if score @s admin matches 1 run tellraw @s ["\n\n\n\n\n",{"text":"Admin Menu (click to select)","color":"gold","bold":true},"\n",{"text":"Disable Temperature in nether ","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger disable_nether"}},"\n",{"text":"enable Temperature in nether ","clickEvent":{"action":"run_command","value":"/trigger enable_nether"},"color":"aqua"},"\n",{"text":"Disable Temperature in end ","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger disable_end"}},"\n",{"text":"enable Temperature in end ","clickEvent":{"action":"run_command","value":"/trigger enable_end"},"color":"aqua"},"\n",{"text":"temperature speed:","color":"dark_aqua","bold":true,"underlined":true},"\n",{"text":"very slow","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 150"},"color":"dark_red"},"\n",{"text":"slow","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 100"},"color":"red"},"\n",{"text":"normal","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 50"},"color":"dark_green"},"\n",{"text":"fast","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 25"},"color":"yellow"},"\n",{"text":"very fast","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 10"},"color":"gold"},"\n",{"text":"Disable Temperature for me","color":"white","underlined":true,"clickEvent":{"action":"run_command","value":"/scoreboard players set @s temperature_resistance 999999999"}},{"text":"\n","color":"white","underlined":true},{"text":"Enable Temperature for me","color":"white","underlined":true,"clickEvent":{"action":"run_command","value":"/scoreboard players reset @s temperature_resistance"}},"\n",{"text":"(use /datapack disable file/temperature to disable this datapack)","color":"red"}]

execute as @a[gamemode=creative] if score @s admin matches 1 run scoreboard players reset @s admin

execute as @a if score @s disable_nether matches 1 run scoreboard players set nether temperaturec 1
execute as @a if score @s enable_nether matches 1 run scoreboard players set nether temperaturec 0
execute as @a if score @s disable_end matches 1 run scoreboard players set end temperaturec 1
execute as @a if score @s enable_end matches 1 run scoreboard players set end temperaturec 0
scoreboard players reset @a disable_nether
scoreboard players reset @a disable_end
scoreboard players reset @a enable_nether
scoreboard players reset @a enable_end

scoreboard players enable @a[gamemode=creative] disable_end
scoreboard players enable @a[gamemode=creative] disable_nether
scoreboard players enable @a[gamemode=creative] enable_nether
scoreboard players enable @a[gamemode=creative] enable_end
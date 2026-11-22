tag @s add in_qte
tag @s add qte_waiting
scoreboard players set @s qte_elapsed 0
scoreboard players set @s qte_click 0
execute store result score @s qte_wait run random value 20..100

# 根据 Combo 设定时间流逝倍率
scoreboard players set @s qte_speed 1
execute if score @s qte_combo matches 10..33 run scoreboard players set @s qte_speed 2
execute if score @s qte_combo matches 34..73 run scoreboard players set @s qte_speed 3
execute if score @s qte_combo matches 74.. run scoreboard players set @s qte_speed 4
execute if score @s qte_combo matches 10 run tellraw @s [{"text":"[难度提升] ","color":"red"},{"text":"进度条加速！","color":"gold"}]
execute if score @s qte_combo matches 10 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1.5 1.2
execute if score @s qte_combo matches 34 run tellraw @s [{"text":"[难度提升] ","color":"red"},{"text":"进度条加速！","color":"gold"}]
execute if score @s qte_combo matches 34 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 2 1.2
execute if score @s qte_combo matches 74 run tellraw @s [{"text":"[难度提升] ","color":"red"},{"text":"进度条加速！","color":"gold"}]
execute if score @s qte_combo matches 74 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 3 1.2


function age:qte/old_stone_age/util/consume_gravel

function age:qte/old_stone_age/util/damage_rod

title @s title {"text":"准备...","color":"yellow"}
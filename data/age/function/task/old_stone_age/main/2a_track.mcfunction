# 检查是否达到目标
execute if items entity @s weapon.mainhand minecraft:stone_sword store result score @s task_old_stone_2a_amount run attribute @s minecraft:attack_damage get 100

execute if score @s task_old_stone_2a_amount matches 150.. run tag @s remove task_old_stone_2a_tracking
execute if score @s task_old_stone_2a_amount matches 150.. if items entity @s weapon.mainhand minecraft:stone_sword run advancement grant @s only age:old_stone_age/phase_2a
execute if score @s task_old_stone_2a_amount matches 150.. if items entity @s weapon.mainhand minecraft:stone_sword run scoreboard players reset @s task_old_stone_2a_amount
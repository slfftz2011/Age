tag @s remove in_qte
tag @s remove qte_waiting
tag @s remove qte_running
scoreboard players set @s qte_elapsed 0
scoreboard players set @s qte_wait 0
scoreboard players set @s qte_click 0
scoreboard players set @s qte_rolls 0
title @s clear
clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={from: "old_stone_age",special:1b}]
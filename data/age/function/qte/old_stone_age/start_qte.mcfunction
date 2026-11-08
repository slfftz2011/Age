tag @s add in_qte
tag @s add qte_waiting
scoreboard players set @s qte_elapsed 0
scoreboard players set @s qte_click 0
execute store result score @s qte_wait run random value 20..100
function age:qte/old_stone_age/util/consume_gravel
title @s actionbar {"text":"准备...","color":"yellow"}
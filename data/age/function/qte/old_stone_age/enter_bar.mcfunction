tag @s remove qte_waiting
tag @s add qte_running
scoreboard players set @s qte_elapsed 0
scoreboard players set @s qte_click 0
title @s times 0 10 0
function age:qte/old_stone_age/render_bar
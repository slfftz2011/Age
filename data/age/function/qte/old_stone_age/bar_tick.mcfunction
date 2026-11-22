scoreboard players operation @s qte_elapsed += @s qte_speed

execute if score @s qte_click matches 1.. run return run function age:qte/old_stone_age/judge
execute if score @s qte_elapsed matches 81.. run return run function age:qte/old_stone_age/result/too_late
function age:qte/old_stone_age/render_bar
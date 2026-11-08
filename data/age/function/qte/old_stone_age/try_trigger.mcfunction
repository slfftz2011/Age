execute unless score @s qte_click matches 1.. run return fail
execute unless items entity @s weapon.mainhand minecraft:carrot_on_a_stick run return fail
execute unless items entity @s weapon.offhand minecraft:gravel run return fail
scoreboard players set @s qte_click 0
function age:qte/old_stone_age/start_qte
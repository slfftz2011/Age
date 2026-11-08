scoreboard players set @s qte_combo 0
execute store result storage age:qte.old_stone_age.res combo int 1 run scoreboard players get @s qte_combo
function age:qte/old_stone_age/show_combo with storage age:qte.old_stone_age.res
function age:qte/old_stone_age/util/cleanup
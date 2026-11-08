scoreboard players add @s qte_combo 1
execute store result storage age:qte.old_stone_age.res combo int 1 run scoreboard players get @s qte_combo
function age:qte/old_stone_age/show_combo with storage age:qte.old_stone_age.res
function age:qte/old_stone_age/reward/late
function age:qte/old_stone_age/util/cleanup
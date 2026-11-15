scoreboard players set @s qte_combo 0
tellraw @s {"text":"太早了","color":"red"}
execute store result storage age:qte.old_stone_age.res combo int 1 run scoreboard players get @s qte_combo
function age:qte/old_stone_age/util/cleanup
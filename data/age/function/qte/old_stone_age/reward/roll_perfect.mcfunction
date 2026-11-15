execute if score @s qte_rolls matches ..0 run return run scoreboard players set @s qte_rolls 0
loot give @s fish age:qte_gravel ~ ~ ~ minecraft:diamond_pickaxe[minecraft:enchantments={"minecraft:fortune":4}]
scoreboard players remove @s qte_rolls 1
function age:qte/old_stone_age/reward/roll_perfect
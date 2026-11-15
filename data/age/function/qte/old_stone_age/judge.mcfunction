execute if score @s qte_elapsed matches ..23 run return run function age:qte/old_stone_age/result/too_early
execute if score @s qte_elapsed matches 24..39 run return run function age:qte/old_stone_age/result/early
execute if score @s qte_elapsed matches 40..48 run return run function age:qte/old_stone_age/result/perfect
execute if score @s qte_elapsed matches 49..64 run return run function age:qte/old_stone_age/result/late
execute if score @s qte_elapsed matches 65.. run function age:qte/old_stone_age/result/too_late
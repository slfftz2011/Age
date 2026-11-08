execute if score @s qte_elapsed matches ..19 run return run function age:qte/old_stone_age/result/too_early
execute if score @s qte_elapsed matches 20..36 run return run function age:qte/old_stone_age/result/early
execute if score @s qte_elapsed matches 37..42 run return run function age:qte/old_stone_age/result/perfect
execute if score @s qte_elapsed matches 43..59 run return run function age:qte/old_stone_age/result/late
execute if score @s qte_elapsed matches 60.. run function age:qte/old_stone_age/result/too_late
# ===== 食用：甘蔗 x5 =====
execute unless entity @s[tag=task_done] unless score @s sugar_cane_eat = @s sugar_cane_updata run title @s actionbar ["",{"text":"🍽️ 食用: 甘蔗 ","color":"#55FF55"},{"score":{"name":"@s","objective":"sugar_cane_eat"},"color":"gray"},{"text":"/6","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s sugar_cane_eat = @s sugar_cane_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s sugar_cane_updata = @s sugar_cane_eat
execute as @s unless entity @s[tag=task_done] if score @s sugar_cane_eat matches 6.. run function age:task/old_stone_age/random/eat/6_c
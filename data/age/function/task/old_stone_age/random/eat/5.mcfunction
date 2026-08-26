# ===== 食用：西瓜片 x8 =====
execute unless entity @s[tag=task_done] unless score @s melon_eat = @s melon_updata run title @s actionbar ["",{"text":"🍽️ 食用: 西瓜片 ","color":"#55FF55"},{"score":{"name":"@s","objective":"melon_eat"},"color":"gray"},{"text":"/8","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s melon_eat = @s melon_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s melon_updata = @s melon_eat
execute as @s unless entity @s[tag=task_done] if score @s melon_eat matches 8.. run function age:task/old_stone_age/random/eat/5_c
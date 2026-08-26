# ===== 食用：南瓜 x5 =====
execute unless entity @s[tag=task_done] unless score @s pumpkin_eat = @s pumpkin_updata run title @s actionbar ["",{"text":"🍽️ 食用: 南瓜 ","color":"#55FF55"},{"score":{"name":"@s","objective":"pumpkin_eat"},"color":"gray"},{"text":"/5","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s pumpkin_eat = @s pumpkin_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s pumpkin_updata = @s pumpkin_eat
execute as @s unless entity @s[tag=task_done] if score @s pumpkin_eat matches 5.. run function age:task/old_stone_age/random/eat/6_c
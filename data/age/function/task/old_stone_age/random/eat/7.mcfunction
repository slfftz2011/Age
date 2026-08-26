# ===== 食用：生猪肉 x4 =====
execute unless entity @s[tag=task_done] unless score @s pork_eat = @s pork_updata run title @s actionbar ["",{"text":"🍽️ 食用: 生猪肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"pork_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s pork_updata = @s pork_eat
execute as @s unless entity @s[tag=task_done] if score @s pork_eat matches 4.. run function age:task/old_stone_age/random/eat/7_c
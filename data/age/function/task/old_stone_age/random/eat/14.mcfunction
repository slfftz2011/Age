# ===== 食用：热带鱼 x3 =====
execute unless entity @s[tag=task_done] unless score @s tropical_eat = @s tropical_updata run title @s actionbar ["",{"text":"🍽️ 食用: 热带鱼 ","color":"#55FF55"},{"score":{"name":"@s","objective":"tropical_eat"},"color":"gray"},{"text":"/3","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s tropical_eat = @s tropical_updata tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s tropical_updata = @s tropical_eat
execute as @s unless entity @s[tag=task_done] if score @s tropical_eat matches 3.. run function age:task/old_stone_age/random/eat/14_c
execute unless entity @s[tag=task_done] unless score @s salmon_eat = @s salmon_updata run title @s actionbar ["",{"text":"🍖 ","color":"#55FF55"},{"text":"食用: 生鲑鱼 ","color":"#55FF55"},{"score":{"name":"@s","objective":"salmon_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s salmon_eat = @s salmon_updata run tag @s add actionbar_block
scoreboard players operation @s salmon_updata = @s salmon_eat
execute as @s unless entity @s[tag=task_done] if score @s salmon_eat matches 4.. run function age:task/old_stone_age/random/eat/37_c
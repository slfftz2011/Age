execute unless entity @s[tag=task_done] unless score @s rotten_eat = @s rotten_updata run title @s actionbar ["",{"text":"🍖 ","color":"#55FF55"},{"text":"食用: 腐肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"rotten_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s rotten_eat = @s rotten_updata run tag @s add actionbar_block
scoreboard players operation @s rotten_updata = @s rotten_eat
execute as @s unless entity @s[tag=task_done] if score @s rotten_eat matches 4.. run function age:task/old_stone_age/random/eat/40_c
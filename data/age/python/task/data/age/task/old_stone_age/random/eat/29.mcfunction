execute unless entity @s[tag=task_done] unless score @s melon_eat = @s melon_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 西瓜片 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"melon_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s melon_eat = @s melon_updata run tag @s add actionbar_block
scoreboard players operation @s melon_updata = @s melon_eat
execute as @s unless entity @s[tag=task_done] if score @s melon_eat matches 10.. run function age:task/old_stone_age/random/eat/29_c
scoreboard players operation @s seed_eat += @s seed_wheat_seeds
scoreboard players operation @s seed_eat += @s seed_beetroot_seeds
scoreboard players operation @s seed_eat += @s seed_pumpkin_seeds
execute unless entity @s[tag=task_done] unless score @s seed_eat = @s seed_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 种子 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"seed_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s seed_eat = @s seed_updata run tag @s add actionbar_block
scoreboard players operation @s seed_updata = @s seed_eat
execute as @s unless entity @s[tag=task_done] if score @s seed_eat matches 10.. run function age:task/old_stone_age/random/eat/26_c
execute unless entity @s[tag=task_done] unless score @s chicken_eat = @s chicken_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 生鸡肉 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"chicken_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s chicken_eat = @s chicken_updata run tag @s add actionbar_block
scoreboard players operation @s chicken_updata = @s chicken_eat
execute as @s unless entity @s[tag=task_done] if score @s chicken_eat matches 10.. run function age:task/old_stone_age/random/eat/35_c
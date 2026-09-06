scoreboard players operation @s veg_eat += @s veg_carrot
scoreboard players operation @s veg_eat += @s veg_potato
scoreboard players operation @s veg_eat += @s veg_beetroot
execute unless entity @s[tag=task_done] unless score @s veg_eat = @s veg_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 蔬菜 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"veg_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s veg_eat = @s veg_updata run tag @s add actionbar_block
scoreboard players operation @s veg_updata = @s veg_eat
execute as @s unless entity @s[tag=task_done] if score @s veg_eat matches 10.. run function age:task/old_stone_age/random/eat/25_c
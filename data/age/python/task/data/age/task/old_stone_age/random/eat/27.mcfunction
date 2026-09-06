scoreboard players operation @s berry_eat += @s berry_sweet_berries
scoreboard players operation @s berry_eat += @s berry_glow_berries
execute unless entity @s[tag=task_done] unless score @s berry_eat = @s berry_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 浆果 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"berry_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s berry_eat = @s berry_updata run tag @s add actionbar_block
scoreboard players operation @s berry_updata = @s berry_eat
execute as @s unless entity @s[tag=task_done] if score @s berry_eat matches 10.. run function age:task/old_stone_age/random/eat/27_c
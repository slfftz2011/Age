execute unless entity @s[tag=task_done] unless score @s puffer_eat = @s puffer_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 河豚 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"puffer_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s puffer_eat = @s puffer_updata run tag @s add actionbar_block
scoreboard players operation @s puffer_updata = @s puffer_eat
execute as @s unless entity @s[tag=task_done] if score @s puffer_eat matches 10.. run function age:task/old_stone_age/random/eat/39_c
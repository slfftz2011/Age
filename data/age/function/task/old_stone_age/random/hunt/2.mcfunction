execute unless entity @s[tag=task_done] unless score @s sheep_hunt = @s sheep_updata run title @s actionbar ["",{"text":"🏹 狩猎: 羊 ","color":"#554411"},{"score":{"name":"@s","objective":"sheep_hunt"},"color":"gray"},{"text":"/5","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s sheep_updata = @s sheep_hunt

execute as @s unless entity @s[tag=task_done] if score @s sheep_hunt matches 5.. run function age:task/old_stone_age/random/hunt/2_c
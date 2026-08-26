execute unless entity @s[tag=task_done] unless score @s cow_hunt = @s cow_updata run title @s actionbar ["",{"text":"🏹 狩猎: 牛 ","color":"#554411"},{"score":{"name":"@s","objective":"cow_hunt"},"color":"gray"},{"text":"/5","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s cow_updata = @s cow_hunt

execute as @s unless entity @s[tag=task_done] if score @s cow_hunt matches 5.. run function age:task/old_stone_age/random/hunt/3_c
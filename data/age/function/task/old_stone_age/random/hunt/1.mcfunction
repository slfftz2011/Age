execute unless entity @s[tag=task_done] unless score @s pig_hunt = @s pig_updata run title @s actionbar ["",{"text":"🏹 狩猎: 猪 ","color":"red"},{"score":{"name":"@s","objective":"pig_hunt"},"color":"gray"},{"text":"/5","color":"gray"}]

scoreboard players operation @s pig_updata = @s pig_hunt

execute as @s unless entity @s[tag=task_done] if score @s pig_hunt matches 5.. run function age:task/old_stone_age/random/hunt/1_c
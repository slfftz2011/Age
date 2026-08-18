execute unless entity @s[tag=task_done] unless score @s chicken_hunt = @s chicken_updata run title @s actionbar ["",{"text":"🏹 狩猎: 鸡 ","color":"red"},{"score":{"name":"@s","objective":"chicken_hunt"},"color":"gray"},{"text":"/5","color":"gray"}]

scoreboard players operation @s chicken_updata = @s chicken_hunt

execute as @s unless entity @s[tag=task_done] if score @s chicken_hunt matches 5.. run function age:task/old_stone_age/random/hunt/6_c
execute unless entity @s[tag=task_done] unless score @s rabbit_hunt = @s rabbit_updata run title @s actionbar ["",{"text":"📋 狩猎: 兔 ","color":"red"},{"score":{"name":"@s","objective":"rabbit_hunt"},"color":"gray"},{"text":"/3","color":"gray"}]

scoreboard players operation @s rabbit_updata = @s rabbit_hunt

execute as @s unless entity @s[tag=task_done] if score @s rabbit_hunt matches 3.. run function age:task/old_stone_age/random/hunt/4_c
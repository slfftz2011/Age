execute unless entity @s[tag=task_done] unless score @s horse_hunt = @s horse_updata run title @s actionbar ["",{"text":"🏹 狩猎: 马 ","color":"#CFCF5F"},{"score":{"name":"@s","objective":"horse_hunt"},"color":"gray"},{"text":"/3","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s horse_hunt = @s horse_updata run tag @s add actionbar_block
scoreboard players operation @s horse_updata = @s horse_hunt

execute as @s unless entity @s[tag=task_done] if score @s horse_hunt matches 3.. run function age:task/old_stone_age/random/hunt/5_c
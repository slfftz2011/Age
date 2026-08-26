# ===== 制作：西瓜 x4 =====
execute unless entity @s[tag=task_done] unless score @s melon_craft = @s melon_updata run title @s actionbar ["",{"text":"🔨 制作: 西瓜 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"melon_craft"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s melon_craft = @s melon_updata run tag @s add actionbar_block
scoreboard players operation @s melon_updata = @s melon_craft
execute as @s unless entity @s[tag=task_done] if score @s melon_craft matches 4.. run function age:task/old_stone_age/random/craft/2_c
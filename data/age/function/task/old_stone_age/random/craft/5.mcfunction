# ===== 制作：砂岩 x16 =====
execute unless entity @s[tag=task_done] unless score @s sandstone_craft = @s sandstone_updata run title @s actionbar ["",{"text":"🔨 制作: 砂岩 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"sandstone_craft"},"color":"gray"},{"text":"/16","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s sandstone_craft = @s sandstone_updata run tag @s add actionbar_block
scoreboard players operation @s sandstone_updata = @s sandstone_craft
execute as @s unless entity @s[tag=task_done] if score @s sandstone_craft matches 16.. run function age:task/old_stone_age/random/craft/5_c
# ===== 制作：红砂岩 x16 =====
execute unless entity @s[tag=task_done] unless score @s red_sandstone_craft = @s red_sandstone_updata run title @s actionbar ["",{"text":"🔨 制作: 红砂岩 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"red_sandstone_craft"},"color":"gray"},{"text":"/16","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s red_sandstone_updata = @s red_sandstone_craft
execute as @s unless entity @s[tag=task_done] if score @s red_sandstone_craft matches 16.. run function age:task/old_stone_age/random/craft/6_c
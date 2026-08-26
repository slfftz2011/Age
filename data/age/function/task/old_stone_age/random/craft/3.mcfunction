# ===== 制作：黏土 x4 =====
execute unless entity @s[tag=task_done] unless score @s clay_craft = @s clay_updata run title @s actionbar ["",{"text":"🔨 制作: 黏土 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"clay_craft"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s clay_craft = @s clay_updata run tag @s add actionbar_block
scoreboard players operation @s clay_updata = @s clay_craft
execute as @s unless entity @s[tag=task_done] if score @s clay_craft matches 4.. run function age:task/old_stone_age/random/craft/3_c


# 从背包扣除 1 个特殊 flint
clear @s minecraft:flint[custom_data={special:1b,from:"old_stone_age"}] 1
# 给予 1 个打制石器（战利品表生成的物品）
loot give @s loot age:chipped_stone_tool

execute if entity @s[tag=task_old_stone_1_tracking] run scoreboard players add @s task_old_stone_1_progress 1
execute if entity @s[tag=task_old_stone_1_tracking] run title @s actionbar ["",{"text":"📋 打制石器 ","color":"gold"},{"score":{"name":"@s","objective":"task_old_stone_1_progress"},"color":"gray"},{"text":"/8","color":"gray"}]
execute if entity @s[tag=task_old_stone_1_tracking] run tag @s add actionbar_block
execute if entity @s[team=old_stone_age] store result score old_stone_age forwards run random value 1..100
execute if entity @s[team=old_stone_age] run scoreboard players operation old_stone_age forwards %= old_stone_s forwards
execute if entity @s[team=old_stone_age] if score old_stone_age forwards matches 1 run scoreboard players add old_stone_age stage 1
execute if entity @s[team=old_stone_age] if score old_stone_age forwards matches 1 run scoreboard players set old_stone_age forwards 6
execute if entity @s[team=old_stone_age] if score old_stone_age forwards matches 1 run tellraw @s {text:"你似乎有所顿悟...",color:"blue"}
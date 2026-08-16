execute unless score @s task_old_stone_4a_progress = @s task_old_stone_4a_updata run title @s actionbar ["",{"text":"📋 击杀骷髅 ","color":"gold"},{"score":{"name":"@s","objective":"task_old_stone_4a_progress"},"color":"gray"},{"text":"/5","color":"gray"}]

scoreboard players operation @s task_old_stone_4a_updata = @s task_old_stone_4a_progress
# 检查是否达到目标
execute if score @s task_old_stone_4a_progress matches 5.. run tag @s remove task_old_stone_4a_tracking
execute if score @s task_old_stone_4a_progress matches 5.. run advancement grant @s only age:old_stone_age/phase_4a
execute if score @s task_old_stone_4a_progress matches 5.. run scoreboard players reset @s task_old_stone_4a_progress
execute if score @s task_old_stone_4a_progress matches 5.. run scoreboard players reset @s task_old_stone_4a_updata

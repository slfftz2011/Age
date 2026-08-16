# 检测玩家打制石器的进度

# 检查是否达到目标（8件）
execute if score @s task_old_stone_1_progress matches 8.. run tag @s remove task_old_stone_1_tracking
execute if score @s task_old_stone_1_progress matches 8.. run advancement grant @s only age:old_stone_age/phase_1
execute if score @s task_old_stone_1_progress matches 8.. run scoreboard players reset @s task_old_stone_1_progress
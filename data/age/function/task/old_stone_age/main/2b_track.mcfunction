# 检查是否达到目标
execute if items entity @s container.* minecraft:stone_axe run tag @s remove task_old_stone_2b_tracking
execute if items entity @s container.* minecraft:stone_axe run advancement grant @s only age:old_stone_age/phase_2b
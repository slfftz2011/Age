# ===== 食用：蔬菜 x8 =====

# 1. 清零主记分板（仅未完成时）
execute unless entity @s[tag=task_done] run scoreboard players set @s veg_eat 0

# 2. 累加所有子记分板（仅未完成时，子记分板不清零）
execute unless entity @s[tag=task_done] run scoreboard players operation @s veg_eat += @s veg_carrot
execute unless entity @s[tag=task_done] run scoreboard players operation @s veg_eat += @s veg_potato
execute unless entity @s[tag=task_done] run scoreboard players operation @s veg_eat += @s veg_beetroot

# 3. 显示进度（使用主记分板，同样只有未完成且分数变化时才更新）
execute unless entity @s[tag=task_done] unless score @s veg_eat = @s veg_updata run title @s actionbar ["",{"text":"🍽️ 食用: 蔬菜 ","color":"#55FF55"},{"score":{"name":"@s","objective":"veg_eat"},"color":"gray"},{"text":"/8","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s veg_eat = @s veg_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s veg_updata = @s veg_eat

# 4. 检测完成
execute as @s unless entity @s[tag=task_done] if score @s veg_eat matches 8.. run function age:task/old_stone_age/random/eat/1_c

# ===== 食用：生牛肉 x4 =====
execute unless entity @s[tag=task_done] unless score @s beef_eat = @s beef_updata run title @s actionbar ["",{"text":"🍽️ 食用: 生牛肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"beef_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s beef_updata = @s beef_eat
execute as @s unless entity @s[tag=task_done] if score @s beef_eat matches 4.. run function age:task/old_stone_age/random/eat/9_c
# ===== 食用：浆果 x8 =====

execute unless entity @s[tag=task_done] run scoreboard players set @s berry_eat 0
execute unless entity @s[tag=task_done] run scoreboard players operation @s berry_eat += @s berry_sweet
execute unless entity @s[tag=task_done] run scoreboard players operation @s berry_eat += @s berry_glow

execute unless entity @s[tag=task_done] unless score @s berry_eat = @s berry_updata run title @s actionbar ["",{"text":"🍽️ 食用: 浆果 ","color":"#55FF55"},{"score":{"name":"@s","objective":"berry_eat"},"color":"gray"},{"text":"/8","color":"gray"}]
execute unless entity @s[tag=task_done] run scoreboard players operation @s berry_updata = @s berry_eat
execute as @s unless entity @s[tag=task_done] if score @s berry_eat matches 8.. run function age:task/old_stone_age/random/eat/3_c
# ===== 食用：种子 x8 =====

execute unless entity @s[tag=task_done] run scoreboard players set @s seed_eat 0
execute unless entity @s[tag=task_done] run scoreboard players operation @s seed_eat += @s seed_wheat
execute unless entity @s[tag=task_done] run scoreboard players operation @s seed_eat += @s seed_beetroot

execute unless entity @s[tag=task_done] unless score @s seed_eat = @s seed_updata run title @s actionbar ["",{"text":"🍽️ 食用: 种子 ","color":"#55FF55"},{"score":{"name":"@s","objective":"seed_eat"},"color":"gray"},{"text":"/8","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s seed_eat = @s seed_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s seed_updata = @s seed_eat
execute as @s unless entity @s[tag=task_done] if score @s seed_eat matches 8.. run function age:task/old_stone_age/random/eat/2_c
# ===== 食用：苹果 x4 =====
execute unless entity @s[tag=task_done] unless score @s apple_eat = @s apple_updata run title @s actionbar ["",{"text":"🍽️ 食用: 苹果 ","color":"#55FF55"},{"score":{"name":"@s","objective":"apple_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s apple_updata = @s apple_eat
execute as @s unless entity @s[tag=task_done] if score @s apple_eat matches 4.. run function age:task/old_stone_age/random/eat/4_c
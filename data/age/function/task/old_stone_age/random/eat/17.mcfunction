# ===== 食用：蜘蛛眼 x1 =====
execute unless entity @s[tag=task_done] unless score @s spider_eye_eat = @s spider_eye_updata run title @s actionbar ["",{"text":"🍽️ 食用: 蜘蛛眼 ","color":"#55FF55"},{"score":{"name":"@s","objective":"spider_eye_eat"},"color":"gray"},{"text":"/1","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s spider_eye_eat = @s spider_eye_updata run tag @s add actionbar_block
execute unless entity @s[tag=task_done] run scoreboard players operation @s spider_eye_updata = @s spider_eye_eat
execute as @s unless entity @s[tag=task_done] if score @s spider_eye_eat matches 1.. run function age:task/old_stone_age/random/eat/17_c
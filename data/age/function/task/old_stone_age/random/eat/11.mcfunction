# ===== 食用：生鸡肉 x4 =====
execute unless entity @s[tag=task_done] unless score @s chicken_eat = @s chicken_updata run title @s actionbar ["",{"text":"🍽️ 食用: 生鸡肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"chicken_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] run scoreboard players operation @s chicken_updata = @s chicken_eat
execute as @s unless entity @s[tag=task_done] if score @s chicken_eat matches 4.. run function age:task/old_stone_age/random/eat/11_c
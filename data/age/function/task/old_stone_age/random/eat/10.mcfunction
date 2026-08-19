# ===== 食用：生兔肉 x3 =====
execute unless entity @s[tag=task_done] unless score @s rabbit_eat = @s rabbit_updata run title @s actionbar ["",{"text":"🍽️ 食用: 生兔肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"rabbit_eat"},"color":"gray"},{"text":"/3","color":"gray"}]
execute unless entity @s[tag=task_done] run scoreboard players operation @s rabbit_updata = @s rabbit_eat
execute as @s unless entity @s[tag=task_done] if score @s rabbit_eat matches 3.. run function age:task/old_stone_age/random/eat/10_c
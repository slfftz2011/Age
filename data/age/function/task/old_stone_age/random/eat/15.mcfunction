# ===== 食用：河豚 x1 =====
execute unless entity @s[tag=task_done] unless score @s puffer_eat = @s puffer_updata run title @s actionbar ["",{"text":"🍽️ 食用: 河豚 ","color":"#55FF55"},{"score":{"name":"@s","objective":"puffer_eat"},"color":"gray"},{"text":"/1","color":"gray"}]
execute unless entity @s[tag=task_done] run scoreboard players operation @s puffer_updata = @s puffer_eat
execute as @s unless entity @s[tag=task_done] if score @s puffer_eat matches 1.. run function age:task/old_stone_age/random/eat/15_c
execute unless entity @s[tag=task_done] unless score @s mutton_eat = @s mutton_updata run title @s actionbar ["",{"text":"🍖 ","color":"#55FF55"},{"text":"食用: 生羊肉 ","color":"#55FF55"},{"score":{"name":"@s","objective":"mutton_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s mutton_eat = @s mutton_updata run tag @s add actionbar_block
scoreboard players operation @s mutton_updata = @s mutton_eat
execute as @s unless entity @s[tag=task_done] if score @s mutton_eat matches 4.. run function age:task/old_stone_age/random/eat/32_c
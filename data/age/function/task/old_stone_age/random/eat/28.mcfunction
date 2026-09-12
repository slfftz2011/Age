execute unless entity @s[tag=task_done] unless score @s apple_eat = @s apple_updata run title @s actionbar ["",{"text":"🍖 ","color":"#55FF55"},{"text":"食用: 苹果 ","color":"#55FF55"},{"score":{"name":"@s","objective":"apple_eat"},"color":"gray"},{"text":"/4","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s apple_eat = @s apple_updata run tag @s add actionbar_block
scoreboard players operation @s apple_updata = @s apple_eat
execute as @s unless entity @s[tag=task_done] if score @s apple_eat matches 4.. run function age:task/old_stone_age/random/eat/28_c
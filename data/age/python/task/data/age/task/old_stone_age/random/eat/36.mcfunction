execute unless entity @s[tag=task_done] unless score @s cod_eat = @s cod_updata run title @s actionbar ["",{"text":"🍖 ","color":"#FFAA55"},{"text":"食用: 生鳕鱼 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"cod_eat"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s cod_eat = @s cod_updata run tag @s add actionbar_block
scoreboard players operation @s cod_updata = @s cod_eat
execute as @s unless entity @s[tag=task_done] if score @s cod_eat matches 10.. run function age:task/old_stone_age/random/eat/36_c
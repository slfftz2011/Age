execute unless entity @s[tag=task_done] unless score @s grass_mine = @s grass_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 草方块 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"grass_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s grass_mine = @s grass_updata run tag @s add actionbar_block
scoreboard players operation @s grass_updata = @s grass_mine
execute as @s unless entity @s[tag=task_done] if score @s grass_mine matches 10.. run function age:task/old_stone_age/random/mine/49_c
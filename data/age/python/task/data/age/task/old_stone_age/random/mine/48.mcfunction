execute unless entity @s[tag=task_done] unless score @s dirt_mine = @s dirt_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 泥土 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"dirt_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s dirt_mine = @s dirt_updata run tag @s add actionbar_block
scoreboard players operation @s dirt_updata = @s dirt_mine
execute as @s unless entity @s[tag=task_done] if score @s dirt_mine matches 10.. run function age:task/old_stone_age/random/mine/48_c
execute unless entity @s[tag=task_done] unless score @s clay_mine = @s clay_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 黏土 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"clay_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s clay_mine = @s clay_updata run tag @s add actionbar_block
scoreboard players operation @s clay_updata = @s clay_mine
execute as @s unless entity @s[tag=task_done] if score @s clay_mine matches 10.. run function age:task/old_stone_age/random/mine/52_c
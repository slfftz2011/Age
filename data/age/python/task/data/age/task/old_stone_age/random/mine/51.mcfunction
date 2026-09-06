execute unless entity @s[tag=task_done] unless score @s log_mine = @s log_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 原木 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"log_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s log_mine = @s log_updata run tag @s add actionbar_block
scoreboard players operation @s log_updata = @s log_mine
execute as @s unless entity @s[tag=task_done] if score @s log_mine matches 10.. run function age:task/old_stone_age/random/mine/51_c
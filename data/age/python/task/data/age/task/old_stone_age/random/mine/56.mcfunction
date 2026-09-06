execute unless entity @s[tag=task_done] unless score @s gravel_mine = @s gravel_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 沙砾 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"gravel_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s gravel_mine = @s gravel_updata run tag @s add actionbar_block
scoreboard players operation @s gravel_updata = @s gravel_mine
execute as @s unless entity @s[tag=task_done] if score @s gravel_mine matches 10.. run function age:task/old_stone_age/random/mine/56_c
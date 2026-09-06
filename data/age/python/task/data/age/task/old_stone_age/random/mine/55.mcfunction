execute unless entity @s[tag=task_done] unless score @s cobweb_mine = @s cobweb_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 蜘蛛网 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"cobweb_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s cobweb_mine = @s cobweb_updata run tag @s add actionbar_block
scoreboard players operation @s cobweb_updata = @s cobweb_mine
execute as @s unless entity @s[tag=task_done] if score @s cobweb_mine matches 10.. run function age:task/old_stone_age/random/mine/55_c
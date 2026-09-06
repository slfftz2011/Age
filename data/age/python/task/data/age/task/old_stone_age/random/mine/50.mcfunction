scoreboard players operation @s leaves_mine += @s leaves_oak_leaves
scoreboard players operation @s leaves_mine += @s leaves_acacia_leaves
scoreboard players operation @s leaves_mine += @s leaves_azalea_leaves
scoreboard players operation @s leaves_mine += @s leaves_birch_leaves
scoreboard players operation @s leaves_mine += @s leaves_cherry_leaves
scoreboard players operation @s leaves_mine += @s leaves_dark_oak_leaves
scoreboard players operation @s leaves_mine += @s leaves_flowering_azalea_leaves
scoreboard players operation @s leaves_mine += @s leaves_jungle_leaves
scoreboard players operation @s leaves_mine += @s leaves_mangrove_leaves
scoreboard players operation @s leaves_mine += @s leaves_pale_oak_leaves
scoreboard players operation @s leaves_mine += @s leaves_spruce_leaves
scoreboard players operation @s leaves_mine += @s leaves_oak_log
scoreboard players operation @s leaves_mine += @s leaves_acacia_log
scoreboard players operation @s leaves_mine += @s leaves_birch_log
scoreboard players operation @s leaves_mine += @s leaves_cherry_log
scoreboard players operation @s leaves_mine += @s leaves_dark_oak_log
scoreboard players operation @s leaves_mine += @s leaves_jungle_log
scoreboard players operation @s leaves_mine += @s leaves_mangrove_log
scoreboard players operation @s leaves_mine += @s leaves_pale_oak_log
scoreboard players operation @s leaves_mine += @s leaves_spruce_log
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run title @s actionbar ["",{"text":"⛏ ","color":"#55FFAA"},{"text":"采掘: 树叶 ","color":"#55FFAA"},{"score":{"name":"@s","objective":"leaves_mine"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run tag @s add actionbar_block
scoreboard players operation @s leaves_updata = @s leaves_mine
execute as @s unless entity @s[tag=task_done] if score @s leaves_mine matches 10.. run function age:task/old_stone_age/random/mine/50_c
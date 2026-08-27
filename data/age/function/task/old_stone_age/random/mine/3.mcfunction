# ===== 采掘：树叶 x32 =====
execute unless entity @s[tag=task_done] run scoreboard players reset @s leaves_mine
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s oak_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s acacia_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s azalea_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s birch_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s cherry_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s dark_oak_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s flowering_azalea_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s jungle_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s mangrove_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s pale_oak_leaves
execute unless entity @s[tag=task_done] run scoreboard players operation @s leaves_mine += @s spruce_leaves
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 树叶 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"leaves_mine"},"color":"gray"},{"text":"/32","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run tag @s add actionbar_block
scoreboard players operation @s leaves_updata = @s leaves_mine
execute as @s unless entity @s[tag=task_done] if score @s leaves_mine matches 32.. run function age:task/old_stone_age/random/mine/3_c
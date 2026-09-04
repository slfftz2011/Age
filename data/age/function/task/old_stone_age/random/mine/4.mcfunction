# ===== 采掘：原木 x8 =====
execute unless entity @s[tag=task_done] run scoreboard players reset @s log_mine
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s oak_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s acacia_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s azalea_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s birch_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s cherry_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s dark_oak_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s flowering_azalea_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s jungle_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s mangrove_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s pale_oak_log
execute unless entity @s[tag=task_done] run scoreboard players operation @s log_mine += @s spruce_log
execute unless entity @s[tag=task_done] unless score @s log_mine = @s log_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 原木 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"log_mine"},"color":"gray"},{"text":"/8","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s log_mine = @s log_updata run tag @s add actionbar_block
scoreboard players operation @s log_updata = @s log_mine
execute as @s unless entity @s[tag=task_done] if score @s log_mine matches 8.. run function age:task/old_stone_age/random/mine/4_c
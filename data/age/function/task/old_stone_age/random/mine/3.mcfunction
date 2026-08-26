# ===== 采掘：树叶 x32 =====
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 树叶 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"leaves_mine"},"color":"gray"},{"text":"/32","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s leaves_mine = @s leaves_updata run tag @s add actionbar_block
scoreboard players operation @s leaves_updata = @s leaves_mine
execute as @s unless entity @s[tag=task_done] if score @s leaves_mine matches 32.. run function age:task/old_stone_age/random/mine/3_c
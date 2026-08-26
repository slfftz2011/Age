
# ===== 采掘：泥土 x32 =====
execute unless entity @s[tag=task_done] unless score @s dirt_mine = @s dirt_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 泥土 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"dirt_mine"},"color":"gray"},{"text":"/32","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s dirt_updata = @s dirt_mine
execute as @s unless entity @s[tag=task_done] if score @s dirt_mine matches 32.. run function age:task/old_stone_age/random/mine/1_c
# ===== 采掘：沙砾 x8 =====
execute unless entity @s[tag=task_done] unless score @s gravel_mine = @s gravel_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 沙砾 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"gravel_mine"},"color":"gray"},{"text":"/8","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s gravel_updata = @s gravel_mine
execute as @s unless entity @s[tag=task_done] if score @s gravel_mine matches 8.. run function age:task/old_stone_age/random/mine/9_c
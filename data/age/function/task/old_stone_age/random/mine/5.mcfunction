# ===== 采掘：黏土 x8 =====
execute unless entity @s[tag=task_done] unless score @s clay_mine = @s clay_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 黏土 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"clay_mine"},"color":"gray"},{"text":"/8","color":"gray"}]
scoreboard players operation @s clay_updata = @s clay_mine
execute as @s unless entity @s[tag=task_done] if score @s clay_mine matches 8.. run function age:task/old_stone_age/random/mine/5_c
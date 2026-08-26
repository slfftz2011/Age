# ===== 采掘：沙子 x16 =====
execute unless entity @s[tag=task_done] unless score @s sand_mine = @s sand_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 沙子 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"sand_mine"},"color":"gray"},{"text":"/16","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s sand_mine = @s sand_updata runtag @s add actionbar_block
scoreboard players operation @s sand_updata = @s sand_mine
execute as @s unless entity @s[tag=task_done] if score @s sand_mine matches 16.. run function age:task/old_stone_age/random/mine/6_c
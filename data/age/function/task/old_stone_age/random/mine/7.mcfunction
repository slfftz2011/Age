# ===== 采掘：红沙 x16 =====
execute unless entity @s[tag=task_done] unless score @s red_sand_mine = @s red_sand_updata run title @s actionbar ["",{"text":"⛏️ 采掘: 红沙 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"red_sand_mine"},"color":"gray"},{"text":"/16","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s red_sand_mine = @s red_sand_updata run tag @s add actionbar_block
scoreboard players operation @s red_sand_updata = @s red_sand_mine
execute as @s unless entity @s[tag=task_done] if score @s red_sand_mine matches 16.. run function age:task/old_stone_age/random/mine/7_c
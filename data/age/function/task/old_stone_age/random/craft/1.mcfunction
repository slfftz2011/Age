# ===== 制作：木棍 x8 =====
execute unless entity @s[tag=task_done] unless score @s stick_craft = @s stick_updata run title @s actionbar ["",{"text":"🔨 制作: 木棍 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"stick_craft"},"color":"gray"},{"text":"/8","color":"gray"}]
scoreboard players operation @s stick_updata = @s stick_craft
execute as @s unless entity @s[tag=task_done] if score @s stick_craft matches 8.. run function age:task/old_stone_age/random/craft/1_c

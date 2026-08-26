# ===== 制作：皮革 x3 =====
execute unless entity @s[tag=task_done] unless score @s leather_craft = @s leather_updata run title @s actionbar ["",{"text":"🔨 制作: 皮革 ","color":"#FFAA55"},{"score":{"name":"@s","objective":"leather_craft"},"color":"gray"},{"text":"/3","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s leather_craft = @s leather_updata run tag @s add actionbar_block
scoreboard players operation @s leather_updata = @s leather_craft
execute as @s unless entity @s[tag=task_done] if score @s leather_craft matches 3.. run function age:task/old_stone_age/random/craft/4_c
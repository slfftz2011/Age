execute unless entity @s[tag=task_done] unless score @s clay_craft = @s clay_updata run title @s actionbar ["",{"text":"🔨 ","color":"#AA55FF"},{"text":"制作: 黏土 ","color":"#AA55FF"},{"score":{"name":"@s","objective":"clay_craft"},"color":"gray"},{"text":"/10","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s clay_craft = @s clay_updata run tag @s add actionbar_block
scoreboard players operation @s clay_updata = @s clay_craft
execute as @s unless entity @s[tag=task_done] if score @s clay_craft matches 10.. run function age:task/old_stone_age/random/craft/44_c
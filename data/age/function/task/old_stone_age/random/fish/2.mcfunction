# ===== 捕获：鲑鱼 x5 =====
execute unless entity @s[tag=task_done] unless score @s salmon_fish = @s salmon_updata run title @s actionbar ["",{"text":"🎣 捕获: 鲑鱼 ","color":"#55AAFF"},{"score":{"name":"@s","objective":"salmon_fish"},"color":"gray"},{"text":"/5","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s salmon_fish = @s salmon_updata run tag @s add actionbar_block
scoreboard players operation @s salmon_updata = @s salmon_fish
execute as @s unless entity @s[tag=task_done] if score @s salmon_fish matches 5.. run function age:task/old_stone_age/random/fish/2_c
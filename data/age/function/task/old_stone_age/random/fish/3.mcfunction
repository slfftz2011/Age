# ===== 捕获：热带鱼 x3 =====
execute unless entity @s[tag=task_done] unless score @s tropical_fish = @s tropical_updata run title @s actionbar ["",{"text":"🎣 捕获: 热带鱼 ","color":"#55AAFF"},{"score":{"name":"@s","objective":"tropical_fish"},"color":"gray"},{"text":"/3","color":"gray"}]
scoreboard players operation @s tropical_updata = @s tropical_fish
execute as @s unless entity @s[tag=task_done] if score @s tropical_fish matches 3.. run function age:task/old_stone_age/random/fish/3_c
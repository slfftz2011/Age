# ===== 捕获：河豚 x2 =====
execute unless entity @s[tag=task_done] unless score @s puffer_fish = @s puffer_updata run title @s actionbar ["",{"text":"🎣 捕获: 河豚 ","color":"#55AAFF"},{"score":{"name":"@s","objective":"puffer_fish"},"color":"gray"},{"text":"/2","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s puffer_fish = @s puffer_updata run tag @s add actionbar_block
scoreboard players operation @s puffer_updata = @s puffer_fish
execute as @s unless entity @s[tag=task_done] if score @s puffer_fish matches 2.. run function age:task/old_stone_age/random/fish/6_c
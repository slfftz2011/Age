# ===== 捕获：发光鱿鱼 x3 =====
execute unless entity @s[tag=task_done] unless score @s glow_squid_fish = @s glow_squid_updata run title @s actionbar ["",{"text":"🎣 捕获: 发光鱿鱼 ","color":"#55AAFF"},{"score":{"name":"@s","objective":"glow_squid_fish"},"color":"gray"},{"text":"/3","color":"gray"}]
tag @s add actionbar_block
scoreboard players operation @s glow_squid_updata = @s glow_squid_fish
execute as @s unless entity @s[tag=task_done] if score @s glow_squid_fish matches 3.. run function age:task/old_stone_age/random/fish/5_c
execute unless entity @s[tag=task_done] unless score @s cod_fish = @s cod_updata run title @s actionbar ["",{"text":"🎣 ","color":"#55AAFF"},{"text":"捕获: 鳕鱼 ","color":"#55AAFF"},{"score":{"name":"@s","objective":"cod_fish"},"color":"gray"},{"text":"/5","color":"gray"}]
execute unless entity @s[tag=task_done] unless score @s cod_fish = @s cod_updata run tag @s add actionbar_block
scoreboard players operation @s cod_updata = @s cod_fish
execute as @s unless entity @s[tag=task_done] if score @s cod_fish matches 5.. run function age:task/old_stone_age/random/fish/19_c
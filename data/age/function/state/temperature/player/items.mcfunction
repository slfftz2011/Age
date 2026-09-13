# ===== 食物 / 药水修正（不含装备） =====

# 药水
execute if score @s temperature > 22 temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @s temperature 12
execute if score @s temperature > 11 temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @s temperature 8
execute if score @s temperature <= 11 temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @s temperature 4
execute if score @s potion_cooling matches 1 run scoreboard players reset @s potion_cooling

# 甜菜汤
execute if score @s beetroot_soup_cooling matches 1 run scoreboard players remove @s temperature 10
execute if score @s beetroot_soup_cooling matches 1 run scoreboard players reset @s beetroot_soup_cooling

# 诡异兔肉煲（升温）
execute if score @s warp_rabbit_stew matches 1 run scoreboard players add @s temperature 6
execute if score @s warp_rabbit_stew matches 1 run scoreboard players reset @s warp_rabbit_stew

# 甜菜
execute if score @s beetroot_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s beetroot_cooling matches 1 run scoreboard players reset @s beetroot_cooling

# 苹果
execute if score @s apple_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s apple_cooling matches 1 run scoreboard players reset @s apple_cooling

# 胡萝卜
execute if score @s carrot_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s carrot_cooling matches 1 run scoreboard players reset @s carrot_cooling

# 甜浆果
execute if score @s sweet_berries_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s sweet_berries_cooling matches 1 run scoreboard players reset @s sweet_berries_cooling

# 荧光浆果
execute if score @s glow_berries_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s glow_berries_cooling matches 1 run scoreboard players reset @s glow_berries_cooling

# 西瓜
execute if score @s melon_cooling matches 1 run scoreboard players remove @s temperature 3
execute if score @s melon_cooling matches 1 run scoreboard players reset @s melon_cooling

# 金胡萝卜（温度抗性）
execute if score @s golden_carrot_cooling matches 1 run scoreboard players set @s temp_resistance 500
execute if score @s golden_carrot_cooling matches 1 run scoreboard players reset @s golden_carrot_cooling
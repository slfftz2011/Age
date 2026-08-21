# ===== 护甲修正（非全套铜） =====

# 金属修正（方向敏感）
scoreboard players set @s metal_count 0

# 铜装备（每件 5）
execute if items entity @s armor.head minecraft:copper_helmet run scoreboard players add @s metal_count 5
execute if items entity @s armor.chest minecraft:copper_chestplate run scoreboard players add @s metal_count 5
execute if items entity @s armor.legs minecraft:copper_leggings run scoreboard players add @s metal_count 5
execute if items entity @s armor.feet minecraft:copper_boots run scoreboard players add @s metal_count 5

# 普通金属（每件 5）
execute if items entity @s armor.head #age:metal_helmets unless items entity @s armor.head minecraft:copper_helmet run scoreboard players add @s metal_count 5
execute if items entity @s armor.chest #age:metal_chestplates unless items entity @s armor.chest minecraft:copper_chestplate run scoreboard players add @s metal_count 5
execute if items entity @s armor.legs #age:metal_leggings unless items entity @s armor.legs minecraft:copper_leggings run scoreboard players add @s metal_count 5
execute if items entity @s armor.feet #age:metal_boots unless items entity @s armor.feet minecraft:copper_boots run scoreboard players add @s metal_count 5

# 应用金属修正（方向敏感）
execute if score @s env_temp matches 65.. run scoreboard players operation @s env_temp += @s metal_count
execute if score @s env_temp matches ..64 run scoreboard players operation @s env_temp -= @s metal_count

# 皮革修正（每件 +5，保温，无方向）
execute if items entity @s armor.head minecraft:leather_helmet run scoreboard players add @s env_temp 5
execute if items entity @s armor.chest minecraft:leather_chestplate run scoreboard players add @s env_temp 5
execute if items entity @s armor.legs minecraft:leather_leggings run scoreboard players add @s env_temp 5
execute if items entity @s armor.feet minecraft:leather_boots run scoreboard players add @s env_temp 5

# 限制范围
execute if score @s env_temp matches 81.. run scoreboard players set @s env_temp 80
execute if score @s env_temp matches ..-1 run scoreboard players set @s env_temp 0
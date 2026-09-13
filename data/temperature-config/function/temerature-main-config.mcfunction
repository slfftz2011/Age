# Arbar 52
#     _         _                  ____ ____                                                              
#    / \   _ __| |__   __ _ _ __  | ___|___ \                                                             
#   / _ \ | '__| '_ \ / _` | '__| |___ \ __) |                                                            
#  / ___ \| |  | |_) | (_| | |     ___) / __/                                                             
# /_/   \_\_|  |_.__/ \__,_|_|    |____/_____|                                                            
#  _                                      _                        _       _                         _    
# | |_ ___ _ __ ___  _ __   ___ _ __ __ _| |_ _   _ _ __ ___    __| | __ _| |_ __ _ _ __   __ _  ___| | __
# | __/ _ \ '_ ` _ \| '_ \ / _ \ '__/ _` | __| | | | '__/ _ \  / _` |/ _` | __/ _` | '_ \ / _` |/ __| |/ /
# | ||  __/ | | | | | |_) |  __/ | | (_| | |_| |_| | | |  __/ | (_| | (_| | || (_| | |_) | (_| | (__|   < 
#  \__\___|_| |_| |_| .__/ \___|_|  \__,_|\__|\__,_|_|  \___|  \__,_|\__,_|\__\__,_| .__/ \__,_|\___|_|\_\
#                   |_|                                                            |_|                    
# thank you for choosing this datapack, you can also visit my planet minecraft site and browse more content!

#too hot
execute at @a if score @p temperature matches 25 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 24 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 23 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 22 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 21 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 20 run particle minecraft:falling_dripstone_water ~ ~1.3 ~ 0.2 0.3 0.2 0.1 1 force
execute at @a if score @p temperature matches 20 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true
execute at @a if score @p temperature matches 21 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true
execute at @a if score @p temperature matches 22 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true
execute at @a if score @p temperature matches 23 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true
execute at @a if score @p temperature matches 24 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true
execute at @a if score @p temperature matches 25 if score c temperaturec matches 5 run effect give @p minecraft:nausea 10 10 true

execute at @a if score @p temperature matches 20 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true
execute at @a if score @p temperature matches 21 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true
execute at @a if score @p temperature matches 22 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true
execute at @a if score @p temperature matches 23 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true
execute at @a if score @p temperature matches 24 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true
execute at @a if score @p temperature matches 25 if score c temperaturec matches 5 run effect give @p minecraft:hunger 10 0 true



#too cold
execute at @a if score @p temperature matches -25 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -24 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -23 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -22 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -21 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -20 run particle minecraft:snowflake ~ ~1.3 ~ 0.2 0.3 0.2 0.001 1 force
execute at @a if score @p temperature matches -21 run effect give @p minecraft:slowness 10 1 true
execute at @a if score @p temperature matches -22 run effect give @p minecraft:slowness 10 1 true
execute at @a if score @p temperature matches -23 run effect give @p minecraft:slowness 10 1 true
execute at @a if score @p temperature matches -24 run effect give @p minecraft:slowness 10 1 true
execute at @a if score @p temperature matches -25 run effect give @p minecraft:slowness 10 1 true



scoreboard players add c1 temperaturec 1

execute if score c1 temperaturec >= 20 temperaturec run scoreboard players reset c1 temperaturec


scoreboard players add c temperaturec 1
scoreboard players add @a temperature 0
execute if score c temperaturec >= 10 temperaturec run scoreboard players reset c temperaturec



execute as @a if score @s temperature matches -25 run title @s actionbar ["",{"text":"You Are Freezing","color":"aqua","bold":true}]
execute as @a if score @s temperature matches -24 run title @s actionbar ["",{"text":"You Are Freezing","color":"aqua","bold":true}]
execute as @a if score @s temperature matches -23 run title @s actionbar ["",{"text":"You Are Freezing","color":"aqua","bold":true}]
execute as @a if score @s temperature matches -22 run title @s actionbar ["",{"text":"You Are Freezing","color":"aqua","bold":true}]
execute as @a if score @s temperature matches -21 run title @s actionbar ["",{"text":"You Are Freezing","color":"aqua","bold":true}]

execute as @a if score @s temperature matches -20 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -19 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -18 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -17 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -16 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -15 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -14 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -13 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -12 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]
execute as @a if score @s temperature matches -11 run title @s actionbar ["",{"text":"You Are Cold","color":"dark_aqua","bold":true}]

execute as @a if score @s temperature matches -10 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -9 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -8 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -7 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -6 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -5 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -4 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -3 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -2 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches -1 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 0 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 1 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 2 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 3 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 4 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 5 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 6 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 7 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 8 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 9 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]
execute as @a if score @s temperature matches 10 run title @s actionbar ["",{"text":"You Are Fine","color":"dark_green","bold":true}]

execute as @a if score @s temperature matches 11 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 12 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 13 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 14 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 15 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 16 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 17 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 18 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 19 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]
execute as @a if score @s temperature matches 20 run title @s actionbar ["",{"text":"You Are Warm","color":"red","bold":true}]

execute as @a if score @s temperature matches 21 run title @s actionbar ["",{"text":"You Are Hot","color":"dark_red","bold":true}]
execute as @a if score @s temperature matches 22 run title @s actionbar ["",{"text":"You Are Hot","color":"dark_red","bold":true}]
execute as @a if score @s temperature matches 23 run title @s actionbar ["",{"text":"You Are Hot","color":"dark_red","bold":true}]
execute as @a if score @s temperature matches 24 run title @s actionbar ["",{"text":"You Are Hot","color":"dark_red","bold":true}]
execute as @a if score @s temperature matches 25 run title @s actionbar ["",{"text":"You Are Hot","color":"dark_red","bold":true}]




#congig
execute at @a store result score @p y run data get entity @p Pos[1] 1
scoreboard players remove @a temperature_resistance 1
execute at @a if score @p temperature_resistance > 0 temperaturec unless score @p temperature_resistance > 1000 temperaturec run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.1 1 force
execute as @a if score @s temperature > 25 temperaturec run scoreboard players set @s temperature 25
execute as @a if score @s temperature < -25 temperaturec run scoreboard players set @s temperature -25
#damage
execute as @a if score @s temperature matches 25 run damage @s 1 minecraft:in_fire
execute as @a if score @s temperature matches -25 run damage @s 1 minecraft:freeze

#items
#armors
execute as @a if items entity @s armor.head minecraft:turtle_helmet if score @s temperature >= 9 temperaturec run scoreboard players remove @s temperature 1
execute as @a if items entity @s armor.* minecraft:leather_chestplate if score @s temperature < -9 temperaturec run scoreboard players add @s temperature 1
#usable
execute as @a if score @s temperature > 10c temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @p temperature 17
execute as @a if score @s temperature > 0 temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @p temperature 10
execute as @a unless score @s temperature > 0 temperaturec if score @s potion_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s potion_cooling matches 1 run scoreboard players reset @p potion_cooling
execute as @a if score @s beetroot_soup_cooling matches 1 run scoreboard players remove @p temperature 15
execute as @a if score @s beetroot_soup_cooling matches 1 run scoreboard players reset @p beetroot_soup_cooling
execute as @a if score @s warp_rabbit_stew matches 1 run scoreboard players add @p temperature 8
execute as @a if score @s warp_rabbit_stew matches 1 run scoreboard players reset @p warp_rabbit_stew
execute as @a if score @s beetroot_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s beetroot_cooling matches 1 run scoreboard players reset @p beetroot_cooling
execute as @a if score @s apple_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s apple_cooling matches 1 run scoreboard players reset @p apple_cooling
execute as @a if score @s carrot_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s carrot_cooling matches 1 run scoreboard players reset @p carrot_cooling
execute as @a if score @s sweet_berries_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s sweet_berries_cooling matches 1 run scoreboard players reset @p sweet_berries_cooling
execute as @a if score @s glow_berries_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s glow_berries_cooling matches 1 run scoreboard players reset @p glow_berries_cooling
execute as @a if score @s melon_cooling matches 1 run scoreboard players remove @p temperature 5
execute as @a if score @s melon_cooling matches 1 run scoreboard players reset @p melon_cooling
execute as @a if score @s golden_carrot_cooling matches 1 run scoreboard players set @p temperature_resistance 500
execute as @a if score @s golden_carrot_cooling matches 1 run scoreboard players reset @p golden_carrot_cooling

#resistance temperature
execute as @a if score @s temperature_resistance > 0 c run scoreboard players set @s temperature 0




#biomy
execute at @a if biome ~ ~ ~ #c:is_cold if score c temperaturec matches 5 unless score @p temperature matches -25 run scoreboard players remove @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_hot if score @p y > 0 temperaturec unless dimension minecraft:the_nether if score c temperaturec matches 5 unless score @p temperature matches 25 run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_floral if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_floral if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_plains if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_plains if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_aquatic if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_aquatic if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_aquatic_icy if score c temperaturec matches 5 unless score @p temperature matches -25 run scoreboard players remove @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_beach if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_beach if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_birch_forest if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_birch_forest if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_underground if score c temperaturec matches 5 unless score @p temperature matches -18 unless score @p temperature matches -25 run scoreboard players remove @p temperature 2
execute at @a if score @p y <= 0 temperaturec if score c temperaturec matches 5 unless score @p temperature matches -18 unless score @p temperature matches -25 run scoreboard players remove @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_forest if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_forest if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

execute at @a if biome ~ ~ ~ #c:is_mushroom if score c temperaturec matches 5 if score @p temperature > 0 temperaturec run scoreboard players remove @p temperature 1
execute at @a if biome ~ ~ ~ #c:is_mushroom if score @p y > 0 temperaturec if score c temperaturec matches 5 if score @p temperature < 0 temperaturec run scoreboard players add @p temperature 1

#blocks
execute at @a if block ~ ~1 ~ water if score c1 temperaturec matches 5 if score @p temperature >= -10c temperaturec unless score @p temperature matches -25 run scoreboard players remove @p temperature 1
execute at @a if block ~ ~ ~0.7 minecraft:furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~ ~ ~-0.7 minecraft:furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~0.7 ~ ~ minecraft:furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~-0.7 ~ ~ minecraft:furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1

execute at @a if block ~ ~ ~0.7 minecraft:blast_furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~ ~ ~-0.7 minecraft:blast_furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~0.7 ~ ~ minecraft:blast_furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~-0.7 ~ ~ minecraft:blast_furnace[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 2

execute at @a if block ~ ~ ~0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~ ~ ~-0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~0.7 ~ ~ minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~-0.7 ~ ~ minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~0.7 ~ ~0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~0.7 ~ ~-0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~0.7 ~ ~0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~-0.7 ~ ~0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~-0.7 ~ ~-0.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 5
execute at @a if block ~ ~ ~1.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 3
execute at @a if block ~ ~ ~-1.7 minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 3
execute at @a if block ~1.7 ~ ~ minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 3
execute at @a if block ~-1.7 ~ ~ minecraft:soul_campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 3

execute at @a if block ~ ~ ~0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~ ~ ~-0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~0.7 ~ ~ minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~-0.7 ~ ~ minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~0.7 ~ ~0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~0.7 ~ ~-0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~0.7 ~ ~0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~-0.7 ~ ~0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~-0.7 ~ ~-0.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 5
execute at @a if block ~ ~ ~1.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 3
execute at @a if block ~ ~ ~-1.7 minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 3
execute at @a if block ~1.7 ~ ~ minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 3
execute at @a if block ~-1.7 ~ ~ minecraft:campfire[lit=true ] if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 3

execute at @a if block ~ ~ ~ minecraft:torch if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 1
execute at @a if block ~ ~ ~ minecraft:soul_torch if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 1

execute at @a if block ~ ~ ~ minecraft:lantern if score c temperaturec matches 5 if score @p temperature < 15 temperaturec run scoreboard players add @p temperature 2
execute at @a if block ~ ~ ~ minecraft:soul_lantern if score c temperaturec matches 5 if score @p temperature > -15 temperaturec run scoreboard players remove @p temperature 2

execute at @a if block ~ ~ ~0.7 minecraft:lantern if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~ ~ ~-0.7 minecraft:lantern if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~0.7 ~ ~ minecraft:lantern if score c temperaturec matches 5 run scoreboard players add @p temperature 2
execute at @a if block ~-0.7 ~ ~ minecraft:lantern if score c temperaturec matches 5 run scoreboard players add @p temperature 2

execute at @a if block ~ ~ ~0.7 minecraft:soul_lantern if score c temperaturec matches 5 run scoreboard players remove @p temperature 2
execute at @a if block ~ ~ ~-0.7 minecraft:soul_lantern if score c temperaturec matches 5 run scoreboard players remove @p temperature 2
execute at @a if block ~0.7 ~ ~ minecraft:soul_lantern if score c temperaturec matches 5 run scoreboard players remove @p temperature 2
execute at @a if block ~-0.7 ~ ~ minecraft:soul_lantern if score c temperaturec matches 5 run scoreboard players remove @p temperature 2

execute at @a if block ~ ~ ~0.7 minecraft:smoker[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~ ~ ~-0.7 minecraft:smoker[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~0.7 ~ ~ minecraft:smoker[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1
execute at @a if block ~-0.7 ~ ~ minecraft:smoker[lit=true ] if score c temperaturec matches 5 run scoreboard players add @p temperature 1

execute at @a if block ~ ~ ~ water if score c1 temperaturec matches 5 if score @p temperature >= -10c temperaturec unless score @p temperature matches -25 run scoreboard players remove @p temperature 1
execute at @a if block ~ ~ ~ minecraft:powder_snow if score c1 temperaturec matches 5 unless score @p temperature matches -25 run scoreboard players remove @p temperature 1
execute at @a if block ~ ~-0.1 ~ magma_block if score c1 temperaturec matches 5 unless score @p temperature matches 25 run scoreboard players add @p temperature 1
execute at @a if block ~ ~ ~ lava run scoreboard players set @p temperature 25
execute at @a if block ~ ~1 ~ lava run scoreboard players set @p temperature 25

execute at @a if score @p sleep_temperature matches 1 if block ~ ~ ~ #minecraft:beds if score @p temperature < 19 temperaturec run scoreboard players add @p temperature 1
execute at @a if score @p sleep_temperature matches 1 unless block ~ ~ ~ #minecraft:beds run scoreboard players reset @p sleep_temperature
execute at @a if block ~ ~ ~ fire run scoreboard players add @p temperature 1
# dimensions
execute at @a unless score nether temperaturec matches 1 if dimension minecraft:the_nether unless score c disable_nether matches 1 if score c1 temperaturec matches 5 unless score @p temperature matches 25 run scoreboard players add @p temperature 1
execute at @a unless score end temperaturec matches 1 if dimension minecraft:the_end unless score c disable_end matches 1 if score c1 temperaturec matches 5 unless score @p temperature matches -25 run scoreboard players remove @p temperature 1



# admin-config

scoreboard players enable @a[gamemode=creative ] admin
scoreboard players add @a[gamemode=creative ] is_admin 1
execute as @a if score @s is_admin matches 1 run tellraw @s ["\n\n\n",{"text":"are you cheating or setting up?","color":"red","underlined":true},"\n\nit doesn't matter anyway, when you use ",{"text":"/trigger admin","clickEvent":{"action":"suggest_command","value":"/trigger admin"},"underlined":true,"color":"blue"}," you open the admin menu\n\n\n "]
scoreboard players reset @a[gamemode=survival ] is_admin
execute as @a[gamemode=creative ] if score @s admin matches 1 run tellraw @p ["\n\n\n\n\n",{"text":"Admin Menu (click to sellect)","color":"gold","bold":true},"\n",{"text":"Disable Temperature in nether ","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger disable_nether"}},"\n",{"text":"enable Temperature in nether ","clickEvent":{"action":"run_command","value":"/trigger enable_nether"},"color":"aqua"},"\n",{"text":"Disable Temperature in end ","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger disable_end"}},"\n",{"text":"enable Temperature in end ","clickEvent":{"action":"run_command","value":"/trigger enable_end"},"color":"aqua"},"\n",{"text":"temperature speed:","color":"dark_aqua","bold":true,"underlined":true},"\n",{"text":"very slow","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 150"},"color":"dark_red"},"\n",{"text":"slow","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 100"},"color":"red"},"\n",{"text":"normal","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 50"},"color":"dark_green"},"\n",{"text":"fast","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 25"},"color":"yellow"},"\n",{"text":"very fast","clickEvent":{"action":"run_command","value":"/scoreboard players set 10 temperaturec 10"},"color":"gold"},"\n",{"text":"Disable Temperature for me","color":"white","underlined":true,"clickEvent":{"action":"run_command","value":"/scoreboard players set @p temperature_resistance 999999999"}},{"text":"\n","color":"white","underlined":true},{"text":"Enable Temperature for me","color":"white","underlined":true,"clickEvent":{"action":"run_command","value":"/scoreboard players reset @p temperature_resistance"}},"\n",{"text":"(use /datapack disable file/temeprature to disable this datapack)","color":"red"}]
execute as @a[gamemode=creative ] if score @s admin matches 1 run scoreboard players reset @a admin
execute as @a if score @s temperature_resistance > 0 temperaturec run scoreboard players set @s temperature 0
execute as @a if score @s disable_nether matches 1 run scoreboard players set nether temperaturec 1
execute as @a if score @s enable_nether matches 1 run scoreboard players set nether temperaturec 0
execute as @a if score @s disable_end matches 1 run scoreboard players set end temperaturec 1
execute as @a if score @s enable_end matches 1 run scoreboard players set end temperaturec 0
scoreboard players reset @a disable_nether
scoreboard players reset @a disable_end
scoreboard players reset @a enable_nether
scoreboard players reset @a enable_end
scoreboard players enable @a[gamemode=creative ] disable_end
scoreboard players enable @a[gamemode=creative ] disable_nether
scoreboard players enable @a[gamemode=creative ] enable_nether
scoreboard players enable @a[gamemode=creative ] enable_end







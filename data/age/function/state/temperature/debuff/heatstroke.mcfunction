execute store result score @s heatstroke run random value 0..4

execute at @s if score @s heatstroke matches 1 run setblock ~ ~ ~ minecraft:fire
execute at @s if score @s heatstroke matches 1 run setblock ~ ~ ~ minecraft:air

execute if score @s heatstroke matches 2..3 run effect give @s minecraft:blindness 3

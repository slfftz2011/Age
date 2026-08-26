execute store result score @s heatstroke run random value 0..4

execute at @s if score @s heatstroke matches 1 run setblock ~ ~ ~ minecraft:fire

execute if score @s heatstroke matches 2 run effect give @s minecraft:blindness 3

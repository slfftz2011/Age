scoreboard players add @s frozen 1
execute if score @s frozen matches 3.. run damage @s 2 minecraft:freeze
execute if score @s frozen matches 3.. run scoreboard players set @s frozen 0
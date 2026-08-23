scoreboard players add @s thirst 4
scoreboard players remove @s temperature 4
execute if score @s thirst >= @s thirst_max run scoreboard players operation @s thirst = @s thirst_max
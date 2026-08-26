scoreboard players add @s thirst 3
scoreboard players remove @s temperature 2
execute if score @s thirst >= @s thirst_max run scoreboard players operation @s thirst = @s thirst_max
advancement revoke @s only age:hydrate/juicy
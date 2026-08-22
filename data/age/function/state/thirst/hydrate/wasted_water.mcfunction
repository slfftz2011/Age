scoreboard players add @s thirst 4
execute if score @s thirst >= @s thirst_max run scoreboard players operation @s thirst = @s thirst_max
scoreboard players add @s thirst_buff_timer 6000
execute if score @s thirst_buff_timer matches 24000.. run scoreboard players set @s thirst_buff_timer 24000

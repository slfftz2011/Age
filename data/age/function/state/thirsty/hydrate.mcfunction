雨露天补水（每320 tick +1）
execute if predicate age:weather/is_raining if block ~ ~1 ~ air if block ~ ~2 ~ air run scoreboard players add @s thirst_timer 1
execute if score @s thirst_timer matches 320.. run scoreboard players add @s thirst 1
execute if score @s thirst_timer matches 320.. run scoreboard players set @s thirst_timer 0
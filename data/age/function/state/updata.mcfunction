scoreboard players add @a global_state_timer 1
scoreboard players add @a temperature_timer 1

execute as @a if score @s global_state_timer matches 20.. run scoreboard players set @s global_state_timer 0

execute as @a if score @s temperature_timer matches 10.. run function age:state/temperature/updata
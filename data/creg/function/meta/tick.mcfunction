##
 # tick.mcfunction
 # 
 #
 # Created by imalittlhigh
##

execute as @a[gamemode=!creative,gamemode=!spectator] store result score @s creg.hunger run data get entity @s foodLevel
execute as @a[tag=!creg.givehealth,gamemode=!creative,gamemode=!spectator] store result score @s creg.health.max.main run attribute @s minecraft:max_health base get
execute as @a[tag=!creg.givehealth,gamemode=!creative,gamemode=!spectator] store result score @s creg.health.curr.main run data get entity @s Health


#edit the hunger score for how much hunger is needed for the regeneration
execute as @a[scores={creg.hunger=14..},gamemode=!creative,gamemode=!spectator] unless score @s creg.health.curr.main = @s creg.health.max.main run scoreboard players add @s creg.timer 1
#edit the hunger score for how much hunger is needed for the regeneration (this is the score above -1)
execute as @a[scores={creg.hunger=..13,creg.timer=1..}] run scoreboard players set @s creg.timer 0

#if you change how fast the regen is and its less than 45 ticks, change this 40 to be lower
execute as @a[scores={creg.timer=40},gamemode=!creative,gamemode=!spectator] unless score @s creg.health.curr.main = @s creg.health.max.main run function creg:regen
#adjust the regen timer here (change 160 to whatever amout of ticks you want)
execute as @a[scores={creg.timer=160..},gamemode=!creative,gamemode=!spectator] run scoreboard players set @s creg.timer 0
execute as @a[scores={creg.timer=1..},gamemode=!creative,gamemode=!spectator] if score @s creg.health.curr.main = @s creg.health.max.main run scoreboard players set @s creg.timer 0
##
 # test.mcfunction
 # 
 #
 # Created by .
##

scoreboard players set @s creg.health.math 1
execute store result score @s creg.health.max run attribute @s minecraft:max_health base get
execute store result score @s creg.hunger run data get entity @s foodLevel
execute store result score @s creg.health.curr run data get entity @s Health

scoreboard players operation @s creg.health.curr += @s creg.health.math

execute as @s[scores={creg.health.curr=2}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 2
execute as @s[scores={creg.health.curr=3}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 3
execute as @s[scores={creg.health.curr=4}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 4
execute as @s[scores={creg.health.curr=5}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 5
execute as @s[scores={creg.health.curr=6}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 6
execute as @s[scores={creg.health.curr=7}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 7
execute as @s[scores={creg.health.curr=8}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 8
execute as @s[scores={creg.health.curr=9}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 9
execute as @s[scores={creg.health.curr=10}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 10
execute as @s[scores={creg.health.curr=11}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 11
execute as @s[scores={creg.health.curr=12}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 12
execute as @s[scores={creg.health.curr=13}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 13
execute as @s[scores={creg.health.curr=14}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 14
execute as @s[scores={creg.health.curr=15}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 15
execute as @s[scores={creg.health.curr=16}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 16
execute as @s[scores={creg.health.curr=17}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 17
execute as @s[scores={creg.health.curr=18}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 18
execute as @s[scores={creg.health.curr=19}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 19
execute as @s[scores={creg.health.curr=20}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 20
execute as @s[scores={creg.health.curr=21}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 21
execute as @s[scores={creg.health.curr=22}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 22
execute as @s[scores={creg.health.curr=23}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 23
execute as @s[scores={creg.health.curr=24}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 24
execute as @s[scores={creg.health.curr=25}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 25
execute as @s[scores={creg.health.curr=26}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 26
execute as @s[scores={creg.health.curr=27}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 27
execute as @s[scores={creg.health.curr=28}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 28
execute as @s[scores={creg.health.curr=29}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 29
execute as @s[scores={creg.health.curr=30}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 30
execute as @s[scores={creg.health.curr=31}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 31
execute as @s[scores={creg.health.curr=32}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 32
execute as @s[scores={creg.health.curr=33}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 33
execute as @s[scores={creg.health.curr=34}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 34
execute as @s[scores={creg.health.curr=35}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 35
execute as @s[scores={creg.health.curr=36}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 36
execute as @s[scores={creg.health.curr=37}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 37
execute as @s[scores={creg.health.curr=38}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 38
execute as @s[scores={creg.health.curr=39}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 39
execute as @s[scores={creg.health.curr=40}] unless score @s creg.health.curr >= @s creg.health.max run attribute @s minecraft:max_health base set 40

execute unless score @s creg.health.curr matches 41.. run effect give @s instant_health 11 1 true
execute unless score @s creg.health.curr matches 41.. run effect give @s minecraft:hunger 11 4 true

execute unless score @s creg.health.curr matches 41.. run tag @s add creg.givehealth

execute unless score @s creg.health.curr matches 41.. run schedule function creg:modify/add 2t

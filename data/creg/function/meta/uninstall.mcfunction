##
 # uninstall.mcfunction
 # 
 #
 # Created by .
##
gamerule naturalRegeneration true

scoreboard objectives remove creg.health.max
scoreboard objectives remove creg.health.max.main 
scoreboard objectives remove creg.health.curr 
scoreboard objectives remove creg.health.curr.main 
scoreboard objectives remove creg.health.math 
scoreboard objectives remove creg.hunger 
scoreboard objectives remove creg.timer 

tag @a remove creg.givehealth
attribute @s minecraft:movement_speed modifier add age:frozen_slowness -0.12 add_multiplied_base
tag @s add frozen
tellraw @s {text:"你冻僵了",color:"red"}
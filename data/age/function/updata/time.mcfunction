#-------------------------
# 时间更新
# age:updata/time
#-------------------------
scoreboard players remove a time 1200
scoreboard players add time task 1
execute if entity @a[team=old_stone_age] run scoreboard players add old_stone_age stage 1
execute if entity @a[team=mid_stone_age] run scoreboard players add mid_stone_age stage 1
execute if entity @a[team=new_stone_age] run scoreboard players add new_stone_age stage 1
execute if entity @a[team=copper_age] run scoreboard players add copper_age stage 1
execute if entity @a[team=bronze_age] run scoreboard players add bronze_age stage 1
execute if entity @a[team=pre_iron_age] run scoreboard players add pre_iron_age stage 1
execute if entity @a[team=mid_iron_age] run scoreboard players add mid_iron_age stage 1
execute if entity @a[team=late_iron_age] run scoreboard players add late_iron_age stage 1
execute if entity @a[team=steam_age] run scoreboard players add steam_age stage 1
execute if entity @a[team=steam_age_2] run scoreboard players add steam_age_2 stage 1
execute if entity @a[team=steam_age_3] run scoreboard players add steam_age_3 stage 1
execute if entity @a[team=steam_age_4] run scoreboard players add steam_age_4 stage 1
execute if entity @a[team=steam_age_5] run scoreboard players add steam_age_5 stage 1

effect give @a[team=old_stone_age] bad_omen 45 9

execute if score time task matches 20.. run function age:task/roll
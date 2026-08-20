#-------------------------
# 数据包主循环
# age:loop
#-------------------------


# 计时器
scoreboard players add a time 1
execute if score a time matches 1200.. positioned over world_surface positioned 0 0 0 run function age:updata/time


# 新玩家加入
function age:updata/new


# Bossbar
bossbar set old_stone_age players @a[team=old_stone_age]
bossbar set mid_stone_age players @a[team=mid_stone_age]
bossbar set new_stone_age players @a[team=new_stone_age]
bossbar set copper_age players @a[team=copper_age]
bossbar set bronze_age players @a[team=bronze_age]
bossbar set pre_iron_age players @a[team=pre_iron_age]
bossbar set mid_iron_age players @a[team=mid_iron_age]
bossbar set late_iron_age players @a[team=late_iron_age]
bossbar set steam_age players @a[team=steam_age]
bossbar set steam_age_2 players @a[team=steam_age_2]
bossbar set steam_age_3 players @a[team=steam_age_3]
bossbar set steam_age_4 players @a[team=steam_age_4]
bossbar set steam_age_5 players @a[team=steam_age_5]
bossbar set modern_age players @a[team=modern_age]

execute store result bossbar old_stone_age value run scoreboard players get old_stone_age stage
execute store result bossbar mid_stone_age value run scoreboard players get mid_stone_age stage
execute store result bossbar new_stone_age value run scoreboard players get new_stone_age stage
execute store result bossbar copper_age value run scoreboard players get copper_age stage
execute store result bossbar bronze_age value run scoreboard players get bronze_age stage 
execute store result bossbar pre_iron_age value run scoreboard players get pre_iron_age stage 
execute store result bossbar mid_iron_age value run scoreboard players get mid_iron_age stage 
execute store result bossbar late_iron_age value run scoreboard players get late_iron_age stage  
execute store result bossbar steam_age value run scoreboard players get steam_age stage  
execute store result bossbar steam_age_2 value run scoreboard players get steam_age_2 stage   
execute store result bossbar steam_age_3 value run scoreboard players get steam_age_3 stage  
execute store result bossbar steam_age_4 value run scoreboard players get steam_age_4 stage  
execute store result bossbar steam_age_5 value run scoreboard players get steam_age_5 stage  


# 记分板
scoreboard players set @a[team=old_stone_age] age 1
scoreboard players set @a[team=mid_stone_age] age 2
scoreboard players set @a[team=new_stone_age] age 3
scoreboard players set @a[team=copper_age] age 4
scoreboard players set @a[team=bronze_age] age 5
scoreboard players set @a[team=pre_iron_age] age 6
scoreboard players set @a[team=mid_iron_age] age 7
scoreboard players set @a[team=late_iron_age] age 8
scoreboard players set @a[team=steam_age] age 9
scoreboard players set @a[team=steam_age_2] age 10
scoreboard players set @a[team=steam_age_3] age 11
scoreboard players set @a[team=steam_age_4] age 12
scoreboard players set @a[team=steam_age_5] age 13
scoreboard players set @a[team=modern_age] age 14


# 时代晋升
execute if score old_stone_age stage matches 2900.. run function age:updata/old_stone
execute if score mid_stone_age stage matches 600.. run function age:updata/mid_stone
execute if score new_stone_age stage matches 1000.. run function age:updata/new_stone
execute if score copper_age stage matches 250.. run function age:updata/copper
execute if score bronze_age stage matches 1600.. run function age:updata/bronze
execute if score pre_iron_age stage matches 560.. run function age:updata/pre_iron
execute if score mid_iron_age stage matches 800.. run function age:updata/mid_iron
execute if score late_iron_age stage matches 7200.. run function age:updata/late_iron
execute if score steam_age stage matches 400.. run function age:updata/steam
execute if score steam_age_2 stage matches 280.. run function age:updata/steam_2
execute if score steam_age_3 stage matches 800.. run function age:updata/steam_3
execute if score steam_age_4 stage matches 1280.. run function age:updata/steam_4
execute if score steam_age_5 stage matches 5120.. run function age:updata/steam_5


# 物品替换
execute as @a[team=old_stone_age] if items entity @s container.* flint[custom_data={special:1b,from:"old_stone_age"}] run function age:convert/flint
execute as @a[team=old_stone_age] if items entity @s weapon.mainhand stone_axe[!custom_data={special:0b,from:"old_stone_age"}] run loot replace entity @s weapon.mainhand loot age:chopper
execute as @a[team=old_stone_age] if items entity @s weapon.mainhand stone_sword[!custom_data={special:0b,from:"old_stone_age"}] run loot replace entity @s weapon.mainhand loot age:scraper
execute as @a[team=old_stone_age] if items entity @s weapon.mainhand stone_shovel[!custom_data={special:0b,from:"old_stone_age"}] run loot replace entity @s weapon.mainhand loot age:engraver
execute as @a[team=old_stone_age] if items entity @s container.* #age:ban/old_stone_age run function age:clear/old_stone_age


# 效果给予
effect give @a[team=old_stone_age] unluck 5 9
effect clear @a[team=old_stone_age] hero_of_the_village
effect give @a[team=old_stone_age] hunger 5 1
effect give @a[team=old_stone_age] mining_fatigue 5 1
effect give @a[team=old_stone_age] slowness 5 1
effect give @a[team=old_stone_age] weakness 5



# 配方锁定
execute as @a[team=old_stone_age] run function age:recipe_take/old_stone_age


# 任务跟踪
function age:task/check

execute as @a[tag=task_old_stone_1_tracking] run function age:task/old_stone_age/main/1_track
execute as @a[tag=task_old_stone_2a_tracking] run function age:task/old_stone_age/main/2a_track
execute as @a[tag=task_old_stone_2b_tracking] run function age:task/old_stone_age/main/2b_track
execute as @a[tag=task_old_stone_4a_tracking] run function age:task/old_stone_age/main/4a_track
execute as @a if score @s task_old_stone_a_done matches 1 if score @s task_old_stone_b_done matches 1 run function age:task/old_stone_age/main/done

# 背包禁用
execute as @a[team=old_stone_age] run function age:bplock/old_stone_age
kill @e[type=item,nbt={Item:{id:"minecraft:barrier"}}]

# 状态更新
execute as @a run function age:state/update

scoreboard players add #state time 1
execute if score #state time matches 40.. run function age:state/show


# 其他
# 检测旧石器玩家是否看向容器，如果是则锁定
execute as @a[team=old_stone_age] at @s run function age:container/unlock_radius
execute as @a[team=old_stone_age] at @s anchored eyes run function age:container/lock_sight
# 破坏旧石器玩家周围红石方块
execute as @a[team=old_stone_age] at @s run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace #age:redstone_blocks destroy
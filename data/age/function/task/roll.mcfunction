# 重置计时器
scoreboard players set time task 0
tag @a remove task_done

execute if score old_stone_age task matches 1 run scoreboard objectives remove pig_hunt
execute if score old_stone_age task matches 2 run scoreboard objectives remove sheep_hunt
execute if score old_stone_age task matches 3 run scoreboard objectives remove cow_hunt
execute if score old_stone_age task matches 4 run scoreboard objectives remove rabbit_hunt
execute if score old_stone_age task matches 5 run scoreboard objectives remove horse_hunt
execute if score old_stone_age task matches 6 run scoreboard objectives remove chicken_hunt

execute if score old_stone_age task matches 7 run scoreboard objectives remove zombie_suppress
execute if score old_stone_age task matches 8 run scoreboard objectives remove drowned_suppress
execute if score old_stone_age task matches 9 run scoreboard objectives remove husk_suppress
execute if score old_stone_age task matches 10 run scoreboard objectives remove skeleton_suppress
execute if score old_stone_age task matches 11 run scoreboard objectives remove stray_suppress
execute if score old_stone_age task matches 12 run scoreboard objectives remove bogged_suppress
execute if score old_stone_age task matches 13 run scoreboard objectives remove zombie_villager_suppress
execute if score old_stone_age task matches 14 run scoreboard objectives remove phantom_suppress
execute if score old_stone_age task matches 15 run scoreboard objectives remove creeper_suppress
execute if score old_stone_age task matches 16 run scoreboard objectives remove spider_suppress
execute if score old_stone_age task matches 17 run scoreboard objectives remove cave_spider_suppress
execute if score old_stone_age task matches 18 run scoreboard objectives remove enderman_suppress




execute if score old_stone_age task matches 1 run scoreboard objectives remove pig_updata
execute if score old_stone_age task matches 2 run scoreboard objectives remove sheep_updata
execute if score old_stone_age task matches 3 run scoreboard objectives remove cow_updata
execute if score old_stone_age task matches 4 run scoreboard objectives remove rabbit_updata
execute if score old_stone_age task matches 5 run scoreboard objectives remove horse_updata
execute if score old_stone_age task matches 6 run scoreboard objectives remove chicken_updata

execute if score old_stone_age task matches 7 run scoreboard objectives remove zombie_all
execute if score old_stone_age task matches 8 run scoreboard objectives remove drowned_all
execute if score old_stone_age task matches 9 run scoreboard objectives remove husk_all
execute if score old_stone_age task matches 10 run scoreboard objectives remove skeleton_all
execute if score old_stone_age task matches 11 run scoreboard objectives remove stray_all
execute if score old_stone_age task matches 12 run scoreboard objectives remove bogged_all
execute if score old_stone_age task matches 13 run scoreboard objectives remove zombie_villager_all
execute if score old_stone_age task matches 14 run scoreboard objectives remove phantom_all
execute if score old_stone_age task matches 15 run scoreboard objectives remove creeper_all
execute if score old_stone_age task matches 16 run scoreboard objectives remove spider_all
execute if score old_stone_age task matches 17 run scoreboard objectives remove cave_spider_all
execute if score old_stone_age task matches 18 run scoreboard objectives remove enderman_all



execute store result score old_stone_age task run random value 0..6

execute if score old_stone_age task matches 1 run scoreboard objectives add pig_hunt minecraft.killed:minecraft.pig "狩猎猪"
execute if score old_stone_age task matches 2 run scoreboard objectives add sheep_hunt minecraft.killed:minecraft.sheep "狩猎羊"
execute if score old_stone_age task matches 3 run scoreboard objectives add cow_hunt minecraft.killed:minecraft.cow "狩猎牛"
execute if score old_stone_age task matches 4 run scoreboard objectives add rabbit_hunt minecraft.killed:minecraft.rabbit "狩猎兔"
execute if score old_stone_age task matches 5 run scoreboard objectives add horse_hunt minecraft.killed:minecraft.horse "狩猎马"
execute if score old_stone_age task matches 6 run scoreboard objectives add chicken_hunt minecraft.killed:minecraft.chicken "狩猎鸡"

execute if score old_stone_age task matches 7 run scoreboard objectives add zombie_suppress minecraft.killed:minecraft.zombie "围剿僵尸"
execute if score old_stone_age task matches 8 run scoreboard objectives add drowned_suppress minecraft.killed:minecraft.drowned "围剿溺尸"
execute if score old_stone_age task matches 9 run scoreboard objectives add husk_suppress minecraft.killed:minecraft.husk "围剿尸壳"
execute if score old_stone_age task matches 10 run scoreboard objectives add skeleton_suppress minecraft.killed:minecraft.skeleton "围剿骷髅"
execute if score old_stone_age task matches 11 run scoreboard objectives add stray_suppress minecraft.killed:minecraft.horse "围剿流浪者"
execute if score old_stone_age task matches 12 run scoreboard objectives add bogged_suppress minecraft.killed:minecraft.bogged "围剿沼骸"
execute if score old_stone_age task matches 13 run scoreboard objectives add zombie_villager_suppress minecraft.killed:minecraft.sheep "围剿僵尸村民"
execute if score old_stone_age task matches 14 run scoreboard objectives add phantom_suppress minecraft.killed:minecraft.cow "围剿幻翼"
execute if score old_stone_age task matches 15 run scoreboard objectives add creeper_suppress minecraft.killed:minecraft.creeper "围剿苦力怕"
execute if score old_stone_age task matches 16 run scoreboard objectives add spider_suppress minecraft.killed:minecraft.spider "围剿蜘蛛"
execute if score old_stone_age task matches 17 run scoreboard objectives add cave_spider_suppress minecraft.killed:minecraft.cave_spider "围剿洞穴蜘蛛"
execute if score old_stone_age task matches 18 run scoreboard objectives add enderman_suppress minecraft.killed:minecraft.enderman "围剿末影人"





execute if score old_stone_age task matches 1 run scoreboard objectives add pig_updata dummy
execute if score old_stone_age task matches 2 run scoreboard objectives add sheep_updata dummy
execute if score old_stone_age task matches 3 run scoreboard objectives add cow_updata dummy
execute if score old_stone_age task matches 4 run scoreboard objectives add rabbit_updata dummy
execute if score old_stone_age task matches 5 run scoreboard objectives add horse_updata dummy
execute if score old_stone_age task matches 6 run scoreboard objectives add chicken_updata dummy

execute if score old_stone_age task matches 7 run scoreboard objectives add zombie_all dummy
execute if score old_stone_age task matches 8 run scoreboard objectives add drowned_all dummy
execute if score old_stone_age task matches 9 run scoreboard objectives add husk_all dummy
execute if score old_stone_age task matches 10 run scoreboard objectives add skeleton_all dummy
execute if score old_stone_age task matches 11 run scoreboard objectives add stray_all dummy
execute if score old_stone_age task matches 12 run scoreboard objectives add bogged_all dummy
execute if score old_stone_age task matches 13 run scoreboard objectives add zombie_villager_all dummy
execute if score old_stone_age task matches 14 run scoreboard objectives add phantom_all dummy
execute if score old_stone_age task matches 15 run scoreboard objectives add creeper_all dummy
execute if score old_stone_age task matches 16 run scoreboard objectives add spider_all dummy
execute if score old_stone_age task matches 17 run scoreboard objectives add cave_spider_all dummy
execute if score old_stone_age task matches 18 run scoreboard objectives add enderman_all dummy





# 更新 Bossbar 显示
function age:task/show
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

execute if score old_stone_age task matches 19 run scoreboard objectives remove cod_fish
execute if score old_stone_age task matches 20 run scoreboard objectives remove salmon_fish
execute if score old_stone_age task matches 21 run scoreboard objectives remove tropical_fish
execute if score old_stone_age task matches 22 run scoreboard objectives remove squid_fish
execute if score old_stone_age task matches 23 run scoreboard objectives remove glow_squid_fish
execute if score old_stone_age task matches 24 run scoreboard objectives remove puffer_fish

execute if score old_stone_age task matches 25 run scoreboard objectives remove veg_eat
execute if score old_stone_age task matches 26 run scoreboard objectives remove seed_eat
execute if score old_stone_age task matches 27 run scoreboard objectives remove berry_eat
execute if score old_stone_age task matches 28 run scoreboard objectives remove apple_eat
execute if score old_stone_age task matches 29 run scoreboard objectives remove melon_eat
execute if score old_stone_age task matches 30 run scoreboard objectives remove pumpkin_eat
execute if score old_stone_age task matches 31 run scoreboard objectives remove pork_eat
execute if score old_stone_age task matches 32 run scoreboard objectives remove mutton_eat
execute if score old_stone_age task matches 33 run scoreboard objectives remove beef_eat
execute if score old_stone_age task matches 34 run scoreboard objectives remove rabbit_eat
execute if score old_stone_age task matches 35 run scoreboard objectives remove chicken_eat
execute if score old_stone_age task matches 36 run scoreboard objectives remove cod_eat
execute if score old_stone_age task matches 37 run scoreboard objectives remove salmon_eat
execute if score old_stone_age task matches 38 run scoreboard objectives remove tropical_eat
execute if score old_stone_age task matches 39 run scoreboard objectives remove puffer_eat
execute if score old_stone_age task matches 40 run scoreboard objectives remove rotten_eat
execute if score old_stone_age task matches 41 run scoreboard objectives remove spider_eye_eat




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


execute if score old_stone_age task matches 19 run scoreboard objectives remove cod_updata
execute if score old_stone_age task matches 20 run scoreboard objectives remove salmon_updata
execute if score old_stone_age task matches 21 run scoreboard objectives remove tropical_updata
execute if score old_stone_age task matches 22 run scoreboard objectives remove squid_updata
execute if score old_stone_age task matches 23 run scoreboard objectives remove glow_squid_updata
execute if score old_stone_age task matches 24 run scoreboard objectives remove puffer_updata

execute if score old_stone_age task matches 25 run scoreboard objectives remove veg_updata
execute if score old_stone_age task matches 26 run scoreboard objectives remove seed_updata
execute if score old_stone_age task matches 27 run scoreboard objectives remove berry_updata
execute if score old_stone_age task matches 28 run scoreboard objectives remove apple_updata
execute if score old_stone_age task matches 29 run scoreboard objectives remove melon_updata
execute if score old_stone_age task matches 30 run scoreboard objectives remove pumpkin_updata
execute if score old_stone_age task matches 31 run scoreboard objectives remove pork_updata
execute if score old_stone_age task matches 32 run scoreboard objectives remove mutton_updata
execute if score old_stone_age task matches 33 run scoreboard objectives remove beef_updata
execute if score old_stone_age task matches 34 run scoreboard objectives remove rabbit_updata
execute if score old_stone_age task matches 35 run scoreboard objectives remove chicken_updata
execute if score old_stone_age task matches 36 run scoreboard objectives remove cod_updata
execute if score old_stone_age task matches 37 run scoreboard objectives remove salmon_updata
execute if score old_stone_age task matches 38 run scoreboard objectives remove tropical_updata
execute if score old_stone_age task matches 39 run scoreboard objectives remove puffer_updata
execute if score old_stone_age task matches 40 run scoreboard objectives remove rotten_updata
execute if score old_stone_age task matches 41 run scoreboard objectives remove spider_eye_updata



execute store result score old_stone_age task run random value 0..41


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

execute if score old_stone_age task matches 19 run scoreboard objectives add cod_fish minecraft.killed:minecraft.cod "捕获鳕鱼"
execute if score old_stone_age task matches 20 run scoreboard objectives add salmon_fish minecraft.killed:minecraft.salmon "捕获鲑鱼"
execute if score old_stone_age task matches 21 run scoreboard objectives add tropical_fish minecraft.killed:minecraft.tropical_fish "捕获热带鱼"
execute if score old_stone_age task matches 22 run scoreboard objectives add squid_fish minecraft.killed:minecraft.squid "捕获鱿鱼"
execute if score old_stone_age task matches 23 run scoreboard objectives add glow_squid_fish minecraft.killed:minecraft.glow_squid "捕获发光鱿鱼"
execute if score old_stone_age task matches 24 run scoreboard objectives add puffer_fish minecraft.killed:minecraft.pufferfish "捕获河豚"

execute if score old_stone_age task matches 25 run scoreboard objectives add veg_eat minecraft.used:minecraft.carrot "食用蔬菜"
execute if score old_stone_age task matches 26 run scoreboard objectives add seed_eat minecraft.used:minecraft.wheat_seeds "食用种子"
execute if score old_stone_age task matches 27 run scoreboard objectives add berry_eat minecraft.used:minecraft.sweet_berries "食用浆果"
execute if score old_stone_age task matches 28 run scoreboard objectives add apple_eat minecraft.used:minecraft.apple "食用苹果"
execute if score old_stone_age task matches 29 run scoreboard objectives add melon_eat minecraft.used:minecraft.melon_slice "食用西瓜片"
execute if score old_stone_age task matches 30 run scoreboard objectives add pumpkin_eat minecraft.used:minecraft.pumpkin_pie "食用南瓜派"
execute if score old_stone_age task matches 31 run scoreboard objectives add pork_eat minecraft.used:minecraft.porkchop "食用生猪肉"
execute if score old_stone_age task matches 32 run scoreboard objectives add mutton_eat minecraft.used:minecraft.mutton "食用生羊肉"
execute if score old_stone_age task matches 33 run scoreboard objectives add beef_eat minecraft.used:minecraft.beef "食用生牛肉"
execute if score old_stone_age task matches 34 run scoreboard objectives add rabbit_eat minecraft.used:minecraft.rabbit "食用生兔肉"
execute if score old_stone_age task matches 35 run scoreboard objectives add chicken_eat minecraft.used:minecraft.chicken "食用生鸡肉"
execute if score old_stone_age task matches 36 run scoreboard objectives add cod_eat minecraft.used:minecraft.cod "食用生鳕鱼"
execute if score old_stone_age task matches 37 run scoreboard objectives add salmon_eat minecraft.used:minecraft.salmon "食用生鲑鱼"
execute if score old_stone_age task matches 38 run scoreboard objectives add tropical_eat minecraft.used:minecraft.tropical_fish "食用热带鱼"
execute if score old_stone_age task matches 39 run scoreboard objectives add puffer_eat minecraft.used:minecraft.pufferfish "食用河豚"
execute if score old_stone_age task matches 40 run scoreboard objectives add rotten_eat minecraft.used:minecraft.rotten_flesh "食用腐肉"
execute if score old_stone_age task matches 41 run scoreboard objectives add spider_eye_eat minecraft.used:minecraft.spider_eye "食用蜘蛛眼"



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

execute if score old_stone_age task matches 19 run scoreboard objectives add cod_updata dummy
execute if score old_stone_age task matches 20 run scoreboard objectives add salmon_updata dummy
execute if score old_stone_age task matches 21 run scoreboard objectives add tropical_updata dummy
execute if score old_stone_age task matches 22 run scoreboard objectives add squid_updata dummy
execute if score old_stone_age task matches 23 run scoreboard objectives add glow_squid_updata dummy
execute if score old_stone_age task matches 24 run scoreboard objectives add puffer_updata dummy

execute if score old_stone_age task matches 25 run scoreboard objectives add veg_updata dummy
execute if score old_stone_age task matches 26 run scoreboard objectives add seed_updata dummy
execute if score old_stone_age task matches 27 run scoreboard objectives add berry_updata dummy
execute if score old_stone_age task matches 28 run scoreboard objectives add apple_updata dummy
execute if score old_stone_age task matches 29 run scoreboard objectives add melon_updata dummy
execute if score old_stone_age task matches 30 run scoreboard objectives add pumpkin_updata dummy
execute if score old_stone_age task matches 31 run scoreboard objectives add pork_updata dummy
execute if score old_stone_age task matches 32 run scoreboard objectives add mutton_updata dummy
execute if score old_stone_age task matches 33 run scoreboard objectives add beef_updata dummy
execute if score old_stone_age task matches 34 run scoreboard objectives add rabbit_updata dummy
execute if score old_stone_age task matches 35 run scoreboard objectives add chicken_updata dummy
execute if score old_stone_age task matches 36 run scoreboard objectives add cod_updata dummy
execute if score old_stone_age task matches 37 run scoreboard objectives add salmon_updata dummy
execute if score old_stone_age task matches 38 run scoreboard objectives add tropical_updata dummy
execute if score old_stone_age task matches 39 run scoreboard objectives add puffer_updata dummy
execute if score old_stone_age task matches 40 run scoreboard objectives add rotten_updata dummy
execute if score old_stone_age task matches 41 run scoreboard objectives add spider_eye_updata dummy



# 更新 Bossbar 显示
function age:task/show
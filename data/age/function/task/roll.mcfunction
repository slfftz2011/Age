# 重置计时器
scoreboard players set time task 0
tag @a remove task_done

execute if score old_stone_age task matches 1 run scoreboard objectives remove pig_hunt
execute if score old_stone_age task matches 2 run scoreboard objectives remove sheep_hunt
execute if score old_stone_age task matches 3 run scoreboard objectives remove cow_hunt
execute if score old_stone_age task matches 4 run scoreboard objectives remove rabbit_hunt
execute if score old_stone_age task matches 5 run scoreboard objectives remove horse_hunt
execute if score old_stone_age task matches 6 run scoreboard objectives remove chicken_hunt

execute if score old_stone_age task matches 1 run scoreboard objectives remove pig_updata
execute if score old_stone_age task matches 2 run scoreboard objectives remove sheep_updata
execute if score old_stone_age task matches 3 run scoreboard objectives remove cow_updata
execute if score old_stone_age task matches 4 run scoreboard objectives remove rabbit_updata
execute if score old_stone_age task matches 5 run scoreboard objectives remove horse_updata
execute if score old_stone_age task matches 6 run scoreboard objectives remove chicken_updata


execute store result score old_stone_age task run random value 0..6

execute if score old_stone_age task matches 1 run scoreboard objectives add pig_hunt minecraft.killed:minecraft.pig "狩猎猪"
execute if score old_stone_age task matches 2 run scoreboard objectives add sheep_hunt minecraft.killed:minecraft.sheep "狩猎羊"
execute if score old_stone_age task matches 3 run scoreboard objectives add cow_hunt minecraft.killed:minecraft.cow "狩猎牛"
execute if score old_stone_age task matches 4 run scoreboard objectives add rabbit_hunt minecraft.killed:minecraft.rabbit "狩猎兔"
execute if score old_stone_age task matches 5 run scoreboard objectives add horse_hunt minecraft.killed:minecraft.horse "狩猎马"
execute if score old_stone_age task matches 6 run scoreboard objectives add chicken_hunt minecraft.killed:minecraft.chicken "狩猎鸡"

execute if score old_stone_age task matches 1 run scoreboard objectives add pig_updata dummy
execute if score old_stone_age task matches 2 run scoreboard objectives add sheep_updata dummy
execute if score old_stone_age task matches 3 run scoreboard objectives add cow_updata dummy
execute if score old_stone_age task matches 4 run scoreboard objectives add rabbit_updata dummy
execute if score old_stone_age task matches 5 run scoreboard objectives add horse_updata dummy
execute if score old_stone_age task matches 6 run scoreboard objectives add chicken_updata dummy

execute if score old_stone_age task matches 1 run scoreboard players set @a[team=old_stone_age] pig_hunt 0
execute if score old_stone_age task matches 2 run scoreboard players set @a[team=old_stone_age] sheep_hunt 0
execute if score old_stone_age task matches 3 run scoreboard players set @a[team=old_stone_age] cow_hunt 0
execute if score old_stone_age task matches 4 run scoreboard players set @a[team=old_stone_age] rabbit_hunt 0
execute if score old_stone_age task matches 5 run scoreboard players set @a[team=old_stone_age] horse_hunt 0
execute if score old_stone_age task matches 6 run scoreboard players set @a[team=old_stone_age] chicken_hunt 0



function age:task/check

# 更新 Bossbar 显示
function age:task/show
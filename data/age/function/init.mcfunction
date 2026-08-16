#-------------------------
# 数据包初始化   
# age:init      
#-------------------------


# 游戏规则初始化
gamerule commandBlockOutput false
gamerule doLimitedCrafting true
gamerule doImmediateRespawn false


# 队伍初始化
team add old_stone_age {text:"旧石器时代",color:"#424529"}
team add mid_stone_age {text:"中石器时代",color:"#514639"}
team add new_stone_age {text:"新石器时代",color:"#646464"}
team add copper_age {text:"红铜时代",color:"#877056"}
team add bronze_age {text:"青铜时代",color:"#789163"}
team add pre_iron_age {text:"早期铁器时代",color:"#e1d0b2"}
team add mid_iron_age {text:"中期铁器时代",color:"#ffefdd"}
team add late_iron_age {text:"晚期铁器时代",color:"#6e727f"}
team add steam_age {text:"蒸汽时代-I",color:"#ecc9a3",bold:true}
team add steam_age_2 {text:"蒸汽时代-II",color:"#a9a7c6",bold:true}
team add steam_age_3 {text:"蒸汽时代-III",color:"#b0e9c3",bold:true}
team add steam_age_4 {text:"蒸汽时代-IV",color:"#eeee93",bold:true}
team add steam_age_5 {text:"蒸汽时代-V",color:"#8988ff",bold:true}
team add modern_age [{text:"✈",color:"#ffd0d0",bold:true},{text:"摩",color:"#f3c8da"},{text:"登",color:"#e6c0e6"},{text:"时",color:"#dac8f3"},{text:"代",color:"#d0d0ff"}]

team modify old_stone_age prefix {text:" ▏ 旧石器时代 ▏ ",color:"#424529"}
team modify mid_stone_age prefix {text:" ▏ 中石器时代 ▏ ",color:"#514639"}
team modify new_stone_age prefix {text:" ▏ 新石器时代 ▏ ",color:"#646464"}
team modify copper_age prefix {text:" ▏ 红铜时代 ▏ ",color:"#877056"}
team modify bronze_age prefix {text:" ▏ 青铜时代 ▏ ",color:"#789163"}
team modify pre_iron_age prefix {text:" ▏ 早期铁器时代 ▏ ",color:"#e1d0b2"}
team modify mid_iron_age prefix {text:" ▏ 中期铁器时代 ▏ ",color:"#ffefdd"}
team modify late_iron_age prefix {text:" ▏ 晚期铁器时代 ▏ ",color:"#6e727f"}
team modify steam_age prefix {text:" [蒸汽时代-I] ",color:"#ecc9a3",bold:true}
team modify steam_age_2 prefix {text:" [蒸汽时代-II] ",color:"#a9a7c6",bold:true}
team modify steam_age_3 prefix {text:" [蒸汽时代-III] ",color:"#b0e9c3",bold:true}
team modify steam_age_4 prefix {text:" [蒸汽时代-IV] ",color:"#eeee93",bold:true}
team modify steam_age_5 prefix {text:" [蒸汽时代-V] ",color:"#8988ff",bold:true}
team modify modern_age prefix [{text:" ░✈",color:"#ffd0d0",bold:true},{text:"摩",color:"#f3c8da"},{text:"登",color:"#e6c0e6"},{text:"时",color:"#dac8f3"},{text:"代░ ",color:"#d0d0ff"}]


# Bossbar 初始化
bossbar add old_stone_age ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - 无"]
bossbar add mid_stone_age ["当前时代 - ", {text:"中石器时代",color:"#514639"}, "   当前任务 - 无"]
bossbar add new_stone_age ["当前时代 - ", {text:"新石器时代",color:"#646464"}, "   当前任务 - 无"]
bossbar add copper_age ["当前时代 - ", {text:"红铜时代",color:"#877056"}, "   当前任务 - 无"]
bossbar add bronze_age ["当前时代 - ", {text:"青铜时代",color:"#789163"}, "   当前任务 - 无"]
bossbar add pre_iron_age ["当前时代 - ", {text:"早期铁器时代",color:"#e1d0b2"}, "   当前任务 - 无"]
bossbar add mid_iron_age ["当前时代 - ", {text:"中期铁器时代",color:"#ffefdd"}, "   当前任务 - 无"]
bossbar add late_iron_age ["当前时代 - ", {text:"晚期铁器时代",color:"#6e727f"}, "   当前任务 - 无"]
bossbar add steam_age ["当前时代 - ", {text:"蒸汽时代-I",color:"#ecc9a3",bold:true}, "   当前任务 - 无"]
bossbar add steam_age_2 ["当前时代 - ", {text:"蒸汽时代-II",color:"#a9a7c6",bold:true}, "   当前任务 - 无"]
bossbar add steam_age_3 ["当前时代 - ", {text:"蒸汽时代-III",color:"#b0e9c3",bold:true}, "   当前任务 - 无"]
bossbar add steam_age_4 ["当前时代 - ", {text:"蒸汽时代-IV",color:"#eeee93",bold:true}, "   当前任务 - 无"]
bossbar add steam_age_5 ["当前时代 - ", {text:"蒸汽时代-V",color:"#8988ff",bold:true}, "   当前任务 - 无"]
bossbar add modern_age ["当前时代 - ", [{text:"✈",color:"#ffd0d0",bold:true},{text:"摩",color:"#f3c8da"},{text:"登",color:"#e6c0e6"},{text:"时",color:"#dac8f3"},{text:"代",color:"#d0d0ff"}], "   你已站在时代顶峰！"]

bossbar set old_stone_age color green
bossbar set mid_stone_age color green
bossbar set new_stone_age color green
bossbar set copper_age color green
bossbar set bronze_age color green
bossbar set pre_iron_age color green
bossbar set mid_iron_age color green
bossbar set late_iron_age color green
bossbar set steam_age color green
bossbar set steam_age_2 color green
bossbar set steam_age_3 color green
bossbar set steam_age_4 color green
bossbar set steam_age_5 color green
bossbar set modern_age color blue

bossbar set old_stone_age max 2900
bossbar set mid_stone_age max 600
# x10
bossbar set new_stone_age max 1000
bossbar set copper_age max 250
# x40
bossbar set bronze_age max 1600
bossbar set pre_iron_age max 560
bossbar set mid_iron_age max 800
# x80
bossbar set late_iron_age max 7200
# x10
bossbar set steam_age max 400
# x20
bossbar set steam_age_2 max 280
# x40
bossbar set steam_age_3 max 800
# x80
bossbar set steam_age_4 max 1280
# x32
bossbar set steam_age_5 max 5120

bossbar set modern_age max 1
bossbar set modern_age value 1


# 记分板初始化
scoreboard objectives add time dummy "计时器"

scoreboard objectives add task dummy "随机任务"

scoreboard objectives add task_old_stone_1_progress dummy "旧石器任务-1"
scoreboard objectives add task_old_stone_2a_amount dummy "旧石器任务-2a"
scoreboard objectives add task_old_stone_4a_progress minecraft.killed:minecraft.skeleton "旧石器任务-4a"
scoreboard objectives add task_old_stone_4a_updata dummy "旧石器任务-4a"
scoreboard objectives add task_old_stone_a_done dummy "旧石器任务-a"
scoreboard objectives add task_old_stone_b_done dummy "旧石器任务-b"

scoreboard objectives add forwards dummy "前进权数"
scoreboard players set old_stone_s forwards 20 


scoreboard objectives add age dummy {text:"时代榜",color:"aqua",bold:true}
scoreboard objectives modify age numberformat fixed ""
scoreboard players set ____________________ age 2147483647
scoreboard players set 时代的齿轮在转动... age 2147483646
scoreboard players set 完成任务以加速进步 age 2147483645
scoreboard players set （同时代共享） age 2147483644
scoreboard players set -------------------- age 2147483643
scoreboard objectives setdisplay sidebar age

scoreboard objectives add stage dummy "时代进度"

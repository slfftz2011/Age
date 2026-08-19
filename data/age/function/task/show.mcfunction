# ===== 任务分配后更新 Bossbar 初始名称 =====
# 围剿任务显示 0/目标，后续由跟踪函数动态更新

# ----- 无任务 -----
execute if score old_stone_age task matches 0 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"无",color:"gray"}]

# ----- 狩猎任务（个人） -----
execute if score old_stone_age task matches 1 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 猪 x5",color:"gold"}]
execute if score old_stone_age task matches 2 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 羊 x5",color:"gold"}]
execute if score old_stone_age task matches 3 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 牛 x5",color:"gold"}]
execute if score old_stone_age task matches 4 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 兔 x3",color:"gold"}]
execute if score old_stone_age task matches 5 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 马 x3",color:"gold"}]
execute if score old_stone_age task matches 6 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[狩猎] 击杀 鸡 x5",color:"gold"}]

# ----- 围剿任务（队伍共享，初始显示 0/目标） -----
execute if score old_stone_age task matches 7 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 僵尸 0/5",color:"red"}]
execute if score old_stone_age task matches 8 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 溺尸 0/5",color:"red"}]
execute if score old_stone_age task matches 9 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 尸壳 0/5",color:"red"}]
execute if score old_stone_age task matches 10 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 骷髅 0/5",color:"red"}]
execute if score old_stone_age task matches 11 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 流浪者 0/5",color:"red"}]
execute if score old_stone_age task matches 12 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 沼骸 0/3",color:"red"}]
execute if score old_stone_age task matches 13 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 僵尸村民 0/3",color:"red"}]
execute if score old_stone_age task matches 14 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 幻翼 0/2",color:"red"}]
execute if score old_stone_age task matches 15 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 苦力怕 0/5",color:"red"}]
execute if score old_stone_age task matches 16 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 蜘蛛 0/5",color:"red"}]
execute if score old_stone_age task matches 17 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 洞穴蜘蛛 0/3",color:"red"}]
execute if score old_stone_age task matches 18 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 末影人 0/1",color:"red"}]

# ----- 捕获任务（个人） -----
execute if score old_stone_age task matches 19 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 鳕鱼 x5",color:"#55AAFF"}]
execute if score old_stone_age task matches 20 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 鲑鱼 x5",color:"#55AAFF"}]
execute if score old_stone_age task matches 21 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 热带鱼 x3",color:"#55AAFF"}]
execute if score old_stone_age task matches 22 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 鱿鱼 x3",color:"#55AAFF"}]
execute if score old_stone_age task matches 23 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 发光鱿鱼 x3",color:"#55AAFF"}]
execute if score old_stone_age task matches 24 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[捕获] 击杀 河豚 x2",color:"#55AAFF"}]

# ----- 食用任务（个人） -----
execute if score old_stone_age task matches 25 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 蔬菜 x8",color:"#55FF55"}]
execute if score old_stone_age task matches 26 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 种子 x8",color:"#55FF55"}]
execute if score old_stone_age task matches 27 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 浆果 x8",color:"#55FF55"}]
execute if score old_stone_age task matches 28 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 苹果 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 29 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 西瓜片 x8",color:"#55FF55"}]
execute if score old_stone_age task matches 30 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 南瓜 x5",color:"#55FF55"}]
execute if score old_stone_age task matches 31 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生猪肉 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 32 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生羊肉 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 33 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生牛肉 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 34 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生兔肉 x3",color:"#55FF55"}]
execute if score old_stone_age task matches 35 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生鸡肉 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 36 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生鳕鱼 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 37 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 生鲑鱼 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 38 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 热带鱼 x3",color:"#55FF55"}]
execute if score old_stone_age task matches 39 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 河豚 x1",color:"#55FF55"}]
execute if score old_stone_age task matches 40 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 腐肉 x4",color:"#55FF55"}]
execute if score old_stone_age task matches 41 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[食用] 蜘蛛眼 x1",color:"#55FF55"}]

# ----- 制作任务（个人） -----
execute if score old_stone_age task matches 42 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 木棍 x8",color:"#FFAA55"}]
execute if score old_stone_age task matches 43 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 西瓜 x4",color:"#FFAA55"}]
execute if score old_stone_age task matches 44 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 黏土 x4",color:"#FFAA55"}]
execute if score old_stone_age task matches 45 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 皮革 x3",color:"#FFAA55"}]
execute if score old_stone_age task matches 46 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 砂岩 x16",color:"#FFAA55"}]
execute if score old_stone_age task matches 47 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[制作] 红砂岩 x16",color:"#FFAA55"}]

# ----- 采掘任务（个人） -----
execute if score old_stone_age task matches 48 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 泥土 x32",color:"#AA55FF"}]
execute if score old_stone_age task matches 49 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 草方块 x16",color:"#AA55FF"}]
execute if score old_stone_age task matches 50 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 树叶 x32",color:"#AA55FF"}]
execute if score old_stone_age task matches 51 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 原木 x8",color:"#AA55FF"}]
execute if score old_stone_age task matches 52 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 黏土 x8",color:"#AA55FF"}]
execute if score old_stone_age task matches 53 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 沙子 x16",color:"#AA55FF"}]
execute if score old_stone_age task matches 54 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 红沙 x16",color:"#AA55FF"}]
execute if score old_stone_age task matches 55 run bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[采掘] 蜘蛛网 x4",color:"#AA55FF"}]
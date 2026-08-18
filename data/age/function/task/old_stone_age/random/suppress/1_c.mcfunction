# ===== 围剿完成：僵尸 x5（队伍共享）=====

# 播放升级音效（全队）
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5

# 增加时代进度 100（队伍共享）
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 100

# 给予经验奖励（全队每人 5 级，可根据需要调整）
xp add @a[team=old_stone_age] 5

# 全服公告
tellraw @a ["",{text:"恭喜队伍 ",color:"#aaddaa"},{text:"旧石器时代",color:"gold"},{text:" 完成了围剿委托 ",color:"#aaddaa"},{text:"僵尸 x5",color:"red"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +100! ",color:"#aaddaa"}

# 标记所有队员已完成
tag @a[team=old_stone_age] add task_done
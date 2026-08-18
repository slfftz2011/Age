# ===== 围剿：僵尸 x5（队伍共享）=====

# 仅在未完成时清零汇总板（如果已经达到5，不清零）
execute unless score old_stone_age zombie_all matches 5.. run scoreboard players set old_stone_age zombie_all 0

# 仅在未完成时累加个人击杀到队伍汇总板
execute unless score old_stone_age zombie_all matches 5.. as @a[team=old_stone_age] run scoreboard players operation old_stone_age zombie_all += @s zombie_suppress

# 更新 Bossbar 名称（无论是否完成都更新，但若已完成则显示5/5，由完成函数后续覆盖）
bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 僵尸 ",color:"red"}, {score:{name:"old_stone_age",objective:"zombie_all"}}, {text:"/5",color:"gray"}]

# 仅在未完成时检测是否达到目标，若达到则调用完成函数
execute unless score old_stone_age zombie_all matches 5.. if score old_stone_age zombie_all matches 5.. run function age:task/old_stone_age/random/suppress/1_c
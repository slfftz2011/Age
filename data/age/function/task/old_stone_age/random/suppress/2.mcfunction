# ===== 围剿：溺尸 x5（队伍共享）=====

# 仅在未完成时清零汇总板
execute unless score old_stone_age drowned_all matches 5.. run scoreboard players set old_stone_age drowned_all 0

# 仅在未完成时累加个人击杀到队伍汇总板
execute unless score old_stone_age drowned_all matches 5.. as @a[team=old_stone_age] run scoreboard players operation old_stone_age drowned_all += @s drowned_suppress

# 更新 Bossbar 名称（始终显示当前进度）
bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 溺尸 ",color:"red"}, {score:{name:"old_stone_age",objective:"drowned_all"}}, {text:"/5",color:"gray"}]

# 仅在未完成时检测是否达到目标，若达到则调用完成函数
execute unless entity @a[team=old_stone_age,tag=task_done] if score old_stone_age drowned_all matches 5.. run function age:task/old_stone_age/random/suppress/2_c
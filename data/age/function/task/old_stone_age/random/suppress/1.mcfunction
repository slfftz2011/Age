# ===== 围剿：僵尸 x5（队伍共享，每 tick 重新汇总）=====

# 1. 清零队伍汇总板（避免重复累加）
scoreboard players set old_stone_age zombie_all 0

# 2. 将所有队员的个人击杀累加到队伍汇总板
execute as @a[team=old_stone_age] run scoreboard players operation old_stone_age zombie_all += @s zombie_suppress

# 3. 更新 Bossbar 名称（显示实时进度）
bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 僵尸 ",color:"red"}, {score:{name:"old_stone_age",objective:"zombie_all"}}, {text:"/5",color:"gray"}]

# 4. 检测是否完成（队伍汇总达到目标）
execute if score old_stone_age zombie_all matches 5.. run function age:task/old_stone_age/random/suppress/1_c
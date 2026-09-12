# ===== 围剿：末影人 x1（队伍共享）=====

# 仅在未完成时清零汇总板
execute unless score old_stone_age enderman_all matches 1.. run scoreboard players set old_stone_age enderman_all 0

# 仅在未完成时累加个人击杀到队伍汇总板
execute unless score old_stone_age enderman_all matches 1.. as @a[team=old_stone_age] run scoreboard players operation old_stone_age enderman_all += @s enderman_suppress

# 更新 Bossbar 名称
bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 末影人 ",color:"red"}, {score:{name:"old_stone_age",objective:"enderman_all"}}, {text:"/1",color:"gray"}]

# 仅在未完成时检测是否达到目标
execute unless entity @a[team=old_stone_age,tag=task_done] if score old_stone_age enderman_all matches 1.. run function age:task/old_stone_age/random/suppress/18_c
# ===== 围剿：洞穴蜘蛛 x3（队伍共享）=====

# 仅在未完成时清零汇总板
execute unless score old_stone_age cave_spider_all matches 3.. run scoreboard players set old_stone_age cave_spider_all 0

# 仅在未完成时累加个人击杀到队伍汇总板
execute unless score old_stone_age cave_spider_all matches 3.. as @a[team=old_stone_age] run scoreboard players operation old_stone_age cave_spider_all += @s cave_spider_suppress

# 更新 Bossbar 名称
bossbar set old_stone_age name ["当前时代 - ", {text:"旧石器时代",color:"#424529"}, "   当前任务 - ", {text:"[围剿] 共同击杀 洞穴蜘蛛 ",color:"red"}, {score:{name:"old_stone_age",objective:"cave_spider_all"}}, {text:"/3",color:"gray"}]

# 仅在未完成时检测是否达到目标
execute unless entity @a[team=old_stone_age,tag=task_done] if score old_stone_age cave_spider_all matches 3.. run function age:task/old_stone_age/random/suppress/17_c
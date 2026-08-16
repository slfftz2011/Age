# 将玩家加入任务检测列表
tag @s add task_old_stone_1_tracking

# 初始化进度记分板
scoreboard players set @s task_old_stone_1_progress 0

# 提示玩家
tellraw @s [{text:"📋 任务已发布：",color:"#aaddaa"},{text:"石语者",color:"green"},{text:" 按 [L] 查看详情"}]
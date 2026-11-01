tellraw @s {text:"========== 游戏规则 [1/4] ==========",color:"gold"}
tellraw @s {text:"欢迎来到新世代！",color:"white"}
tellraw @s {text:"",color:"white"}

tellraw @s [{"text":"[核心玩法] ","color":"gold","bold":true},{"text":"从旧石器时代出发，历经 14 个历史时代，每个时代解锁新配方、新物品与新机制。","color":"white"}]

tellraw @s [{"text":"[时代晋升] ","color":"gold","bold":true},{"text":"每个时代有独立队伍、Boss 栏与晋升阈值；全服共享时代进度，共同推动文明前进。","color":"white"}]

tellraw @s [{"text":"[时代榜] ","color":"gold","bold":true},{"text":"侧边栏实时显示当前时代与进度，完成主线或委托可加速进步。","color":"white"}]

tellraw @s {text:"",color:"white"}
tellraw @s ["", "[", {text:"这是第一页啦",color:"gold"}, "]","  |  [",{text:"下一页",color:"gold",click_event:{action:"run_command",command:"/trigger age_gamerule_page set 2"}},"]"]
tellraw @s {text:"========== 游戏规则 [3/4] ==========",color:"gold"}
tellraw @s {text:"口渴值与任务",color:"gold","bold":true}
tellraw @s {text:"",color:"white"}

tellraw @s [{"text":"[口渴值系统] ","color":"gold","bold":true},{"text":"共 6 类水源 / 补水食物：脏水、清水、净化水、补水食物、多汁食物、提神食物，补水效率与风险各不相同。","color":"white"}]

tellraw @s [{"text":"[脱水负面效果] ","color":"gold","bold":true},{"text":"依次为 干旱 → 脱水 → 干燥 → 饥渴；脱水会显著放大中暑效果。","color":"white"}]

tellraw @s [{"text":"[五类随机委托] ","color":"gold","bold":true},{"text":"狩猎、捕获、食用、制作、采掘。","color":"white"}]

tellraw @s [{"text":"[主线任务] ","color":"gold","bold":true},{"text":"每个时代包含多个阶段，流程为 追踪 → 解锁 → 完成；完成主线可大幅推进时代。","color":"white"}]

tellraw @s [{"text":"[分支任务] ","color":"gold","bold":true},{"text":"每个时代有独立分支线，通过进度树展示，完成后获得额外奖励。","color":"white"}]

tellraw @s {text:"",color:"white"}
tellraw @s ["", "[", {text:"上一页",color:"gold",click_event:{action:"run_command",command:"/function age:gamerule/2"}}, "]","  |  [",{text:"下一页",color:"gold",click_event:{action:"run_command",command:"/function age:gamerule/4"}},"]"]
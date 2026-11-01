tellraw @s {text:"========== 游戏规则 [2/4] ==========",color:"gold"}
tellraw @s {text:"体感温度系统",color:"gold","bold":true}
tellraw @s {text:"",color:"white"}

tellraw @s [{"text":"[环境温度] ","color":"gold","bold":true},{"text":"基于 9 类生物群系标签（极寒 / 寒冷 / 温和 / 温暖 / 炎热 / 下界 / 末地 / 潮湿 / 极湿）计算基础温度。","color":"white"}]

tellraw @s [{"text":"[天气修正] ","color":"gold","bold":true},{"text":"晴天 / 下雨 / 雷暴会改变体感温度，并带有天气持续计时。","color":"white"}]

tellraw @s [{"text":"[装备修正] ","color":"gold","bold":true},{"text":"金属护甲（头盔 / 胸甲 / 护腿 / 靴子）会明显影响体温。","color":"white"}]

tellraw @s [{"text":"[热源 / 冷源] ","color":"gold","bold":true},{"text":"自动检测周围 3×3×3 范围内的热源 / 冷源方块，距离越近影响越大。","color":"white"}]

tellraw @s [{"text":"[温度负面效果] ","color":"gold","bold":true},{"text":"中暑 / 灼烧（高温），寒战 / 冰冻（低温），需及时调节体温。","color":"white"}]

tellraw @s {text:"",color:"white"}
tellraw @s ["", "[", {text:"上一页",color:"gold",click_event:{action:"run_command",command:"/function age:gamerule/1"}}, "]","  |  [",{text:"下一页",color:"gold",click_event:{action:"run_command",command:"/function age:gamerule/3"}},"]"]
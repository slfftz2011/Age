tag @a[team=] add new
tellraw @a[tag=new] ["欢迎来到 ",{text:"文",color:"yellow",bold:true},{text:"明",color:"gold",bold:true},{text:"游",color:"yellow",bold:true},{text:"戏",color:"gold",bold:true}," !"]
tellraw @a[tag=new] ["人类起初是",{text:"脆弱",color:"dark_red"},"的，只有不断的发展自己才能依靠",{text:"科技",color:"aqua"},"抵御威胁."]
tellraw @a[tag=new] ["你将与同时代人类",{text:"协作",color:"green"},"或",{text:"对抗",color:"red"},"，完成",{text:"时代任务 ",color:"aqua"},{text:"晋升时代！",bold:true}]
tellraw @a[tag=new] [" "," ",{text:" 迎接新世代！",color:"#781931"},{text:"—— Age @VERSION@  作者:  ",color:"gray",italic:true},{type:"object",object:"player",player:"slfftz520"},{text:" 小小俞5203",color:"aqua",italic:true}]
tellraw @a[tag=new] [" "," [",{text:"游戏规则",color:"gold",click_event:{action:"run_command",command:"/function age:gamerule"}},"]  [",{text:"更新日志",color:"aqua",click_event:{action:"run_command",command:"/function age:change_log"}},"]  [",{text:"关于作者",color:"green",click_event:{action:"open_url",url:"https://github.com/slfftz2011"}},"]"]
tellraw @a[tag=new] ""

team join old_stone_age @a[tag=new]
tellraw @a[tag=new] ["当前时代: ",{text:"旧石器时代",color:"#424529"}," ，你受到以下加成/限制: "]
tellraw @a[tag=new] ["1. ",{text:"低寿：",color:"dark_red",bold:true},{text:"原始人的生命极其脆弱",color:"red",hover_event:{action:"show_text",value:{text:"血量上限 -14",color:"red"}}}]
tellraw @a[tag=new] ["2. ",{text:"智力低下：",color:"dark_red",bold:true},{text:"你将无法使用容器/部分功能方块 你将弄坏一切红石装置",color:"red"}]
tellraw @a[tag=new] ["3. ",{text:"茹毛饮血：",color:"dark_red",bold:true},{text:"你将只能食用果蔬/生肉",color:"red"}]
tellraw @a[tag=new] ["4. ",{text:"长臂：",color:"dark_blue",bold:true},{text:"树上生活的基因令你可以触及更远",color:"blue",hover_event:{action:"show_text",value:{text:"方块交互距离 +1\n实体交互距离 +1",color:"blue"}}}]
tellraw @a[tag=new] ["5. ",{text:"恐火：",color:"dark_red",bold:true},{text:"原始的本能令你惧怕火焰",color:"red",hover_event:{action:"show_text",value:{text:"着火时间 +100%",color:"red"}}}]
tellraw @a[tag=new] ["6. ",{text:"易碎：",color:"dark_red",bold:true},{text:"一旦失足便是坠入深渊",color:"red",hover_event:{action:"show_text",value:{text:"摔落伤害 +100%\n安全摔落距离 -1",color:"red"}}}]
tellraw @a[tag=new] ["7. ",{text:"恐水：",color:"dark_red",bold:true},{text:"原始的本能令你惧怕游泳",color:"red",hover_event:{action:"show_text",value:{text:"水下挖掘速度 -50%",color:"red"}}}]
tellraw @a[tag=new] ["8. ",{text:"大只：",color:"dark_red",bold:true},{text:"“强壮”的身躯并不总是好用",color:"red",hover_event:{action:"show_text",value:{text:"体型 +20%",color:"red"}}}]
tellraw @a[tag=new] ["9. ",{text:"厄运：",color:"dark_red",bold:true},{text:"你是厄运的化身，不被接纳",color:"red",hover_event:{action:"show_text",value:{text:"不祥之兆 X\n霉运 X\n清除村庄英雄",color:"red"}}}]
tellraw @a[tag=new] ["10. ",{text:"饥饿：",color:"dark_red",bold:true},{text:"风餐露宿，难以饱腹",color:"red",hover_event:{action:"show_text",value:{text:"饥饿 II",color:"red"}}}]
tellraw @a[tag=new] ["11. ",{text:"效率低下：",color:"dark_red",bold:true},{text:"纵有工具，难发其效",color:"red",hover_event:{action:"show_text",value:{text:"挖掘疲劳 II",color:"red"}}}]
tellraw @a[tag=new] ["12. ",{text:"行动不便：",color:"dark_red",bold:true},{text:"刚从树上下来的你腿部并不发达",color:"red",hover_event:{action:"show_text",value:{text:"缓慢 II",color:"red"}}}]
tellraw @a[tag=new] ["13. ",{text:"羸弱：",color:"dark_red",bold:true},{text:"空有身躯，难以与怪物抗衡",color:"red",hover_event:{action:"show_text",value:{text:"虚弱 I",color:"red"}}}]
tellraw @a[tag=new] ["14. ",{text:"不堪负重：",color:"dark_red",bold:true},{text:"难以携带过多行囊",color:"red",hover_event:{action:"show_text",value:{text:"禁用27个槽位",color:"red"}}}]
tellraw @a[tag=new] [" - 当前解锁特殊配方: ",{text:"8/8",color:"dark_green",bold:true},]
tellraw @a[tag=new] [" - 当前锁定配方: ",{text:"1446/1461",color:"dark_green",bold:true},]
tellraw @a[tag=new] [" - 当前发现物品: ",{text:"225/1449",color:"dark_green",bold:true},]

# 属性给予
execute as @a[tag=new] run attribute @s minecraft:max_health base set 6.0
execute as @a[tag=new] run attribute @s minecraft:block_interaction_range base set 5.5
execute as @a[tag=new] run attribute @s minecraft:entity_interaction_range base set 5.5
execute as @a[tag=new] run attribute @s minecraft:burning_time base set 2.0
execute as @a[tag=new] run attribute @s minecraft:fall_damage_multiplier base set 2.0
execute as @a[tag=new] run attribute @s minecraft:submerged_mining_speed base set 0.1
execute as @a[tag=new] run attribute @s minecraft:scale base set 1.2

# 配方给予
recipe give @a[tag=new] age:crafting/string_from_wheat_seeds
recipe give @a[tag=new] age:crafting/string_from_leather
recipe give @a[tag=new] age:crafting/chipped_stone_tool
recipe give @a[tag=new] age:crafting/grass_skirt
recipe give @a[tag=new] age:crafting/slingshot
recipe give @a[tag=new] age:crafting/wild_vegetables
recipe give @a[tag=new] age:crafting/belt

recipe give @a[tag=new] minecraft:crafting_table

# 进度给予
advancement grant @a[tag=new] only age:old_stone_age/branch_root
advancement grant @a[tag=new] only age:old_stone_age/root
advancement grant @a[tag=new] only age:old_stone_age/phase_1_unlocker

execute as @a[tag=new] run function age:state/init_player

tag @a[tag=new] remove new
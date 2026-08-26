playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5
execute if entity @a[team=old_stone_age] run scoreboard players add old_stone_age stage 150
xp add @a[team=old_stone_age] 75
tellraw @a ["",{text:"恭喜队伍 ",color:"#aaddaa"},{text:"旧石器时代",color:"gold"},{text:" 完成了委托 ",color:"#aaddaa"},{text:"围剿: 蜘蛛 x5",color:"red"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +150! ",color:"#aaddaa"}
tag @a[team=old_stone_age] add task_done
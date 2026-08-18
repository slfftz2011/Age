playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 130
xp add @a[team=old_stone_age] 65
tellraw @a ["",{text:"恭喜队伍 ",color:"#aaddaa"},{text:"旧石器时代",color:"gold"},{text:" 完成了围剿委托 ",color:"#aaddaa"},{text:"尸壳 x5",color:"red"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +130! ",color:"#aaddaa"}
tag @a[team=old_stone_age] add task_done
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 16
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了委托 ",color:"#aaddaa"},{text:"食用: 生猪肉 x4",color:"#55FF55"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +16! ",color:"#aaddaa"}
tag @s add task_done
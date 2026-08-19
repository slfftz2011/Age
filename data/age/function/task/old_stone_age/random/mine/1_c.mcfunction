# ===== 采掘完成：泥土 x32 =====
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 32
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了委托 ",color:"#aaddaa"},{text:"采掘: 泥土 x32",color:"#AA55FF"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +32! ",color:"#aaddaa"}
tag @s add task_done
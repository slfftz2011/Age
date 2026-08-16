playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run team join mid_stone_age @s
effect clear @s
xp add @s 100
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了隐藏任务 ",color:"#aaddaa"},{text:"飞升",color:"dark_purple"},{text:" !",color:"#aaddaa"}]
tellraw @a ["",{text:"TA先人一步 晋升至 ",color:"#aaddaa"},{text:"中石器时代",color:"#514639"},{text:" !",color:"#aaddaa"}]


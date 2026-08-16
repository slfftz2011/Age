particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.5 100
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
effect give @s minecraft:saturation 6 1
xp add @s 20
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 20
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s",separator:","},{text:" 完成了挑战 ",color:"#aaddaa"},{text:"蔽体之始",color:"gold"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +20! ",color:"#aaddaa"}
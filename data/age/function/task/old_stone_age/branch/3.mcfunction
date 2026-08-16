particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.5 100
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
effect give @s minecraft:strength 180 0
xp add @s 80
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 70
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s",separator:","},{text:" 完成了挑战 ",color:"#aaddaa"},{text:"缚鸡之力",color:"gold"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +80! ",color:"#aaddaa"}
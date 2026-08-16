playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 20
xp add @s 10
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了阶段任务 ",color:"#aaddaa"},{text:"刺破黎明",color:"green"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +20! ",color:"#aaddaa"}
advancement grant @s only age:old_stone_age/phase_3a_unlocker

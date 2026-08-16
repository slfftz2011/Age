playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 10
xp add @s 5
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了阶段任务 ",color:"#aaddaa"},{text:"石语者",color:"green"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +10! ",color:"#aaddaa"}
advancement grant @s only age:old_stone_age/phase_2a_unlocker
advancement grant @s only age:old_stone_age/phase_2b_unlocker
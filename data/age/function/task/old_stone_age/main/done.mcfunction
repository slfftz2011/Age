particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.5 100
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~
xp add @s 50
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 100
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s",separator:","},{text:" 完成了全部主线 ",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +100! ",color:"#aaddaa"}

scoreboard players set @s task_old_stone_a_done 0
scoreboard players set @s task_old_stone_b_done 0
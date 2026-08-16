playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
execute if entity @s[team=old_stone_age] run scoreboard players add old_stone_age stage 30
xp add @s 15
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@s"},{text:" 完成了阶段任务 ",color:"#aaddaa"},{text:"弓鸣·敌殁",color:"green"},{text:" !",color:"#aaddaa"}]
tellraw @a {text:"时代进度 +30! ",color:"#aaddaa"}
scoreboard players set @s task_old_stone_b_done 1

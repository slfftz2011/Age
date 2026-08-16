scoreboard players set steam_age_2 stage 0
tag @a[team=steam_age_2] add steam_up_2
team join steam_age_3 @a[tag=steam_up_2]
effect clear @a[tag=steam_up_2]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=steam_up_2]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"蒸汽时代-III",color:"#b0e9c3",bold:true},{text:" !",color:"#aaddaa"}]
tag @a[tag=steam_up_2] remove steam_up
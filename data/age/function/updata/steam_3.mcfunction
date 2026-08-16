scoreboard players set steam_age_3 stage 0
tag @a[team=steam_age_3] add steam_up_3
team join steam_age_4 @a[tag=steam_up_3]
effect clear @a[tag=steam_up_3]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=steam_up_3]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"蒸汽时代-IV",color:"#eeee93",bold:true},{text:" !",color:"#aaddaa"}]
tag @a[tag=steam_up_3] remove steam_up_3
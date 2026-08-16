scoreboard players set steam_age stage 0
tag @a[team=steam_age] add steam_up
team join steam_age_2 @a[tag=steam_up]
effect clear @a[tag=steam_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=steam_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"蒸汽时代-II",color:"#a9a7c6",bold:true},{text:" !",color:"#aaddaa"}]
tag @a[tag=steam_up] remove steam_up
scoreboard players set steam_age_4 stage 0
tag @a[team=steam_age_4] add steam_up_4
team join steam_age_5 @a[tag=steam_up_4]
effect clear @a[tag=steam_up_4]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=steam_up_4]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"蒸汽时代-V",color:"#8988ff",bold:true},{text:" !",color:"#aaddaa"}]
tag @a[tag=steam_up_4] remove steam_up_4
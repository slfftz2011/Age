scoreboard players set steam_age_5 stage 0
tag @a[team=steam_age_5] add steam_up_5
team join modern_age @a[tag=steam_up_5]
effect clear @a[tag=steam_up_5]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=steam_up_5]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},[{text:"✈",color:"#ffd0d0",bold:true},{text:"摩",color:"#f3c8da"},{text:"登",color:"#e6c0e6"},{text:"时",color:"#dac8f3"},{text:"代",color:"#d0d0ff"}],{text:" !",color:"#aaddaa"}]
tag @a[tag=steam_up_5] remove steam_up_5
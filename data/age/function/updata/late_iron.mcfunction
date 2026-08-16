scoreboard players set late_iron_age stage 0
tag @a[team=late_iron_age] add late_iron_up
team join steam_age @a[tag=late_iron_up]
effect clear @a[tag=late_iron_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=late_iron_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"蒸汽时代-I",color:"#ecc9a3",bold:true},{text:" !",color:"#aaddaa"}]
tag @a[tag=late_iron_up] remove late_iron_up
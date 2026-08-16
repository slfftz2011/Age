scoreboard players set bronze_age stage 0
tag @a[team=bronze_age] add bronze_up
team join pre_iron_age @a[tag=bronze_up]
effect clear @a[tag=bronze_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=bronze_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"早期铁器时代",color:"#e1d0b2"},{text:" !",color:"#aaddaa"}]
tag @a[tag=bronze_up] remove bronze_up
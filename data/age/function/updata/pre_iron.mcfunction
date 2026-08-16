scoreboard players set pre_iron_age stage 0
tag @a[team=pre_iron_age] add pre_iron_up
team join mid_iron_age @a[tag=pre_iron_up]
effect clear @a[tag=pre_iron_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=pre_iron_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"中期铁器时代",color:"#ffefdd"},{text:" !",color:"#aaddaa"}]
tag @a[tag=pre_iron_up] remove pre_iron_up
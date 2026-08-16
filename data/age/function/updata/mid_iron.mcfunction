scoreboard players set mid_iron_age stage 0
tag @a[team=mid_iron_age] add mid_iron_up
team join late_iron_age @a[tag=mid_iron_up]
effect clear @a[tag=mid_iron_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=mid_iron_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"晚期铁器时代",color:"#6e727f"},{text:" !",color:"#aaddaa"}]
tag @a[tag=mid_iron_up] remove mid_iron_up
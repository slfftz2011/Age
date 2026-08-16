scoreboard players set mid_stone_age stage 0
tag @a[team=mid_stone_age] add mid_stone_up
team join new_stone_age @a[tag=mid_stone_up]
effect clear @a[tag=mid_stone_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=mid_stone_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"新石器时代",color:"#646464"},{text:" !",color:"#aaddaa"}]
tag @a[tag=mid_stone_up] remove mid_stone_up
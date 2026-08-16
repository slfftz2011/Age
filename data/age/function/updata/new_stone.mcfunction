scoreboard players set new_stone_age stage 0
tag @a[team=new_stone_age] add new_stone_up
team join copper_age @a[tag=new_stone_up]
effect clear @a[tag=new_stone_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=new_stone_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"红铜时代",color:"#877056"},{text:" !",color:"#aaddaa"}]
tag @a[tag=new_stone_up] remove new_stone_up
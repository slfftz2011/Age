scoreboard players set copper_age stage 0
tag @a[team=copper_age] add copper_up
team join bronze_age @a[tag=copper_up]
effect clear @a[tag=copper_up]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=copper_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"青铜时代",color:"#789163"},{text:" !",color:"#aaddaa"}]
tag @a[tag=copper_up] remove copper_up
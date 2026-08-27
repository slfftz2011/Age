
tag @p add level_reset
team join new_stone_age @a[tag=level_reset]
effect clear @a[tag=level_reset]
tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=mid_stone_up]",separator:","},{text:" 降级至 ",color:"#aaddaa"},{text:"旧石器时代",color:"#646464"},{text:" !",color:"#aaddaa"}]
tag @a[tag=level_reset] remove level_reset
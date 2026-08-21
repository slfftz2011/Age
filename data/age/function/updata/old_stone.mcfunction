#-------------------------
# 旧石器时代晋升
# age:updata/old_stone
#-------------------------
scoreboard players set old_stone_age stage 0
tag @a[team=old_stone_age] add old_stone_up
team join mid_stone_age @a[tag=old_stone_up]

effect clear @a[tag=old_stone_up]


tellraw @a ["",{text:"恭喜玩家 ",color:"#aaddaa"},{type:"selector",selector:"@a[tag=old_stone_up]",separator:","},{text:" 晋升至 ",color:"#aaddaa"},{text:"中石器时代",color:"#514639"},{text:" !",color:"#aaddaa"}]

tellraw @a[tag=old_stone_up] ""

tag @a[tag=old_stone_up] remove old_stone_up

scoreboard players set old_stone_age task 0
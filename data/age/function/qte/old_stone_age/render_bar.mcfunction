scoreboard players operation #g qte_tmp = @s qte_elapsed
scoreboard players operation #g qte_tmp /= #c8 qte_tmp
execute if score #g qte_tmp matches 11.. run scoreboard players set #g qte_tmp 10

# 空格主标题：触发 subtitle 渲染
title @s title {"text":" "}

execute if score #g qte_tmp matches 0 run title @s subtitle [{"text":"[","color":"gray"},{"text":"□□□□□","color":"dark_gray"},{"text":"◉","color":"dark_green"},{"text":"□□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 1 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■","color":"dark_red"},{"text":"□□□□","color":"dark_gray"},{"text":"◉","color":"dark_green"},{"text":"□□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 2 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■","color":"dark_red"},{"text":"□□□","color":"dark_gray"},{"text":"◉","color":"dark_green"},{"text":"□□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 3 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■","color":"yellow"},{"text":"□□","color":"dark_gray"},{"text":"◉","color":"dark_green"},{"text":"□□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 4 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■","color":"yellow"},{"text":"□","color":"dark_gray"},{"text":"◉","color":"dark_green"},{"text":"□□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 5 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"green"},{"text":"◉","color":"green"},{"text":"□□□□","color":"dark_gray"},{"text":"] 点击!"}]
execute if score #g qte_tmp matches 6 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"yellow"},{"text":"◉","color":"dark_green"},{"text":"■","color":"gold"},{"text":"□□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 7 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"yellow"},{"text":"◉","color":"dark_green"},{"text":"■■","color":"gold"},{"text":"□□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 8 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"gold"},{"text":"◉","color":"dark_green"},{"text":"■■■","color":"red"},{"text":"□","color":"dark_gray"},{"text":"]"}]
execute if score #g qte_tmp matches 9 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"gold"},{"text":"◉","color":"dark_green"},{"text":"■■■■","color":"red"},{"text":"]"}]
execute if score #g qte_tmp matches 10 run title @s subtitle [{"text":"[","color":"gray"},{"text":"■■■■■","color":"red"},{"text":"◉","color":"dark_green"},{"text":"■■■■","color":"dark_red"},{"text":"]"}]
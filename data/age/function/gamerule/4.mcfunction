tellraw @s {text:"========== 游戏规则 [4/4] ==========",color:"gold"}
tellraw @s {text:"背包、容器与配方",color:"gold","bold":true}
tellraw @s {text:"",color:"white"}

tellraw @s [{"text":"[背包锁定] ","color":"gold","bold":true},{"text":"早期时代禁用高级物品，随时代晋升逐步解锁；这是时代进程的一部分，并非永久限制。","color":"white"}]

tellraw @s [{"text":"[容器交互控制] ","color":"gold","bold":true},{"text":"容器采用视线锁定 / 半径解锁机制：靠近并看向容器时才会触发交互限制，离开视线或范围后自动解除。","color":"white"}]

tellraw @s [{"text":"[配方锁定] ","color":"gold","bold":true},{"text":"未解锁的配方不会出现在合成书中；随着时代晋升，对应配方会自动加入可用列表。","color":"white"}]

tellraw @s [{"text":"[重要提醒] ","color":"red","bold":true},{"text":"以上均为总规则，适用于所有时代；每个时代还有其专属特性，将在对应时代的规则页中单独说明。","color":"white"}]

tellraw @s {text:"",color:"white"}
tellraw @s ["", "[", {text:"上一页",color:"gold",click_event:{action:"run_command",command:"/trigger age_gamerule_page set 3"}}, "]","  |  [",{text:"返回第一页",color:"gold",click_event:{action:"run_command",command:"/trigger age_gamerule_page set 1"}},"]"]
# 冗余保护：副手必须确实是砂砾
execute unless items entity @s weapon.offhand minecraft:gravel run return fail

# 尝试读取副手数量
execute store result score #g qte_tmp run data get entity @s Inventory[{Slot:-106b}].count

# 读取失败（≤0）→ 兜底只清 1 个，不清空堆叠
execute if score #g qte_tmp matches ..0 run return run clear @s minecraft:gravel 1

# 正常路径：数量减 1
scoreboard players remove #g qte_tmp 1

# 还有剩余 → 写回新数量
execute if score #g qte_tmp matches 1.. store result entity @s Inventory[{Slot:-106b}].count int 1 run scoreboard players get #g qte_tmp

# 减到 0 → 清空副手
execute if score #g qte_tmp matches ..0 run item replace entity @s weapon.offhand with minecraft:air
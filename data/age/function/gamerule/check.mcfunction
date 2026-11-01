# 检测玩家是否通过点击请求了翻页
# 如果请求的是第 2 页，就执行第 2 页的显示函数
execute as @a[scores={age_gamerule_page=2}] run function age:gamerule/2

# 请求第 3 页
execute as @a[scores={age_gamerule_page=3}] run function age:gamerule/3

# 请求第 4 页
execute as @a[scores={age_gamerule_page=4}] run function age:gamerule/4

# 请求返回第 1 页
execute as @a[scores={age_gamerule_page=1}] run function age:gamerule/1

# 处理完后重置触发器，避免重复执行
scoreboard players reset @a age_gamerule_page
# 重置后需要重新启用，否则玩家无法再次点击
scoreboard players enable @a age_gamerule_page
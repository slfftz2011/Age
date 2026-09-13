# ===== 温度系统常量（只读） =====
# 温度变化速度
scoreboard players set 10 temperaturec 50

# 维度开关默认值
scoreboard players set nether temperaturec 0
scoreboard players set end temperaturec 0

# 高度除数（用于高度修正）
scoreboard players set #height_div temperature.tmp 1000
scoreboard players set #two temperature.tmp 2
scoreboard players set #neg temperature.tmp -1
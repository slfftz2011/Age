# ===== 每 tick 更新状态 =====

# 全局状态计时器（每秒重置）
scoreboard players add @a global_state_timer 1

# 秒级更新
execute as @a if score @s global_state_timer matches 20.. run function age:state/temperature/weather_timer
execute as @a if score @s global_state_timer matches 20.. run function age:state/temperature/debuff
execute as @a if score @s global_state_timer matches 20.. run function age:state/thirst/debuff

# 温度计时器（每5 tick计算一次环境温度）
scoreboard players add @a temp_timer 1
execute as @a if score @s temp_timer matches 5.. run function age:state/temperature/updata
execute as @a if score @s temp_timer matches 5.. run scoreboard players set @s temp_timer 0

# 口渴更新（保持原样）
execute as @a run function age:state/thirst/updata

# 全局状态计时器重置
execute as @a if score @s global_state_timer matches 20.. run scoreboard players set @s global_state_timer 0

# 死亡更新
execute if score @s death matches 1.. run function age:state/init_player
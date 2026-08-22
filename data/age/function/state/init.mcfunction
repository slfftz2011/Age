# ===== State Bar 系统初始化 =====
# ---- 全局记分板 ----
scoreboard objectives add global_state_timer dummy

scoreboard objectives add weather_clear_timer dummy
scoreboard objectives add time_offset dummy
scoreboard objectives add time_day dummy



# ---- 辅助记分板 ----
# 体感温度
scoreboard objectives add temp_diff dummy
scoreboard objectives add temp_step_abs dummy
scoreboard objectives add temp_delta dummy
scoreboard objectives add temp_prev dummy
scoreboard objectives add env_temp dummy
scoreboard objectives add temp_trend dummy
scoreboard objectives add temp_timer dummy
scoreboard objectives add temperature.tmp dummy

# 环境温度
scoreboard objectives add temp_y dummy
scoreboard objectives add temp_height dummy
scoreboard objectives add temp_humid_dir dummy

scoreboard objectives add metal_modify dummy



# ---- 主记分板 ----
scoreboard objectives add temperature dummy "体感温度"
scoreboard objectives add thirst dummy "口渴值"
scoreboard objectives add mana dummy "魔法值"
scoreboard objectives add sanity dummy "心情值"
scoreboard objectives add energy dummy "精力值"

# ---- 最大值记分板 --- 
scoreboard objectives add thirst_max dummy
scoreboard objectives add mana_max dummy
scoreboard objectives add sanity_max dummy
scoreboard objectives add energy_max dummy

# ---- 变化记录 ----
scoreboard objectives add thirst_prev dummy
scoreboard objectives add mana_prev dummy
scoreboard objectives add sanity_prev dummy
scoreboard objectives add energy_prev dummy



# 显示计时器
scoreboard players set #state time 0

# 温度常量
function age:state/const
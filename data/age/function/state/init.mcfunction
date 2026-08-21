# ===== State Bar 系统初始化 =====
scoreboard objectives add global_state_timer dummy

# 辅助记分板（用于温度计算）
scoreboard objectives add temp_aux dummy
scoreboard objectives add diff dummy
scoreboard objectives add step_abs dummy
scoreboard objectives add temperature_delta dummy
scoreboard objectives add temperature_prev dummy
scoreboard objectives add env_temp dummy
scoreboard objectives add temperature_trend dummy
scoreboard objectives add temperature_timer dummy
scoreboard objectives add temperature.tmp dummy

# 环境温度计算临时记分板
scoreboard objectives add temp_y dummy
scoreboard objectives add temp_height dummy
scoreboard objectives add temp_humid_dir dummy

# 温度主记分板
scoreboard objectives add temperature dummy "体感温度"

# 护甲修正
scoreboard objectives add metal_count dummy

# 天气与时间
scoreboard objectives add weather_clear_timer dummy
scoreboard objectives add time_of_day dummy
scoreboard objectives add time_offset dummy


# 属性记分板
scoreboard objectives add thirst dummy "口渴值"
scoreboard objectives add mana dummy "魔法值"
scoreboard objectives add sanity dummy "心情值"
scoreboard objectives add energy dummy "精力值"

# 最大值记分板
scoreboard objectives add thirst_max dummy
scoreboard objectives add mana_max dummy
scoreboard objectives add sanity_max dummy
scoreboard objectives add energy_max dummy

# 变化记录（用于检测阈值变化）
scoreboard objectives add thirst_prev dummy
scoreboard objectives add mana_prev dummy
scoreboard objectives add sanity_prev dummy
scoreboard objectives add energy_prev dummy

# 显示计时器
scoreboard objectives add time dummy
scoreboard players set #state time 0

# 温度常量（只读）
function age:state/const
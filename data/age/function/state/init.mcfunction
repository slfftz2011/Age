# ===== State Bar 系统 =====
# 属性记分板
scoreboard objectives add thirst dummy "口渴值"
scoreboard objectives add mana dummy "魔法值"
scoreboard objectives add sanity dummy "心情值"
scoreboard objectives add energy dummy "精力值"
scoreboard objectives add temperature dummy "体感温度"
scoreboard objectives add temperature_trend dummy "温度趋势"

# 最大值记分板
scoreboard objectives add thirst_max dummy
scoreboard objectives add mana_max dummy
scoreboard objectives add sanity_max dummy
scoreboard objectives add energy_max dummy

# 计时器
scoreboard objectives add global_state_timer dummy

# 状态变化记录
scoreboard objectives add thirst_prev dummy
scoreboard objectives add mana_prev dummy
scoreboard objectives add sanity_prev dummy
scoreboard objectives add energy_prev dummy
scoreboard objectives add temperature_prev dummy
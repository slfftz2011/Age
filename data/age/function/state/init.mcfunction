# ===== State Bar 系统初始化 =====
# ---- 全局记分板 ----
scoreboard objectives add global_state_timer dummy

scoreboard objectives add weather_clear_timer dummy
scoreboard objectives add time_offset dummy
scoreboard objectives add time_of_day dummy
scoreboard objectives add food_cur dummy
scoreboard objectives add food_prev dummy
scoreboard objectives add sat_cur dummy
scoreboard objectives add sat_prev dummy
scoreboard objectives add food_diff dummy
scoreboard objectives add sat_diff dummy


# ---- 体感温度 ----
scoreboard objectives add temperaturec dummy
scoreboard objectives add temp_resistance dummy
scoreboard objectives add potion_cooling dummy
scoreboard objectives add beetroot_soup_cooling dummy
scoreboard objectives add warp_rabbit_stew dummy
scoreboard objectives add beetroot_cooling dummy
scoreboard objectives add apple_cooling dummy
scoreboard objectives add carrot_cooling dummy
scoreboard objectives add sweet_berries_cooling dummy
scoreboard objectives add glow_berries_cooling dummy
scoreboard objectives add melon_cooling dummy
scoreboard objectives add golden_carrot_cooling dummy
scoreboard objectives add disable_nether dummy
scoreboard objectives add disable_end dummy
scoreboard objectives add enable_nether dummy
scoreboard objectives add enable_end dummy
scoreboard objectives add admin dummy
scoreboard objectives add is_admin dummy
scoreboard objectives add temp_step_pending dummy
scoreboard objectives add temp_step_abs dummy
scoreboard objectives add env_temp dummy
scoreboard objectives add metal_modify dummy
scoreboard objectives add temp_delta dummy
scoreboard objectives add temp_diff dummy
scoreboard objectives add temp_height dummy
scoreboard objectives add temp_humid_dir dummy
scoreboard objectives add temp_prev dummy
scoreboard objectives add temp_timer dummy
scoreboard objectives add temp_trend dummy
scoreboard objectives add temp_y dummy
scoreboard objectives add temperature dummy
scoreboard objectives add temperature.tmp dummy
scoreboard objectives add temperature_resistance dummy

# 口渴值
scoreboard objectives add thirst_timer dummy
scoreboard objectives add thirst_buff_timer dummy


# ---- 主记分板 ----
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


# ---- debuff ----
scoreboard objectives add heatstroke dummy
scoreboard objectives add frozen dummy

scoreboard objectives add dry dummy
scoreboard objectives add famish dummy


# 显示计时器
scoreboard players set #state time 0

# 温度常量
function age:state/const
# ===== 体感温度范围限制 + 抗性 =====

# 限制范围 -40~50
execute if score @s temperature matches 51.. run scoreboard players set @s temperature 50
execute if score @s temperature matches ..-41 run scoreboard players set @s temperature -40

# 温度抗性
execute if score @s temp_resistance > 0 temperaturec run scoreboard players set @s temperature 0
execute if score @s temp_resistance matches 1.. run scoreboard players remove @s temp_resistance 1
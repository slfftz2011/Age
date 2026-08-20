# ===== 状态栏显示 =====

# 1. 炎热（🔴 橘红）
execute as @a if score @s temperature matches 54..71 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"🔴   ",color:"gold"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 2. 中暑（🔥 红色）
execute as @a if score @s temperature matches 72.. run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"🔥   ",color:"red"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 3. 升温（⬆️ 淡黄）
execute as @a if score @s temperature matches 24..53 if score @s temperature_trend matches 1 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"⬆️   ",color:"yellow"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 4. 适宜（🟡️ 淡黄）
execute as @a if score @s temperature matches 24..53 if score @s temperature_trend matches 0 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"🟡️   ",color:"yellow"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 5. 降温（⬇️ 淡黄）
execute as @a if score @s temperature matches 24..53 if score @s temperature_trend matches -1 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"⬇️   ",color:"yellow"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 6. 寒冷（🔵 青）
execute as @a if score @s temperature matches 10..23 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"🔵   ",color:"aqua"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:"light_purple"}]
]

# 7. 冻僵（❄ 淡蓝）
execute as @a if score @s temperature matches ..9 run title @s actionbar [
  [{score:{name:"@s",objective:"thirst"},color:"aqua"},{text:"/",color:"aqua"},{score:{name:"@s",objective:"thirst_max"},color:"aqua"},{text:"💧   ",color:"aqua"}],
  [{score:{name:"@s",objective:"mana"},color:"red"},{text:"/",color:"red"},{score:{name:"@s",objective:"mana_max"},color:"red"},{text:"✨   ",color:"red"}],
  {text:"❄   ",color:"light_blue"},
  [{score:{name:"@s",objective:"energy"},color:"gold"},{text:"/",color:"gold"},{score:{name:"@s",objective:"energy_max"},color:"gold"},{text:"⚡   ",color:"gold"}],
  [{score:{name:"@s",objective:"sanity"},color:"light_purple"},{text:"/",color:"light_purple"},{score:{name:"@s",objective:"sanity_max"},color:"light_purple"},{text:"🧠",color:" #8CB3FF"}]
]
# 槽位锁定/解锁函数
# 锁定槽位: container.9-35
# 保留槽位: hotbar.0,hotbar.1,hotbar.2,hotbar.3,hotbar.4,hotbar.5,hotbar.6,hotbar.7,hotbar.8,weapon.offhand,armor.head,armor.chest,armor.legs,armor.feet

# 清除保留槽位中的屏障
execute if items entity @s hotbar.0 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.0 with air
execute if items entity @s hotbar.1 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.1 with air
execute if items entity @s hotbar.2 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.2 with air
execute if items entity @s hotbar.3 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.3 with air
execute if items entity @s hotbar.4 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.4 with air
execute if items entity @s hotbar.5 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.5 with air
execute if items entity @s hotbar.6 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.6 with air
execute if items entity @s hotbar.7 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.7 with air
execute if items entity @s hotbar.8 minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s hotbar.8 with air
execute if items entity @s weapon.offhand minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s weapon.offhand with air
execute if items entity @s armor.head minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s armor.head with air
execute if items entity @s armor.chest minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s armor.chest with air
execute if items entity @s armor.legs minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s armor.legs with air
execute if items entity @s armor.feet minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}] run item replace entity @s armor.feet with air

# 强制锁定指定槽位
item replace entity @s container.9 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.10 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.11 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.12 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.13 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.14 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.15 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.16 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.17 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.18 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.19 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.20 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.21 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.22 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.23 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.24 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.25 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.26 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.27 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.28 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.29 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.30 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.31 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.32 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.33 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.34 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
item replace entity @s container.35 with minecraft:barrier[minecraft:custom_name={text:"✖",color:"red",italic:false}]
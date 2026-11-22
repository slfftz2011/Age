item modify entity @s weapon.mainhand age:rod_damage

# 将 special:0b 改为 special:1b，加上名字，并让它的最大耐久为 1（防止继续扣）
execute if items entity @s weapon.mainhand *[minecraft:damage=25] run item replace entity @s weapon.mainhand with minecraft:carrot_on_a_stick[minecraft:custom_data={from: "old_stone_age",special:1b},minecraft:item_name={"text":"破碎的筛子","color":"dark_gray"},minecraft:max_damage=1]

# 音效反馈
execute if items entity @s weapon.mainhand *[minecraft:custom_data={from:"old_stone_age",special:1b}] run playsound minecraft:entity.item.break hostile @s ~ ~ ~ 1 1
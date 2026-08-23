execute if score @s food_cur matches 0 run function age:state/thirst/debuff/famish

execute if score @s thirst matches ..6 run function age:state/thirst/debuff/dry

execute if score @s thirst matches 0 run function age:state/thirst/debuff/dehydrate
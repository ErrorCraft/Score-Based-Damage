function custom_damage:health/calculate_modifier
execute if score @s custom_damage >= #maximum_health custom_damage run function #custom_damage:death
execute if score @s custom_damage < #maximum_health custom_damage run function custom_damage:health/update
scoreboard players reset @s custom_damage

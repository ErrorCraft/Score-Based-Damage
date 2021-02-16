# Calculate health modifier
function custom_damage:health/calculate_modifier

# Death
execute if score @s custom_damage >= #maximum_health custom_damage run function #custom_damage:death

# New health
execute if score @s custom_damage < #maximum_health custom_damage run function custom_damage:health/decide

# Reset score
scoreboard players reset @s custom_damage

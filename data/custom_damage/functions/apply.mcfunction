# Calculate health modifier
function custom_damage:calculate/health_modifier

# Death (may redirect to another function to simulate death)
execute if score @s custom_damage >= #maximum_health custom_damage run kill

# New health
execute if score @s custom_damage < #maximum_health custom_damage run function custom_damage:health/decide

# Reset score
scoreboard players reset @s custom_damage
# Simulate effect
execute if score #type custom_damage matches 0 run effect give @s instant_damage 1 30 true

# Give attributes
function custom_damage:attributes/give

# Effect to force update health
effect give @s health_boost 1 0 true
effect clear @s health_boost

# Remove attributes
function custom_damage:attributes/remove
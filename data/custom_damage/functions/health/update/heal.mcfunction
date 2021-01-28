# Give attributes
function custom_damage:attributes/give

# Effect to force update health
effect give @s instant_health 1 24 true

# Schedule
schedule function custom_damage:attributes/schedule 1t

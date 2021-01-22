# Store set value
scoreboard players operation #value custom_damage = @s custom_damage

# Maximum Health
execute store result score #maximum_health custom_damage run attribute @s generic.max_health get

# Current Health
execute store result score #current_health custom_damage run data get entity @s Health

# Add health difference
scoreboard players operation @s custom_damage += #maximum_health custom_damage
scoreboard players operation @s custom_damage -= #current_health custom_damage
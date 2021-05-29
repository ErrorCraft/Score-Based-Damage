execute store result score #maximum_health custom_damage run attribute @s generic.max_health get
execute store result score #current_health custom_damage run data get entity @s Health
scoreboard players operation @s custom_damage += #maximum_health custom_damage
scoreboard players operation @s custom_damage -= #current_health custom_damage

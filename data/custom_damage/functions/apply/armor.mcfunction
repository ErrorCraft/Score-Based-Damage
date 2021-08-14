# rx97
#  adapted from TCC

# get values (x100)
execute store result score #10armor custom_damage run attribute @s minecraft:generic.armor get 10
execute store result score #10toughness custom_damage run attribute @s minecraft:generic.armor_toughness get 10
scoreboard players operation #damage custom_damage = @s custom_damage

# tellraw @s ["armor: ", {"score": {"name": "#10armor", "objective": "custom_damage"}, "color": "green"}]
# tellraw @s ["armor toughness: ", {"score": {"name": "#10toughness", "objective": "custom_damage"}, "color": "red"}]
# tellraw @s ["damage: ", {"score": {"name": "#damage", "objective": "custom_damage"}, "color": "green"}]

data modify storage custom_damage:temp self set from entity @s

# first armor and toughness
function custom_damage:armor/toughness

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "red"}]

# then protection
function custom_damage:armor/protection

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "green"}]

# finally resistance
function custom_damage:armor/resistance

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "red"}]

# tellraw @s ""

# go back to same scale
scoreboard players operation @s custom_damage /= #10 custom_damage

# apply new damage
execute if score @s custom_damage matches 1.. run function custom_damage:apply

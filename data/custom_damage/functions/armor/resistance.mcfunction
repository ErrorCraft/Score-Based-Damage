# rx97
#  adapted from TCC

##################################
# Formula
#  1 #reduction = #amplifier * 20%
##################################

scoreboard players set #reduction custom_damage 0

# First, lets grab the values
execute if data storage custom_damage:temp self.ActiveEffects[{Id:11b}] store result score #reduction custom_damage run data get storage custom_damage:temp self.ActiveEffects[{Id:11b}].Amplifier
execute if data storage custom_damage:temp self.ActiveEffects[{Id:11b}] run scoreboard players add #reduction custom_damage 1

# 1
scoreboard players operation #reduction custom_damage *= #20 custom_damage

# tellraw @s ["#resist %: ", {"score": {"name": "#reduction", "objective": "custom_damage"}, "color": "blue"}]

# Let's calculate the damage to remove
scoreboard players operation #resistance custom_damage = @s custom_damage
scoreboard players operation #resistance custom_damage *= #reduction custom_damage
scoreboard players operation #resistance custom_damage /= #100 custom_damage

# tellraw @s ["#resistance: ", {"score": {"name": "#resistance", "objective": "custom_damage"}, "color": "blue"}]

scoreboard players operation @s custom_damage -= #resistance custom_damage

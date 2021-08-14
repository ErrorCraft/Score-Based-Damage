# rx97
#  adapted from TCC

##################################
# Formula
#  2 #reduction = max(80,   #reduction   )%
#  1 #reduction = max(80,  ( 8 × level ) )%
##################################

execute store result score #helm custom_damage run data get storage custom_damage:temp self.Inventory[{Slot:103b}].tag.Enchantments[{id:"minecraft:projectile_protection"}].lvl
execute store result score #chest custom_damage run data get storage custom_damage:temp self.Inventory[{Slot:102b}].tag.Enchantments[{id:"minecraft:projectile_protection"}].lvl
execute store result score #legs custom_damage run data get storage custom_damage:temp self.Inventory[{Slot:101b}].tag.Enchantments[{id:"minecraft:projectile_protection"}].lvl
execute store result score #boots custom_damage run data get storage custom_damage:temp self.Inventory[{Slot:100b}].tag.Enchantments[{id:"minecraft:projectile_protection"}].lvl

# 0 (add up level)
scoreboard players operation #reduction custom_damage = #helm custom_damage
scoreboard players operation #reduction custom_damage += #chest custom_damage
scoreboard players operation #reduction custom_damage += #legs custom_damage
scoreboard players operation #reduction custom_damage += #boots custom_damage

# 1
scoreboard players operation #reduction custom_damage *= #8 custom_damage

# 2
scoreboard players operation #reduction custom_damage < #80 custom_damage


# Let's calculate the damage to remove
scoreboard players operation #protection custom_damage = @s custom_damage
scoreboard players operation #protection custom_damage *= #reduction custom_damage
scoreboard players operation #protection custom_damage /= #100 custom_damage

scoreboard players operation @s custom_damage -= #protection custom_damage

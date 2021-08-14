# rx97
#  adapted from TCC

##################################
# Main Formula
# 10  @s
# 9   @s  = @s / 25
# 8   @s  = #damage *         @s          / 25   
# 7   @s  = #damage * (250 - #armor_calc) / 25
# 6   @s  = #damage * (250 - (min(200,        #armor_calc           )) / 25
# 1   @s  = #damage * (250 - (min(200, max( #armor_calc   , #10ATF ))) / 25
#
#  damage = #damage * (250 - (min(200, max( 10armor ÷ 5   , #10ATF ))) / 25
##################################

##################################
# ATF Formula
# 5   #10ATF
# 4   #10ATF = (10armor - #damage_toughness
# 3   #10ATF = (10armor - (400 * #damage_toughness          )
# 2   #10ATF = (10armor - (400 * damage / (#toughness_calc ))
# 
#     #10ATF = (10armor - (400 * damage / (80 + 10toughness))
##################################

# 1
scoreboard players operation #armor_calc custom_damage = #10armor custom_damage
scoreboard players operation #armor_calc custom_damage /= #5 custom_damage

# tellraw @s ["1 #armor_calc: ", {"score": {"name": "#armor_calc", "objective": "custom_damage"}, "color": "light_purple"}]

# 2 (ATF)
scoreboard players operation #toughness_calc custom_damage = #10toughness custom_damage
scoreboard players add #toughness_calc custom_damage 80

# tellraw @s ["2 #toughness_calc: ", {"score": {"name": "#toughness_calc", "objective": "custom_damage"}, "color": "yellow"}]

# 3
scoreboard players operation #damage_toughness custom_damage = #damage custom_damage
scoreboard players operation #damage_toughness custom_damage *= #100 custom_damage
scoreboard players operation #damage_toughness custom_damage /= #toughness_calc custom_damage

# tellraw @s ["3 #damage_toughness: ", {"score": {"name": "#damage_toughness", "objective": "custom_damage"}, "color": "light_purple"}]

# 4
scoreboard players operation #damage_toughness custom_damage *= #4 custom_damage

# tellraw @s ["4 #damage_toughness: ", {"score": {"name": "#damage_toughness", "objective": "custom_damage"}, "color": "yellow"}]

# 5
scoreboard players operation #10ATF custom_damage = #10armor custom_damage
scoreboard players operation #10ATF custom_damage -= #damage_toughness custom_damage

# tellraw @s ["5 #10ATF: ", {"score": {"name": "#10ATF", "objective": "custom_damage"}, "color": "light_purple"}]

# 6
scoreboard players operation #armor_calc custom_damage > #10ATF custom_damage

# tellraw @s ["6 #armor_calc: ", {"score": {"name": "#armor_calc", "objective": "custom_damage"}, "color": "yellow"}]

# 7
scoreboard players operation #armor_calc custom_damage < #200 custom_damage

# tellraw @s ["7 #armor_calc: ", {"score": {"name": "#armor_calc", "objective": "custom_damage"}, "color": "light_purple"}]

# 8
scoreboard players set @s custom_damage 250
scoreboard players operation @s custom_damage -= #armor_calc custom_damage

# tellraw @s ["8 @s: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "yellow"}]

# 9
scoreboard players operation @s custom_damage *= #damage custom_damage

# tellraw @s ["9 @s: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "light_purple"}]

# 10
scoreboard players operation @s custom_damage /= #25 custom_damage

# tellraw @s ["10 @s: ", {"score": {"name": "@s", "objective": "custom_damage"}, "color": "yellow"}]

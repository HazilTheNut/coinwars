# classes/griefer/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 1
#
# Summary: Populates inventory for the Griefer class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer

# =============================
# Armor
item replace entity @s armor.head with minecraft:golden_helmet[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=16490297]
item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=16490297]
item replace entity @s armor.feet with minecraft:golden_boots[minecraft:unbreakable={show_in_tooltip:false},minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"coinwars:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"coinwars:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Flame Staff
item replace entity @s hotbar.0 with minecraft:blaze_rod[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Flame Staff\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:flame_staff_atkdmg",amount:3,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:flame_staff_atkspd",amount:-1.5,operation:"add_value"}],\
minecraft:enchantments={levels:{fire_aspect:1}}]

# Creeper in a Bottle
function coinwars:classes/griefer/creeper_ability_icon

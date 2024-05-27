# classes/frostknight/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 7
#
# Summary: Populates inventory for the Frost Knight class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

# =============================
# Armor
item replace entity @s armor.head with minecraft:iron_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=8314871]
item replace entity @s armor.legs with minecraft:iron_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.feet with minecraft:iron_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",uuid:[I; 7,14,1,0],name:"speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",uuid:[I; 7,14,2,0],name:"boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Glacial Shard
item replace entity @s hotbar.0 with minecraft:iron_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Glacial Shard\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",uuid:[I; 7,1,1,0],name:"duskpiercer_atkdmg",amount:6,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",uuid:[I; 7,1,2,0],name:"duskpiercer_atkspd",amount:-2,operation:"add_value"}]]

# classes/ranger/pe_display_climbing_energy.mcfunction
#
# Context:
#	as: an entity with class = 4
#
# Summary: Populates inventory for the Ranger class based on their current state
#
# Arguments:
#	count	: Item quantity to display

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = no arrow loaded, 1 = arrow loaded)
#	cv_G	:	
#	cv_H	:	

$item replace entity @s hotbar.5 with minecraft:kelp{display:{\
Name:"[{\"color\":\"green\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Climbing Energy\"}]",\
Lore:[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While facing a wall, uses\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" energy to climb it.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Landing on the ground\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" recharges this ability.\"}",\
]\
}} $(count)

# base/pe_raycast_recursion.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Performs recursion for raycasting
#
# Arguments:
#	delta_x				: Change in x position per step of raycast
#	delta_y				: Change in y position per step of raycast
#	delta_z				: Change in z position per step of raycast
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities the missile can collide with
#	func_step			: String function name to run every tick
#	func_end			: String function name to run when either the missile collides or expires

#tellraw @a[tag=t_debug] [{"type":"text","text":"Steps remaining: "},{"type":"score","score":{"name":"@s","objective":"rc_steps_remaining"}}]

function coinwars:base/pe_raycast_loop with storage coinwars:rc_args data

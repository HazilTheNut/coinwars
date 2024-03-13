# classes/mapmaker/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = -10
#
# Summary: Populates inventory for the Mapmaker class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @s armor.head with minecraft:air
item replace entity @s armor.chest with minecraft:air
item replace entity @s armor.legs with minecraft:air
item replace entity @s armor.feet with minecraft:air

# Hotbar
item replace entity @s hotbar.0 with minecraft:brush{display:{Name:"{\"text\":\"Smoothing Tool\"}"}}
item replace entity @s hotbar.1 with minecraft:grass_block{display:{Name:"{\"text\":\"Topsoil Tool\"}"}}
item replace entity @s hotbar.2 with minecraft:map{display:{Name:"{\"text\":\"Shoot Fireball (strong)\"}"}}
item replace entity @s hotbar.3 with minecraft:map{display:{Name:"{\"text\":\"Shoot Fireball (weak)\"}"}}
item replace entity @s hotbar.5 with minecraft:map{display:{Name:"{\"text\":\"Update Lighting\"}"}}

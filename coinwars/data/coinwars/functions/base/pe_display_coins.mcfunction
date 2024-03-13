# base/pe_display_coins.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Populates coin display in hotbar
#
# Arguments:
#	coins_ones		: Number of coins in the ones place
#	coins_tens		: Number of coins in the tens place

clear @s minecraft:gold_nugget

# Tens place
$execute if entity @s[scores={__coins_disp_tens=..0}] run item replace entity @s hotbar.7 with minecraft:gray_stained_glass_pane{display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"-\"}"}} $(coins_tens)
$execute if entity @s[scores={__coins_disp_tens=1..}] run item replace entity @s hotbar.7 with minecraft:gold_ingot{display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Coins (10)\"}"}} $(coins_tens)

# Ones place
$execute if entity @s[scores={__coins_disp_ones=..0}] run item replace entity @s hotbar.8 with minecraft:gray_stained_glass_pane{display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"-\"}"}} $(coins_ones)
$execute if entity @s[scores={__coins_disp_ones=1..}] run item replace entity @s hotbar.8 with minecraft:gold_nugget{display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Coins (1)\"}"}} $(coins_ones)

# classes/titan/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 8
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:popped_chorus_fruit[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Pull\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a homing beam that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" pulls its target back to you.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"15\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] $(charges)

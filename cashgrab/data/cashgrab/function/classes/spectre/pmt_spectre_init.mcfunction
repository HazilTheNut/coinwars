# classes/spectre/pmt_spectre_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Spectre class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 140
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 60

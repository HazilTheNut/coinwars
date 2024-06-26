# classes/ranger/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 3
#	at: the entity
#
# Summary: Loop function for Ranger class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (b'XY, where X is if in hotbar and Y is if arrow loaded)
#	cv_G	:	
#	cv_H	:	

# Track state of crossbow
scoreboard players set @s cv_F 0
#execute if items entity @s weapon.offhand minecraft:crossbow run scoreboard players set @s cv_F 0
execute if items entity @s hotbar.* minecraft:crossbow run scoreboard players set @s cv_F 2
execute if items entity @s weapon.offhand minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}]] run scoreboard players set @s cv_F 1
execute if items entity @s hotbar.* minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}]] run scoreboard players set @s cv_F 3

# Track arrow count
scoreboard players set @s cv_E 0
execute if items entity @s hotbar.* minecraft:arrow[minecraft:count=1] run scoreboard players set @s cv_E 1
execute if items entity @s hotbar.* minecraft:arrow[minecraft:count=2] run scoreboard players set @s cv_E 2
execute if items entity @s hotbar.* minecraft:arrow[minecraft:count=3] run scoreboard players set @s cv_E 3

# Wall Climb enter state
scoreboard players set @s[scores={ps_sneaking=1..2,cv_A=0,cv_B=1..}] cv_A 2
execute if score @s cv_A matches 2 run effect give @s minecraft:levitation 3 10 true
execute if score @s cv_A matches 2 run scoreboard players set @s cv_A 1

# Wall Climb collision check
tag @s remove t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^ #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^0.6 ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^-0.6 ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^ ^ ^ #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^ ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^0.6 ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^-0.6 ^ ^1 #coinwars:nonsolid run tag @s add t_ranger_climb

# Wall Climb tick down
scoreboard players remove @s[tag=t_ranger_climb,scores={cv_A=1,cv_B=0..}] cv_B 1
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. store result storage coinwwars:ranger_args data.count int 1 run scoreboard players get @s cv_B
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. run function coinwars:classes/ranger/pe_display_climbing_energy with storage coinwwars:ranger_args data
execute if score @s cv_A matches 1 if score @s cv_B matches ..0 run item replace entity @s hotbar.5 with minecraft:air

# Wall Climb sound effects
scoreboard players remove @s[tag=t_ranger_climb,scores={cv_C=1..}] cv_C 1
execute if entity @s[tag=t_ranger_climb,scores={cv_C=0}] run playsound minecraft:block.stone.step player @s ~ ~ ~ 0.5 1.0
scoreboard players set @s[tag=t_ranger_climb,scores={cv_C=..0}] cv_C 2

# Wall Climb levitation effect
effect clear @s[tag=!t_ranger_climb] minecraft:levitation
effect give @s[tag=t_ranger_climb] minecraft:levitation 3 10 true
tag @s remove t_ranger_climb

# Wall Climb exit state
scoreboard players set @s[scores={cv_A=1,cv_B=..0}] cv_A -1
scoreboard players set @s[scores={ps_sneaking=-1,cv_A=1}] cv_A -1
execute if score @s cv_A matches -1 run effect clear @s minecraft:levitation
execute if score @s cv_A matches -1 run scoreboard players set @s cv_A 0

# Refresh Wall Climb upon landing on the ground
execute if score @s ps_falling matches -1 run scoreboard players set @s cv_B 20
execute if score @s ps_falling matches -1 run function coinwars:classes/ranger/pe_display_climbing_energy {count:20}

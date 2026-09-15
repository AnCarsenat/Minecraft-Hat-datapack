#-- Trigger checks
execute as @a if score @s hat matches 1 run tag @s add hat
execute as @a[tag=hat] at @s run function hat:swap_modern
tag @e remove hat
#-- Remove helper armor stands left at 0 300 0 by older versions of this pack
kill @e[type=minecraft:armor_stand,tag=hat_saver]

scoreboard players enable @a hat
scoreboard players set @a hat 0

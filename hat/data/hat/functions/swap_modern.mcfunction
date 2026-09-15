#-- 1.17+ only: uses item replace, so this file fails to load on 1.16.x
#-- Called as and at the player. A helper armor stand summoned at the player (always a loaded chunk) keeps the old head item during the swap
summon minecraft:armor_stand ~ ~ ~ {Marker:1b,NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["hat_saver"]}
execute if entity @e[type=minecraft:armor_stand,tag=hat_saver,distance=..1] run item replace entity @e[type=minecraft:armor_stand,tag=hat_saver,limit=1,sort=nearest] weapon from entity @s armor.head
execute if entity @e[type=minecraft:armor_stand,tag=hat_saver,distance=..1] run item replace entity @s armor.head from entity @s weapon
execute if entity @e[type=minecraft:armor_stand,tag=hat_saver,distance=..1] run item replace entity @s weapon from entity @e[type=minecraft:armor_stand,tag=hat_saver,limit=1,sort=nearest] weapon
item replace entity @e[type=minecraft:armor_stand,tag=hat_saver,distance=..1] weapon with minecraft:air
kill @e[type=minecraft:armor_stand,tag=hat_saver,distance=..1]

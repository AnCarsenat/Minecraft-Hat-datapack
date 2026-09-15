#-- 1.16.x only, called by tick_legacy as the player
#-- Mining the box with a hat_drop_contents stick drops only its contents (see loot_tables/blocks/shulker_box.json)
#-- The box drops all 27 slots (empties included), so every loot replace must use count 1
data remove storage hat:swap head
data modify storage hat:swap head set from entity @s Inventory[{Slot:103b}]
scoreboard players set #head_ok hat 0

#-- Held item to head (1.16 refuses chestplates, leggings, boots and elytra there: #head_ok stays 0)
data modify block -30000000 0 1600 Items append from entity @s SelectedItem
execute store result score #head_ok hat run loot replace entity @s armor.head 1 mine -30000000 0 1600 minecraft:stick{hat_drop_contents:1b}
replaceitem block -30000000 0 1600 container.0 minecraft:air

#-- Old head item to hand, only if the head took the held item
execute if score #head_ok hat matches 1 if data storage hat:swap head run data modify storage hat:swap head.Slot set value 0b
execute if score #head_ok hat matches 1 run data modify block -30000000 0 1600 Items append from storage hat:swap head
execute if score #head_ok hat matches 1 run loot replace entity @s weapon.mainhand 1 mine -30000000 0 1600 minecraft:stick{hat_drop_contents:1b}
replaceitem block -30000000 0 1600 container.0 minecraft:air

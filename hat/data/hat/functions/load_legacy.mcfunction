#-- 1.16.x only: replaceitem was removed in 1.17, so this file fails to load there
#-- Keep the swap shulker box chunk loaded (execute if block errors on unloaded chunks, so this cannot be done lazily in tick_legacy)
execute in minecraft:overworld run forceload add -30000000 1600
execute in minecraft:overworld run replaceitem block -30000000 0 1600 container.0 minecraft:air

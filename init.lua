local modpath = minetest.get_modpath("explodingchest")

exploding_chest = {}

dofile(modpath .. "/config.lua")
dofile(modpath .. "/trap.lua")
dofile(modpath .. "/overrides.lua")
dofile(modpath .. "/api.lua")

if minetest.settings:get_bool("log_mods") then
    minetest.log("action", "[ExplodingChest] Loaded.")
end

modpath = nil

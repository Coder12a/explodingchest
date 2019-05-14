ec_config = {}

ec_config.explosion_max = tonumber(minetest.settings:get("explodingchest.explosion_max")) or 11
ec_config.volatile_containers = minetest.settings:get_bool("explodingchest.volatile_containers") or true
ec_config.volatile_protected_containers = minetest.settings:get_bool("explodingchest.volatile_protected_containers") or false
ec_config.explosive_traps = minetest.settings:get_bool("explodingchest.explosive_traps") or true

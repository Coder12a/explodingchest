explodingchest_config = {}

explodingchest_config.explosion_max = tonumber(minetest.settings:get("explodingchest.explosion_max")) or 11
explodingchest_config.radius_comput = minetest.settings:get("explodingchest.radius_comput") or "reduce"
explodingchest_config.reduce = tonumber(minetest.settings:get("explodingchest.reduce")) or 288

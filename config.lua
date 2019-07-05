explodingchest_config = {}

explodingchest_config.explosion_max = tonumber(minetest.settings:get("explodingchest.explosion_max")) or 11
explodingchest_config.radius_comput = minetest.settings:get("explodingchest.radius_comput") or "reduce"
explodingchest_config.reduce = tonumber(minetest.settings:get("explodingchest.reduce")) or 288
explodingchest_config.blast_type = minetest.settings:get("explodingchest.blast_type") or "timer"
explodingchest_config.trap_blast_type = minetest.settings:get("explodingchest.trap_blast_type") or "instant"
explodingchest_config.timer = tonumber(minetest.settings:get("explodingchest.timer")) or 0

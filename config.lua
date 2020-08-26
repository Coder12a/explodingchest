exploding_chest.config = {}

exploding_chest.config.explosion_max = tonumber(minetest.settings:get("explodingchest.explosion_max")) or 11
exploding_chest.config.radius_comput = minetest.settings:get("explodingchest.radius_comput") or "reduce"
exploding_chest.config.reduce = tonumber(minetest.settings:get("explodingchest.reduce")) or 288
exploding_chest.config.blast_type = minetest.settings:get("explodingchest.blast_type") or "instant"
exploding_chest.config.trap_blast_type = minetest.settings:get("explodingchest.trap_blast_type") or "instant"
exploding_chest.config.timer = tonumber(minetest.settings:get("explodingchest.timer")) or 0

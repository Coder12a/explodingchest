local tnt_radius = tonumber(minetest.settings:get("tnt_radius") or 3)
register_explosive_material("tnt:gunpowder",0.6,{"tnt:gunpowder", "tnt:gunpowder", "tnt:gunpowder", "tnt:gunpowder", "tnt:gunpowder"})
register_explosive_material("tnt:tnt",tnt_radius,{"tnt:tnt"})
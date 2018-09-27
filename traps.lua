if ec_config.explosive_traps then
	local tnt_radius = tonumber(minetest.settings:get("tnt_radius") or 3)
	register_explosive_trap_container("default:chest",{name = "explodingchest:chest"},tnt_radius,true)
	register_explosive_trap_container("default:chest_locked",{name = "explodingchest:chest_locked"},tnt_radius,true)
	if minetest.get_modpath("xdecor") then
		register_explosive_trap_container("xdecor:cabinet",{name = "explodingchest:cabinet"},tnt_radius,true)
		register_explosive_trap_container("xdecor:cabinet_half",{name = "explodingchest:cabinet_half"},tnt_radius,true)
		register_explosive_trap_container("xdecor:empty_shelf",{name = "explodingchest:empty_shelf"},tnt_radius,true)
		register_explosive_trap_container("xdecor:multishelf",{name = "explodingchest:multishelf"},tnt_radius,true)
		register_explosive_trap_container("xdecor:mailbox",{name = "explodingchest:mailbox"},tnt_radius,true)
	end
	if minetest.get_modpath("darkage") then
		register_explosive_trap_container("darkage:box",{name = "explodingchest:box"},tnt_radius,true)
		register_explosive_trap_container("darkage:wood_shelves",{name = "explodingchest:wood_shelves"},tnt_radius,true)
	end
	if minetest.get_modpath("castle_storage") then
		register_explosive_trap_container("castle_storage:crate",{name = "explodingchest:crate"},tnt_radius,true)
		register_explosive_trap_container("castle_storage:ironbound_chest",{name = "explodingchest:ironbound_chest"},tnt_radius,true)
	end
	if minetest.get_modpath("inbox") then
		register_explosive_trap_container("inbox:empty",{name = "explodingchest:empty"},tnt_radius,true)
	end
	if minetest.get_modpath("technic_chests") then
		register_explosive_trap_container("technic:iron_chest",{name = "explodingchest:iron_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:copper_chest",{name = "explodingchest:copper_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:silver_chest",{name = "explodingchest:silver_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:gold_chest",{name = "explodingchest:gold_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:mithril_chest",{name = "explodingchest:mithril_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:iron_locked_chest",{name = "explodingchest:iron_locked_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:copper_locked_chest",{name = "explodingchest:copper_locked_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:silver_locked_chest",{name = "explodingchest:silver_locked_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:gold_locked_chest",{name = "explodingchest:gold_locked_chest"},tnt_radius,true)
		register_explosive_trap_container("technic:mithril_locked_chest",{name = "explodingchest:mithril_locked_chest"},tnt_radius,true)
	end
end
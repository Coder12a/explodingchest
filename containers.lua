if ec_config.volatile_containers then
	register_explosive_container("default:chest",{"main"})
	if ec_config.volatile_protected_containers then
		register_explosive_container("default:chest_locked",{"main"})
	end
	if minetest.get_modpath("xdecor") then
		register_explosive_container("xdecor:cabinet",{"main"})
		register_explosive_container("xdecor:cabinet_half",{"main"})
		register_explosive_container("xdecor:empty_shelf",{"main"})
		register_explosive_container("xdecor:multishelf",{"main"})
		register_explosive_container("xdecor:mailbox",{"drop","mailbox"})
	end
	if minetest.get_modpath("darkage") then
		register_explosive_container("darkage:box",{"main"})
		register_explosive_container("darkage:wood_shelves",{"up","down"})
	end
	if minetest.get_modpath("castle_storage") then
		register_explosive_container("castle_storage:crate",{"main"})
		register_explosive_container("castle_storage:ironbound_chest",{"main"})
	end
	if minetest.get_modpath("inbox") then
		register_explosive_container("inbox:empty",{"drop","mailbox"})
	end
	if minetest.get_modpath("technic_chests") then
		register_explosive_container("technic:iron_chest",{"main"})
		register_explosive_container("technic:copper_chest",{"main"})
		register_explosive_container("technic:silver_chest",{"main"})
		register_explosive_container("technic:gold_chest",{"main"})
		register_explosive_container("technic:mithril_chest",{"main"})
		if ec_config.volatile_protected_containers then
			register_explosive_container("technic:iron_locked_chest",{"main"})
			register_explosive_container("technic:copper_locked_chest",{"main"})
			register_explosive_container("technic:silver_locked_chest",{"main"})
			register_explosive_container("technic:gold_locked_chest",{"main"})
			register_explosive_container("technic:mithril_locked_chest",{"main"})
		end
	end
end
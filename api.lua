-- table to hold registered explosive materials.
local explosive_materials = {}
local inventories = {}

-- functions
drop_and_blowup = function(pos, removeifvolatile)
	local node = minetest.get_node_or_nil(pos)

	if node == nil then
		return
	end

	if inventories[node.name] == nil then
		minetest.after(math.random(0,4), drop_and_blowup, pos, removeifvolatile)
		return
	end

	local olddrops = {}
	local drops = {}
	local explodesize = 0
	local blowup = false
	local riv = false
	local found = false

	if removeifvolatile == false then
		riv = true
	end

	for q, r in pairs(inventories[node.name]) do
		default.get_inventory_drops(pos, r, olddrops)
			for k,v in pairs(olddrops) do
				found = false
				for l,j in pairs(explosive_materials) do
					if v.name == j.name then
					explodesize = explodesize + (j.value * v.count)
					found = true
					if ec_config.explosion_max > 0 and explodesize > ec_config.explosion_max then
						explodesize = ec_config.explosion_max
						found = false
					end
				end
			end
			if found == false then
				table.insert(drops, v)
			end
		end
	end

	if explodesize >= 1.0 then
		blowup = true
		riv = true
	end

	drops[#drops+1] = node.name
	if blowup == true then
		minetest.remove_node(pos)
		tnt.boom(pos, {radius = explodesize, damage_radius = explodesize * 2})
	end

	if riv == true then
		minetest.remove_node(pos)
	end

	return drops
end

register_explosive_material = function(name, value, trap)
	explosive_materials[#explosive_materials + 1] = {name = name, value = value, trap = trap}
end

register_explosive_container = function(name, inventory)
	inventories[name] = inventory
	local groups = minetest.registered_nodes[name].groups
	if not groups.flammable then
		groups.flammable = 3
	end
	if not groups.mesecon then
		groups.mesecon = 2
	end
	minetest.override_item(name, {
		on_blast = function(pos)
			return drop_and_blowup(pos, false)
		end,
		on_ignite = function(pos)
			drop_and_blowup(pos, true)
		end,
		mesecons = {effector =
			{action_on =
				function(pos)
					drop_and_blowup(pos, true)
				end
			}
		},
		on_burn = function(pos)
			drop_and_blowup(pos, false)
		end,
		groups = groups,
	})
end

local tnt_radius = tonumber(minetest.settings:get("tnt_radius") or 3)

register_explosive_trap_container = function(name, def, explosion_size, register_craft)
	local node = {}
	
	for k, v in pairs(minetest.registered_nodes[name]) do node[k] = v end

	node.description = node.description .. " (explosive)"

	node.on_rightclick = function(pos, node_arg, clicker)
		tnt.boom(pos, {radius = explosion_size, damage_radius = explosion_size * 2})
	end

	node.on_blast = function(pos)
		tnt.boom(pos, {radius = explosion_size, damage_radius = explosion_size * 2})
	end

	node.on_ignite = function(pos)
		tnt.boom(pos, {radius = explosion_size, damage_radius = explosion_size * 2})
	end

	node.mesecons = {effector =
		{action_on =
			function(pos)
				tnt.boom(pos, {radius = explosion_size, damage_radius = explosion_size * 2})
			end
		}
	}

	node.on_burn = function(pos)
		tnt.boom(pos, {radius = explosion_size, damage_radius = explosion_size * 2})
	end

	local groups = node.groups

	if not groups.flammable then
		groups.flammable = 3
	end

	if not groups.mesecon then
		groups.mesecon = 2
	end

	node.groups = groups

	minetest.register_node(def.name, node)

	register_explosive_material(def.name, explosion_size, nil)

	if register_craft then
		register_explosive_trap_craft(name, def.name)
	end
end

register_explosive_trap_craft = function(name1, name2)
	for k, v in pairs(explosive_materials) do
		recipe_table = {name1}
		if v.trap then
			for q, r in pairs(v.trap) do
				table.insert(recipe_table, r)
			end
			minetest.register_craft({
				output = name2,
				type = "shapeless",
				recipe = recipe_table
			})
		end
	end
end

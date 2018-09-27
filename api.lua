-- table to hold registered explosive materials.
local explosive_materials = {}
-- functions
drop_and_blowup = function(pos,removeifvolatile)
	local node = minetest.registered_nodes[minetest.get_node_or_nil(pos).name]
	local olddrops = {}
	local drops = {}
	local explodesize = 0
	local blowup = false
	local riv = false
	local found = false
	if removeifvolatile == false then
		riv = true
	end
	for q,r in pairs(node.inventories) do
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
				table.insert(drops,v)
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
			tnt.boom(pos, {radius = explodesize,damage_radius = explodesize * 2})
			else if riv == true then
			minetest.remove_node(pos)
			end
		end
	return drops
end
-- code snippet I found somewhere on the web.
clone_registered = function(case,name)
	local params = {}
	local list
	if case == "item" then list = minetest.registered_items end
	if case == "node" then list = minetest.registered_nodes end
	if case == "craftitem" then list = minetest.registered_craftitems end
	if case == "tool" then list = minetest.registered_tools end
	if case == "entity" then list = minetest.registered_entities end
	if list and list[name] then
		for k,v in pairs(list[name]) do
			params[k] = v
		end
	end
	return params
end
register_explosive_material = function(name,value,trap)
	table.insert(explosive_materials,{name = name,value = value,trap = trap})
end
register_explosive_container = function(name,inventory)
	local node = clone_registered("node",name)
	node.inventories = inventory
	node.on_blast = function(pos)
		return drop_and_blowup(pos,false)
	end
	node.on_ignite = function(pos)
		drop_and_blowup(pos,true)
	end
	node.mesecons = {effector =
		{action_on =
			function(pos)
				drop_and_blowup(pos,true)
			end
		}
	}
	node.on_burn = function(pos)
		drop_and_blowup(pos,false)
	end
	local groups = node.groups
	if not groups.flammable then
		groups.flammable = 3
	end
	if not groups.mesecon then
		groups.mesecon = 2
	end
	node.groups = groups
	minetest.register_node(":" .. name, node)
end
register_explosive_trap_container = function(name,def,explosion_size,register_craft)
	local old_node = minetest.registered_nodes[name]
	local node = {}
	node.name = def.name
	node.tiles = old_node.tiles
	node.description = old_node.description
	node.explosion_size = explosion_size
	node.visual = old_node.visual
	node.legacy_facedir_simple = old_node.legacy_facedir_simple
	node.is_ground_content = old_node.is_ground_content
	node.drawtype = old_node.drawtype
	node.paramtype = old_node.paramtype
	node.paramtype2 = old_node.paramtype2
	node.node_box = old_node.node_box
	node.selection_box = old_node.selection_box
	node.sounds = old_node.sounds
	node.after_place_node = old_node.after_place_node
	node.on_construct = old_node.on_construct
	node.on_rightclick = function(pos, node_arg, clicker)
		if minetest.get_node_or_nil(pos) then
			local node2 = minetest.registered_nodes[node_arg.name]
			local explodesize = node2.explosion_size
			minetest.remove_node(pos)
			tnt.boom(pos, {radius = explodesize,damage_radius = explodesize * 2})
		end
	end
	node.on_blast = function(pos)
		local n = minetest.get_node_or_nil(pos)
		if n then
			local node2 = minetest.registered_nodes[n.name]
			local explodesize = node2.explosion_size
			minetest.remove_node(pos)
			tnt.boom(pos, {radius = explodesize,damage_radius = explodesize * 2})
		end
	end
	node.on_ignite = function(pos)
		local n = minetest.get_node_or_nil(pos)
		if n then
			local node2 = minetest.registered_nodes[n.name]
			local explodesize = node2.explosion_size
			minetest.remove_node(pos)
			tnt.boom(pos, {radius = explodesize,damage_radius = explodesize * 2})
		end
	end
	node.mesecons = {effector =
		{action_on =
			function(pos)
				local n = minetest.get_node_or_nil(pos)
				if n then
					local node2 = minetest.registered_nodes[n.name]
					local explodesize = node2.explosion_size
					minetest.remove_node(pos)
					tnt.boom(pos, {radius = explodesize,damage_radius = explodesize * 2})
				end
			end
		}
	}
	node.on_burn = function(pos)
		drop_and_blowup(pos,false)
	end
	local groups = old_node.groups
	if not groups.flammable then
		groups.flammable = 3
	end
	if not groups.mesecon then
		groups.mesecon = 2
	end
	node.groups = groups
	minetest.register_node(def.name, node)
	register_explosive_material(def.name,explosion_size,nil)
	if register_craft then
		register_explosive_trap_craft(name,def.name)
	end
end
register_explosive_trap_craft = function(name1,name2)
	for k,v in pairs(explosive_materials) do
		recipe_table = {name1}
		if v.trap then
			for q,r in pairs(v.trap) do
				table.insert(recipe_table,r)
			end
			minetest.register_craft({
				output = name2,
				type = "shapeless",
				recipe = recipe_table
			})
		end
	end
end
ec_config = {}

ec_config.set = function(s,dv)
	if s then
		return s
	else
		return dv
	end
end

ec_config.explosion_max = ec_config.set(tonumber(minetest.setting_get("ec_config.ec_config.explosion_max")),11)
ec_config.volatile_containers = ec_config.set(minetest.setting_getbool("ec_config.volatile_containers"),true)
ec_config.volatile_protected_containers = ec_config.set(minetest.setting_getbool("ec_config.volatile_protected_containers"),false)
ec_config.explosive_traps = ec_config.set(minetest.setting_getbool("ec_config.explosive_traps"),true)
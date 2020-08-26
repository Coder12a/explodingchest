local override_default = minetest.settings:get_bool("explodingchest.override_default") or true

if override_default then
    minetest.register_on_mods_loaded(function()
        local tnt_radius = tonumber(minetest.settings:get("tnt_radius") or 3)
        
        for k, v in pairs(minetest.registered_nodes) do
            if k == "default:chest" or k == "default:chest_open" then
                local groups = v.groups

                groups.volatile = 1

                minetest.override_item(k, {
                    groups = groups
                })
            end

            if k == "tnt:tnt" then
                local groups = v.groups

                groups.explosive = tnt_radius

                minetest.override_item(k, {
                    groups = groups
                })
            end

            if k == "tnt:gunpowder" then
                local groups = v.groups

                groups.explosive = (tnt_radius / 9) / 6

                minetest.override_item(k, {
                    groups = groups
                })
            end
        end

        for k, v in pairs(minetest.registered_craftitems) do
            if k == "tnt:tnt_stick" then
                local groups = v.groups

                groups.explosive = tnt_radius / 9

                minetest.override_item(k, {
                    groups = groups
                })
            end
        end

        tnt_radius = nil
    end)
end

override_default = nil

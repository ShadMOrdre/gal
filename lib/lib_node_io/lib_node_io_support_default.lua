-- add support for default mod

if minetest.get_modpath("default") then
	print("[Node IO] Support for default mod enabled")

	-- chest
	gal.lib.node_io.init_main_inventory("default:chest", true)
	gal.lib.node_io.init_main_inventory("default:chest_open", true)
	-- locked chest
	gal.lib.node_io.init_main_inventory("default:chest_locked", false)
	gal.lib.node_io.init_main_inventory("default:chest_locked_open", false)

	-- furnace
	gal.lib.node_io.init_furnace("default:furnace")
	gal.lib.node_io.init_furnace("default:furnace_active")
end

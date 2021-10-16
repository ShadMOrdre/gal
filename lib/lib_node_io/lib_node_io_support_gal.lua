-- add support for default mod

if minetest.get_modpath("lib_chests") then
	print("[Node IO] Support for default mod enabled")

	-- chest
	gal.lib.node_io.init_main_inventory("lib_chests:chest", true)
	gal.lib.node_io.init_main_inventory("lib_chests:chest_open", true)
	-- locked chest
	gal.lib.node_io.init_main_inventory("lib_chests:chest_locked", false)
	gal.lib.node_io.init_main_inventory("lib_chests:chest_locked_open", false)

end


if minetest.get_modpath("lib_forge") then
	-- furnace
	gal.lib.node_io.init_furnace("lib_forge:furnace")
	gal.lib.node_io.init_furnace("lib_forge:furnace_active")
end

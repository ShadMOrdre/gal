
-------------------------------------------------------------
-- gal_geology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------


gal = {}
gal.name = "gal"
gal.ver_max = 0
gal.ver_min = 1
gal.ver_rev = 0
gal.ver_str = gal.ver_max .. "." .. gal.ver_min .. "." .. gal.ver_rev
gal.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, VannessaE, runs, and numerous others."
gal.license = "LGLv2.1"
gal.copyright = "2019"
gal.path_mod = minetest.get_modpath(minetest.get_current_modname())
gal.path_world = minetest.get_worldpath()
gal.path = gal.path_mod


-- Intllib
local S, NS = dofile(gal.path_mod.."/intllib.lua")
gal.intllib = S
--gal.intllib = minetest.get_translator("gal")

minetest.log(S("[MOD] gal:  Loading..."))
minetest.log(S("[MOD] gal:  Version:") .. S(gal.ver_str))
minetest.log(S("[MOD] gal:  Legal Info: Copyright ") .. S(gal.copyright) .. " " .. S(gal.authorship) .. "")
minetest.log(S("[MOD] gal:  License: ") .. S(gal.license) .. "")

--TODO:  Update calls to:     'minetest.setting_get'

	gal.lib = {}
	gal.mapgen = {}
	gal.liquids = {}

	gal.settings = {
		clear_biomes						= minetest.settings:get("gal.clear_biomes") == "true",
		clear_decos							= minetest.settings:get("gal.clear_decos") == "true",
		clear_ores							= minetest.settings:get("gal.clear_ores") == "false",
		color_grass_use						= minetest.settings:get("gal.color_grass_use") == "false",
		color_grass_reg						= minetest.settings:get("gal.color_grass_reg") == "true",
		mg_world_scale						= tonumber(minetest.settings:get("gal.mg_world_scale")) or 1,
		mg_base_height						= tonumber(minetest.settings:get("gal.mg_base_height")) or 300,
		enable_lib_shapes_support			= minetest.settings:get("gal.enable_lib_shapes_support") == "true",
		enable_mapgen_aliases				= minetest.settings:get("gal.enable_mapgen_aliases") == "false",
	}
--[[
		if minetest.setting_get("gal_geology_clear_biomes") and minetest.setting_get("gal_geology_clear_biomes") == "true" then
			gal.clear_biomes = true
		else
			gal.clear_biomes = false
		end
		if minetest.setting_get("gal_geology_clear_decos") and minetest.setting_get("gal_geology_clear_decos") == "true" then
			gal.clear_decos = true
		else
			gal.clear_decos = false
		end
		if minetest.setting_get("gal_geology_clear_ores") and minetest.setting_get("gal_geology_clear_ores") == "true" then
			gal.clear_ores = true
		else
			gal.clear_ores = false
		end
--]]

--[[
		--if minetest.setting_get("gal_geology_color_grass_reg") and minetest.setting_get("gal_geology_color_grass_reg") == "true" then
			--gal.color_grass_reg = true
		--else
		--	gal.color_grass_reg = false
		--end
		--if minetest.setting_get("gal_geology_color_grass_use") and minetest.setting_get("gal_geology_color_grass_use") == "true" then
		--	gal.color_grass_use = true
		--else
			--gal.color_grass_use = false
		--end
--]]

--[[
		--if minetest.setting_get("gal_geology_enable_lakes") and minetest.setting_get("gal_geology_enable_lakes") == "true"then
		--	gal.enable_lakes = true
		--else
		--	gal.enable_lakes = false
		--end
		--if minetest.setting_get("gal_geology_enable_rivers") and minetest.setting_get("gal_geology_enable_rivers") == "true"then
		--	gal.enable_rivers = true
		--else
		--	gal.enable_rivers = false
		--end
		--if minetest.setting_get("gal_geology_enable_waterdynamics") and minetest.setting_get("gal_geology_enable_waterdynamics") == "true"then
			--gal.enable_waterdynamics = true
		--else
			--gal.enable_waterdynamics = false
		--end
		--if minetest.setting_get("gal_geology_enable_waterfalls") and minetest.setting_get("gal_geology_enable_waterfalls") == "true"then
		--	gal.enable_waterfalls = true
		--else
		--	gal.enable_waterfalls = false
		--end
		--if minetest.setting_get("gal_geology_enable_lib_shapes_support") and minetest.setting_get("gal_geology_enable_lib_shapes_support") == "true"then
		--	gal.enable_lib_shapes = true
		--else
		--	gal.enable_lib_shapes = false
		--end
		--if minetest.setting_get("gal_geology_enable_mapgen_aliases") and minetest.setting_get("gal_geology_enable_mapgen_aliases") == "true"then
		--	gal.enable_mapgen_aliases = true
		--else
		--	gal.enable_mapgen_aliases = false
		--end

		--if gal.clear_biomes then
			minetest.clear_registered_biomes()
		--end
		--if gal.clear_decos then
			minetest.clear_registered_decorations()
		--end
		--if gal.clear_ores then
			--minetest.clear_registered_ores()
		--end
--]]

	minetest.clear_registered_biomes()
	minetest.clear_registered_decorations()
	--minetest.clear_registered_ores()

	gal.color_grass_reg = gal.settings.color_grass_reg
	gal.color_grass_use = gal.settings.color_grass_use
	gal.enable_lib_shapes = gal.settings.enable_lib_shapes_support
	--gal.enable_waterdynamics = true
	--gal.enable_mapgen_aliases = false
	gal.config = "default"	--default, gal_geology, mcl?
	gal.biome_data_file = "gal_geology_biomes"
	gal.ore_data_file = "gal_geology_ores"
	gal.ecosystem_data_file = "gal_geology_ecosystems"
	gal.nodes_data_file = "gal_geology_nodes"


	minetest.log(S("[MOD] gal:  TODO:  Update calls to:     'minetest.get_mapgen_params()'"))
	--gal.mg_params = minetest.get_mapgen_params()
	--gal.mg_seed = gal.mg_params.seed
	--minetest.set_mapgen_setting("seed", "16096304901732432682", true)
	gal.mg_seed = minetest.get_mapgen_setting("seed")
	minetest.set_mapgen_setting("mg_flags", "nocaves, nodungeons, light, decorations, biomes, ores", true)
	--if minetest.get_mapgen_setting("mg_name") == "v7" then
		--minetest.set_mapgen_setting("mgv7_spflags", "nomountains, noridges, nofloatlands, nocaverns", true)
	--end

--[[
		--gal.mapgen_scale_factor = minetest.setting_get("gal_geology_mgv7_mapgen_scale_factor") or 8
		--gal.biome_altitude_range = minetest.setting_get("gal_geology_biome_altitude_range") or 40				--10, 20, 30, 40
		-- gal.mapgen_scale_factor = 8
		-- gal.biome_altitude_range = 56				--10, 20, 30, 40

		--DEFAULTS
		-- -192, -4, 0, 4, 30, 60, 90, 120, 150, 285, 485, 1250
		-- -192, -4, 0, 4, 40, 80, 120, 160, 200, 380, 780, 1800
		-- gal.ocean_depth = -192
		-- gal.beach_depth = -4
		-- gal.maxheight_beach = 4
		-- gal.sea_level = 0
		-- gal.water_level = 1

		-- gal.maxheight_coastal = gal.sea_level + gal.biome_altitude_range
		-- gal.maxheight_lowland = gal.maxheight_coastal + gal.biome_altitude_range
		-- gal.maxheight_shelf = gal.maxheight_lowland + gal.biome_altitude_range
		-- gal.maxheight_highland = gal.maxheight_shelf + gal.biome_altitude_range
		-- gal.maxheight_mountain = gal.maxheight_highland + gal.biome_altitude_range
		-- gal.minheight_snow = gal.maxheight_mountain + gal.biome_altitude_range
		-- gal.maxheight_snow = gal.minheight_snow  + (gal.biome_altitude_range * 2)
		-- gal.maxheight_strato = gal.maxheight_mountain  + (gal.biome_altitude_range * (gal.mapgen_scale_factor / 2))

		-- -- 100, 75, 50, 25, 0
		-- -- 90, 75, 50, 25, 10
		-- -- 90, 70, 50, 30, 10
		-- gal.temperature_hot = 100
		-- gal.temperature_warm = 75
		-- gal.temperature_temperate = 50
		-- gal.temperature_cool = 25
		-- gal.temperature_cold = 0
		-- gal.humidity_humid = 100
		-- gal.humidity_semihumid = 75
		-- gal.humidity_temperate = 50
		-- gal.humidity_semiarid = 25
		-- gal.humidity_arid = 0

		-- 8, 4
		-- gal.biome_vertical_blend = gal.biome_altitude_range / 5
--]]


	minetest.log(S("[MOD] gal:  Loading..."))

	dofile(gal.path_mod .. "/gal_sound_defaults.lua")

	dofile(gal.path_mod .. "/gal_lib.lua")

	dofile(gal.path_mod .. "/gal_mapgen.lua")

	dofile(gal.path.."/gal_geology_node_registration.lua")

	dofile(gal.path.."/gal_geology_caves.lua")

	dofile(gal.path.."/gal_geology_liquid_containers.lua")

	dofile(gal.path.."/gal_geology_vessels.lua")

	dofile(gal.path.."/gal_geology_fire.lua")

	dofile(gal.path.."/gal_geology_craftitems.lua")

	dofile(gal.path.."/gal_geology_craftrecipes.lua")

		--dofile(gal.path.."/gal_geology_schematics.lua")

	dofile(gal.path.."/gal_geology_biomes.lua")

	dofile(gal.path.."/gal_geology_ores.lua")

	dofile(gal.path.."/gal_geology_ecosystems.lua")

	dofile(gal.path.."/gal_geology_decorations.lua")

	dofile(gal.path.."/gal_geology_abms.lua")

	dofile(gal.path.."/gal_geology_chatcommands.lua")

	dofile(gal.path.."/gal_geology_water_dynamics.lua")


--Plants

	dofile(gal.path.."/gal_ecology_plants_node_registration.lua")

	dofile(gal.path.."/gal_ecology_plants_mushrooms.lua")


	gal.N = {}
	gal.schem = dofile(gal.path.."/gal_ecology_trees_schem.lua")
	dofile(gal.path.."/gal_ecology_trees_schematic.lua")

--Trees
	dofile(gal.path.."/gal_ecology_trees_utils.lua")

	dofile(gal.path.."/gal_ecology_trees_node_registration.lua")

	dofile(gal.path.."/gal_ecology_trees_schematics.lua")

	dofile(gal.path .. "/gal_ecology_trees_craftitems.lua")

	dofile(gal.path .. "/gal_ecology_trees_craftrecipes.lua")

	dofile(gal.path.."/gal_ecology_trees_deco_registration.lua")


	gal.mapgen.c_air				= minetest.get_content_id("air")
	gal.mapgen.c_ignore				= minetest.get_content_id("ignore")
	
	gal.mapgen.c_top				= minetest.get_content_id("gal:dirt_with_grass")
	gal.mapgen.c_filler				= minetest.get_content_id("gal:dirt")
	gal.mapgen.c_stone				= minetest.get_content_id("gal:stone")
	gal.mapgen.c_water				= minetest.get_content_id("gal:liquid_water_source")
	gal.mapgen.c_river				= minetest.get_content_id("gal:liquid_water_river_source")
	gal.mapgen.c_gravel				= minetest.get_content_id("gal:stone_gravel")
	
	gal.mapgen.c_lava				= minetest.get_content_id("gal:liquid_lava_source")
	gal.mapgen.c_ice				= minetest.get_content_id("gal:ice")
	gal.mapgen.c_mud				= minetest.get_content_id("gal:dirt_mud_01")
	
	gal.mapgen.c_cobble				= minetest.get_content_id("gal:stone_cobble")
	gal.mapgen.c_mossy				= minetest.get_content_id("gal:stone_cobble_mossy")
	gal.mapgen.c_block				= minetest.get_content_id("gal:stone_block")
	gal.mapgen.c_brick				= minetest.get_content_id("gal:stone_brick")
	gal.mapgen.c_sand				= minetest.get_content_id("gal:sand")
	gal.mapgen.c_dirt				= minetest.get_content_id("gal:dirt")
	gal.mapgen.c_dirtperm				= minetest.get_content_id("gal:dirt_permafrost")
	gal.mapgen.c_dirtgrass				= minetest.get_content_id("gal:dirt_with_grass")

	--gal.mapgen.update_biome_data()

	gal.mapgen.m_air				= "air"
	gal.mapgen.m_ignore				= "ignore"
	
	gal.mapgen.m_top				= "gal:dirt_with_grass"
	gal.mapgen.m_filler				= "gal:dirt"
	gal.mapgen.m_stone				= "gal:stone"
	gal.mapgen.m_watertop			= "gal:liquid_water_source"
	gal.mapgen.m_water				= "gal:liquid_water_source"
	gal.mapgen.m_river				= "gal:liquid_water_river_source"
	gal.mapgen.m_bed				= "gal:stone_gravel"
	gal.mapgen.m_caveliquid			= "gal:liquid_water_river_source"
	gal.mapgen.m_dungeon			= "gal:stone_cobble"
	gal.mapgen.m_dungeonalt			= "gal:stone_cobble_mossy"
	gal.mapgen.m_dungeonstair		= "gal:stone_brick"
	gal.mapgen.m_dust				= "air"
	
	gal.mapgen.m_stone				= "gal:stone"
	gal.mapgen.m_dirt				= "gal:dirt"
	gal.mapgen.m_grass				= "gal:dirt_with_grass"
	gal.mapgen.m_water				= "gal:liquid_water_source"
	gal.mapgen.m_lava				= "gal:liquid_lava_source"
	gal.mapgen.m_ice				= "gal:ice"
	gal.mapgen.m_mud				= "gal:dirt_mud_01"
	gal.mapgen.m_gravel				= "gal:stone_gravel"
	
	gal.mapgen.m_cobble				= "gal:stone_cobble"
	gal.mapgen.m_mossy				= "gal:stone_cobble_mossy"
	gal.mapgen.m_block				= "gal:stone_block"
	gal.mapgen.m_brick				= "gal:stone_brick"
	gal.mapgen.m_sand				= "gal:sand"
	gal.mapgen.m_dirt				= "gal:dirt"
	gal.mapgen.m_dirtperm			= "gal:dirt_permafrost"
	gal.mapgen.m_dirtgrass			= "gal:dirt_with_grass"


	minetest.register_alias("mapgen_stone", "gal:stone")
	minetest.register_alias("mapgen_water_source", "gal:liquid_water_source")
	minetest.register_alias("mapgen_river_water_source", "gal:liquid_water_river_source")


minetest.log(S("[MOD] gal:  Successfully loaded."))






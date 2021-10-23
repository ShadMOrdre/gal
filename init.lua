
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


	gal.lib = {}
	gal.mapgen = {}
	gal.liquids = {}

	gal.settings = {
		clear_biomes						= minetest.settings:get_bool("gal.clear_biomes") or true,
		clear_decos							= minetest.settings:get_bool("gal.clear_decos") or true,
		clear_ores							= minetest.settings:get_bool("gal.clear_ores") or false,
		color_grass_use						= minetest.settings:get_bool("gal.color_grass_use") or false,
		color_grass_reg						= minetest.settings:get_bool("gal.color_grass_reg") or true,
		mg_world_scale						= tonumber(minetest.settings:get("gal.mg_world_scale")) or 1,
		mg_base_height						= tonumber(minetest.settings:get("gal.mg_base_height")) or 300,
		enable_lib_shapes_support			= minetest.settings:get_bool("gal.enable_lib_shapes_support") or true,
		enable_mapgen_aliases				= minetest.settings:get_bool("gal.enable_mapgen_aliases") or false,
	}

	if gal.settings.clear_biomes then
		minetest.clear_registered_biomes()
	end
	if gal.settings.clear_decos then
		minetest.clear_registered_decorations()
	end
	if gal.settings.clear_ores then
		minetest.clear_registered_ores()
	end
	

	gal.color_grass_reg = gal.settings.color_grass_reg
	gal.color_grass_use = gal.settings.color_grass_use
	gal.enable_lib_shapes = gal.settings.enable_lib_shapes_support
	--gal.enable_waterdynamics = true
	gal.enable_mapgen_aliases = gal.settings.enable_mapgen_aliases
	gal.config = "default"	--default, gal_geology, mcl?
	gal.biome_data_file = "gal_geology_biomes"
	gal.ore_data_file = "gal_geology_ores"
	gal.ecosystem_data_file = "gal_geology_ecosystems"
	gal.nodes_data_file = "gal_geology_nodes"


	--minetest.set_mapgen_setting("seed", "16096304901732432682", true)
	gal.mg_seed = minetest.get_mapgen_setting("seed")
	minetest.set_mapgen_setting("mg_flags", "nocaves, nodungeons, light, decorations, biomes, ores", true)
	--if minetest.get_mapgen_setting("mg_name") == "v7" then
		--minetest.set_mapgen_setting("mgv7_spflags", "nomountains, noridges, nofloatlands, nocaverns", true)
	--end



	minetest.log(S("[MOD] gal:  Config complete..."))

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

--Trees

	gal.N = {}
	gal.schem = dofile(gal.path.."/gal_ecology_trees_schem.lua")
	dofile(gal.path.."/gal_ecology_trees_schematic.lua")

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


	if gal.enable_mapgen_aliases then
		minetest.register_alias("mapgen_stone", "gal:stone")
		minetest.register_alias("mapgen_water_source", "gal:liquid_water_source")
		minetest.register_alias("mapgen_river_water_source", "gal:liquid_water_river_source")
	end

minetest.log(S("[MOD] gal:  Successfully loaded."))






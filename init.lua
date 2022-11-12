
-------------------------------------------------------------
-- gal_geology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------


gal = {}
gal.name = "gal"
gal.ver_max = 0
gal.ver_min = 1
gal.ver_rev = 0
gal.ver_str = gal.ver_max .. "." .. gal.ver_min .. "." .. gal.ver_rev
gal.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, Duane, VannessaE, demonboy, Dokimi, StarNinjas, runs, and numerous others."
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

	gal.settings = {
		mg_world_scale						= tonumber(minetest.settings:get("gal.mg_world_scale")) or 1.0,
		mg_base_height						= tonumber(minetest.settings:get("gal.mg_base_height")) or 300,
		clear_biomes						= minetest.settings:get_bool("gal.clear_biomes") or false,
		clear_decos							= minetest.settings:get_bool("gal.clear_decos") or false,
		clear_ores							= minetest.settings:get_bool("gal.clear_ores") or false,
		enable_biomes						= minetest.settings:get_bool("gal.enable_biomes") or true,
		enable_decos						= minetest.settings:get_bool("gal.enable_decos") or true,
		enable_ores							= minetest.settings:get_bool("gal.enable_ores") or true,
		enable_ecosystems					= minetest.settings:get_bool("gal.enable_ecosystems") or true,
		enable_lib_shapes_support			= minetest.settings:get_bool("gal.enable_lib_shapes_support") or true,
		enable_mapgen_aliases				= minetest.settings:get_bool("gal.enable_mapgen_aliases") or true,
		enable_node_aliases					= minetest.settings:get_bool("gal.enable_node_aliases") or false,
		color_grass_use						= minetest.settings:get_bool("gal.color_grass_use") or false,
		color_grass_reg						= minetest.settings:get_bool("gal.color_grass_reg") or true,
	}

	if gal.settings.clear_biomes == true then
		minetest.clear_registered_biomes()
	end
	if gal.settings.clear_decos == true then
		minetest.clear_registered_decorations()
	end
	if gal.settings.clear_ores == true then
		minetest.clear_registered_ores()
	end
	
	gal.config = {}
	gal.lib = {}
	gal.mapgen = {}
	gal.liquids = {}


	gal.enable_lib_shapes = gal.settings.enable_lib_shapes_support
	--gal.enable_waterdynamics = true
	gal.enable_mapgen_aliases = gal.settings.enable_mapgen_aliases
	gal.config.enable_node_aliases = gal.settings.enable_node_aliases

	-- gal.config = "default"	--default, gal_geology, mcl?

	gal.color_grass_reg = gal.settings.color_grass_reg
	gal.color_grass_use = gal.settings.color_grass_use

	gal.biome_data_file = "gal_geology_biomes"
	gal.ore_data_file = "gal_geology_ores"
	-- gal.ecosystem_data_file = "gal_geology_ecosystems"
	gal.ecosystem_data_file = "gal_ecosystems_new"
	gal.nodes_data_file = "gal_geology_nodes"

	gal.ecosystem_base = "gal"

	gal.mg_earth					= minetest.global_exists("mg_earth")
	gal.mg_mapgen_rivers			= minetest.global_exists("mg_mapgen_rivers")

	if minetest.global_exists("default") == true then
		minetest.override_item("default:leaves", {
			drawtype = "allfaces_optional",
			walkable = false,
		})
		minetest.override_item("default:jungleleaves", {
			drawtype = "allfaces_optional",
			walkable = false,
		})
		minetest.override_item("default:pine_needles", {
			drawtype = "allfaces_optional",
			walkable = false,
		})
		minetest.override_item("default:acacia_leaves", {
			drawtype = "allfaces_optional",
			walkable = false,
		})
		minetest.override_item("default:aspen_leaves", {
			drawtype = "allfaces_optional",
			walkable = false,
		})

		if minetest.get_mapgen_setting("mg_name") == "singlenode" then
			if gal.mg_earth == true then
				if gal.settings.enable_biomes == true then
					gal.ecosystem_base = "gal"
				else
					gal.ecosystem_base = "default"
				end
			else
				gal.ecosystem_base = "default"
			end
		else
			gal.ecosystem_base = "default"
		end
	end


	if gal.settings.enable_biomes == true then
		gal.config.enable_biomes = true

		if gal.settings.enable_ores == true then
			gal.config.enable_ores = true
		end

		if gal.settings.enable_ecosystems == true then
			gal.config.enable_ecosystems = true
		end

		if gal.settings.enable_decos == true then
			gal.config.enable_decos = true
		end

	else

		gal.config.enable_biomes = false
		gal.config.enable_ores = false
		gal.config.enable_ecosystems = false
		gal.config.enable_decos = false

	end



	--minetest.set_mapgen_setting("seed", "16096304901732432682", true)
	-- gal.mg_seed = minetest.get_mapgen_setting("seed")
	-- minetest.set_mapgen_setting("mg_flags", "nocaves, nodungeons, light, decorations, biomes, ores", true)
	--if minetest.get_mapgen_setting("mg_name") == "v7" then
		--minetest.set_mapgen_setting("mgv7_spflags", "nomountains, noridges, nofloatlands, nocaverns", true)
	--end

	gal.gui = {}  --controls basic gui formspec and background images
	dofile(gal.path_mod .. "/gui_init.lua")
	-- gal.player = {}  --controls all aspects of player.  Sets the definition of and controls attributes of(avatar and game stats)
	-- gal.player.api = player_api
	-- gal.sfinv = {}  --container for sfinv and smart_sfinv and other inventory control mods
	-- gal.sfinv = sfinv

	minetest.log(S("[MOD] gal:  Config complete..."))

	dofile(gal.path_mod .. "/gal_sound_defaults.lua")

	dofile(gal.path_mod .. "/gal_lib.lua")

	dofile(gal.path.."/gal_geology_node_registration.lua")

	dofile(gal.path.."/gal_geology_caves.lua")

	dofile(gal.path.."/gal_geology_liquid_containers.lua")

	dofile(gal.path.."/gal_geology_vessels.lua")

	dofile(gal.path.."/gal_geology_fire.lua")

	dofile(gal.path_mod .. "/gal_mapgen.lua")

	dofile(gal.path.."/gal_geology_craftitems.lua")

	dofile(gal.path.."/gal_geology_craftrecipes.lua")

		--dofile(gal.path.."/gal_geology_schematics.lua")

	if gal.config.enable_biomes == true then
		dofile(gal.path.."/gal_geology_biomes.lua")
	end

	if gal.config.enable_ores == true then
		dofile(gal.path.."/gal_geology_ores.lua")
	end

	if gal.config.enable_ecosystems == true then
		dofile(gal.path.."/gal_geology_ecosystems.lua")
	end

	if gal.config.enable_decos == true then
		dofile(gal.path.."/gal_geology_decorations.lua")
	end

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

	if gal.config.enable_decos == true then
		dofile(gal.path.."/gal_ecology_trees_deco_registration.lua")
	end


	if minetest.get_mapgen_setting("mg_name") ~= "singlenode" then
		dofile(gal.path.."/gal_voxel.lua")
	end



	if gal.enable_mapgen_aliases == true then
		minetest.register_alias_force("mapgen_stone", "gal:stone")
		minetest.register_alias_force("mapgen_water_source", "gal:liquid_water_source")
		minetest.register_alias_force("mapgen_river_water_source", "gal:liquid_water_river_source")

		-- minetest.register_alias_force("default:stone", "gal:stone")
		-- minetest.register_alias_force("default:dirt", "gal:dirt")
		-- minetest.register_alias_force("default:dirt_with_grass", "gal:dirt_with_grass" )

		-- minetest.register_alias_force("default:leaves", "gal:tree_default_leaves")
		-- minetest.register_alias_force("default:tree", "gal:tree_default_trunk")
		-- minetest.register_alias_force("default:wood", "gal:tree_default_wood")

		-- minetest.register_alias_force("default:jungleleaves", "gal:tree_jungle_leaves")
		-- minetest.register_alias_force("default:jungletree", "gal:tree_jungle_tree")
		-- minetest.register_alias_force("default:junglewood", "gal:tree_jungle_wood")

		-- minetest.register_alias_force("default:water_source", "gal:liquid_water_source")
		-- minetest.register_alias_force("default:river_water_source", "gal:liquid_water_river_source")
	end

minetest.log(S("[MOD] gal:  Successfully loaded."))






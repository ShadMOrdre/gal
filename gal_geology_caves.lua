

-- What's a cave without speleothems?
local spel = {
	{type1="stalactite", type2="stalagmite", tile="lib_materials_stone_default.png"},
	{type1="stalactite_slimy", type2="stalagmite_slimy", tile="lib_materials_stone_default.png^valc_algae.png"},
	{type1="stalactite_mossy", type2="stalagmite_mossy", tile="lib_materials_stone_default.png^valc_moss.png"},
	{type1="icicle_down", type2="icicle_up", desc="Icicle", tile="lib_materials_ice2.png", drop="lib_materials:ice_2"},
}

for _, desc in pairs(spel) do
	--minetest.register_node("lib_materials:"..desc.type1, {
	gal.lib.node.register_to_game(""..desc.type1.."", {
		description = (desc.desc or "Stalactite"),
		tiles = {desc.tile},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		--light_source = 14,
		drop = (desc.drop or "lib_materials:stalactite"),
		drawtype = "nodebox",
		node_box = { type = "fixed", 
			fixed = {
				{-0.07, 0.0, -0.07, 0.07, 0.5, 0.07}, 
				{-0.04, -0.25, -0.04, 0.04, 0.0, 0.04}, 
				{-0.02, -0.5, -0.02, 0.02, 0.25, 0.02}, 
			} },
		groups = {rock=1, cracky=3},
		sounds = gal.node_sound_stone_defaults(),
	})

	--minetest.register_node("lib_materials:"..desc.type2, {
	gal.lib.node.register_to_game(""..desc.type2.."", {
		description = (desc.desc or "Stalagmite"),
		tiles = {desc.tile},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		--light_source = 14,
		drop = "lib_materials:stalagmite",
		drawtype = "nodebox",
		node_box = { type = "fixed", 
			fixed = {
				{-0.07, -0.5, -0.07, 0.07, 0.0, 0.07}, 
				{-0.04, 0.0, -0.04, 0.04, 0.25, 0.04}, 
				{-0.02, 0.25, -0.02, 0.02, 0.5, 0.02}, 
			} },
		groups = {rock=1, cracky=3},
		sounds = gal.node_sound_stone_defaults(),
	})
end


local function register_speleotherms()
	local materials = {"stone,0.008","stone_with_algae,0.006","stone_with_lichen,0.006","stone_with_moss,0.006","stone_with_salt,0.004","ice_thin,0.003","mineral_amethyst_crystal,0.001",
				"mineral_emerald_crystal,0.001","mineral_mese_crystal,0.001","mineral_ruby_crystal,0.001","mineral_salt_crystal,0.002","mineral_saphire_crystal,0.001",}
	--local __ = {name = "air", param2 = 0, prob = 0},

	for m, material in pairs(materials) do
	
		local mat,fill = unpack(material:split(",",true))
	
		local schem_stalagmite_small = {
			size = {x = 1, y = 2, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254}
			},
		}
		local schem_stalagmite_medium = {
			size = {x = 1, y = 3, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."_pillar_with_wall_thick", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254}
			},
		}
		local schem_stalagmite_large = {
			size = {x = 1, y = 4, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall_thick", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254}
			},
		}
		local schem_stalactite_small = {
			size = {x = 1, y = 2, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254}
			},
		}
		local schem_stalactite_medium = {
			size = {x = 1, y = 3, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall_thick", param2 = 0, prob = 254}
			},
		}
		local schem_stalactite_large = {
			size = {x = 1, y = 4, z = 1},
			--size = {x = 1, y = 2, z = 1},
			data = {
				{name = "gal:"..mat.."_pane_pillar", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall", param2 = 0, prob = 254},
				{name = "gal:"..mat.."_pillar_with_wall_thick", param2 = 0, prob = 254},
				{name = "gal:"..mat.."", param2 = 0, prob = 254}
			},
		}
		minetest.register_decoration({
			name = "gal:"..mat.."_stalagmite_small",
			deco_type = "schematic",
			schematic = schem_stalagmite_small,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_floors",
			rotation = "random",
		})
		minetest.register_decoration({
			name = "gal:"..mat.."_stalagmite_medium",
			deco_type = "schematic",
			schematic = schem_stalagmite_medium,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_floors",
			rotation = "random",
		})
		minetest.register_decoration({
			name = "gal:"..mat.."_stalagmite_large",
			deco_type = "schematic",
			schematic = schem_stalagmite_large,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_floors",
			rotation = "random",
		})
		minetest.register_decoration({
			name = "gal:"..mat.."_stalactite_small",
			deco_type = "schematic",
			schematic = schem_stalactite_small,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_ceilings",
			rotation = "random",
		})
		minetest.register_decoration({
			name = "gal:"..mat.."_stalactite_medium",
			deco_type = "schematic",
			schematic = schem_stalactite_medium,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_ceilings",
			rotation = "random",
		})
		minetest.register_decoration({
			name = "gal:"..mat.."_stalactite_large",
			deco_type = "schematic",
			schematic = schem_stalactite_large,
			sidelen = 80,
			place_on = {"group:stone"},
			place_offset_y = 1,
			fill_ratio = tonumber(fill),
			y_min = -31000,
			y_max = -50 * gal.settings.mg_world_scale,
			flags = "all_ceilings",
			rotation = "random",
		})
	end
end
register_speleotherms()


-- minetest.register_decoration({
	-- name = "gal:speleotherms",
	-- deco_type = "simple",
	-- decoration = {"gal:stalactite","gal:stalactite_slimy","gal:stalactite_mossy","gal:icicle_down","gal:stalagmite","gal:stalagmite_slimy","gal:stalagmite_mossy","gal:icicle_up",},
	-- sidelen = 80,
	-- place_on = {"group:stone"},
	-- fill_ratio = 0.008,
	-- y_min = -31000,
	-- y_max = 25,
	-- flags = "place_center_x, place_center_z, all_floors, all_ceilings",
	-- rotation = "random",
-- })
minetest.register_decoration({
	name = "gal:speleotherm_stalagmites",
	deco_type = "simple",
	decoration = {"gal:stalagmite","gal:stalagmite_slimy","gal:stalagmite_mossy","gal:icicle_up",},
	sidelen = 80,
	place_on = {"group:stone"},
	fill_ratio = 0.008,
	y_min = -31000,
	y_max = -50,
	flags = "place_center_x, place_center_z, all_floors",
	rotation = "random",
})
minetest.register_decoration({
	name = "gal:speleotherm_stalactites",
	deco_type = "simple",
	decoration = {"gal:stalactite","gal:stalactite_slimy","gal:stalactite_mossy","gal:icicle_down",},
	sidelen = 80,
	place_on = {"group:stone"},
	fill_ratio = 0.008,
	y_min = -31000,
	y_max = -50,
	flags = "place_center_x, place_center_z, all_ceilings",
	rotation = "random",
})
-- minetest.register_decoration({
	-- name = "gal:speleotherms_slimy",
	-- deco_type = "simple",
	-- decoration = {"gal:stalactite_slimy","gal:stalagmite_slimy",},
	-- sidelen = 80,
	-- place_on = {"group:stone"},
	-- fill_ratio = 0.008,
	-- y_min = -31000,
	-- y_max = 25,
	-- flags = "place_center_x, place_center_z, all_floors, all_ceilings",
	-- rotation = "random",
-- })
-- minetest.register_decoration({
	-- name = "gal:speleotherms_icy",
	-- deco_type = "simple",
	-- decoration = {"gal:icicle_down","gal:icicle_up",},
	-- sidelen = 80,
	-- place_on = {"group:stone"},
	-- fill_ratio = 0.008,
	-- y_min = -31000,
	-- y_max = 25,
	-- flags = "place_center_x, place_center_z, all_floors, all_ceilings",
	-- rotation = "random",
-- })







-- They can be made into cobblestone, to get them out of inventory.
minetest.register_craft({
	output = "gal:stone_cobble",
	recipe = {
		{"", "", ""},
		{"gal:stalactite", "gal:stalactite", ""},
		{"gal:stalactite", "gal:stalactite", ""},
	},
})

minetest.register_craft({
	output = "lib_materials:stone_cobble",
	recipe = {
		{"", "", ""},
		{"gal:stalagmite", "gal:stalagmite", ""},
		{"gal:stalagmite", "gal:stalagmite", ""},
	},
})

--[[
minetest.register_node("lib_materials:stone_with_moss", {
	description = "Cave Stone with Moss",
	tiles = {"lib_materials_stone_default.png^valc_moss.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = lib_materials.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_materials:stone_with_lichen", {
	description = "Cave Stone with Lichen",
	tiles = {"lib_materials_stone_default.png^valc_lichen.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = lib_materials.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_materials:stone_with_algae", {
	description = "Cave Stone with Algae",
	tiles = {"lib_materials_stone_default.png^valc_algae.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = lib_materials.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_materials:stone_with_salt", {
	description = "Cave Stone with Salt",
	tiles = {"lib_materials_mineral_salt_block.png"},--{"caverealms_salty2.png^caverealms_salty.png", "caverealms_salty2.png", "caverealms_salty2.png^caverealms_salty_side.png"},
	light_source = 9,
	paramtype = "light",
	use_texture_alpha = true,
	drawtype = "glasslike",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {stone=1, crumbly=3},
	sounds = lib_materials.node_sound_glass_defaults(),
})


-- --Glow Obsidian
 minetest.register_node("lib_materials:glow_obsidian", {
	 description = "Glowing Obsidian",
	 tiles = {"caverealms_glow_obsidian.png"},
	 is_ground_content = true,
	 groups = {stone=2, crumbly=1},
	 light_source = 7,
	 sounds = lib_materials.node_sound_stone_defaults({
		 footstep = {name="default_stone_footstep", gain=0.25},
	 }),
 })

-- --Glow Obsidian 2 - has traces of lava
 minetest.register_node("lib_materials:glow_obsidian_2", {
	 description = "Hot Glow Obsidian",
	 tiles = {"caverealms_glow_obsidian2.png"},
	 is_ground_content = true,
	 groups = {stone=2, crumbly=1, hot=1},
	 damage_per_second = 1,
	 light_source = 9,
	 sounds = lib_materials.node_sound_stone_defaults({
		 footstep = {name="default_stone_footstep", gain=0.25},
	 }),
 })
--]]

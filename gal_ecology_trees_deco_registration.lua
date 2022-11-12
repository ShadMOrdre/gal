--
-- Register lib_ecology nodes
--
--
--
-- Define constants that can be used in csv

-- Define constants that can be used in csv
local heights = {
	ocean_depth = gal.mapgen.ocean_depth,
	beach_depth = gal.mapgen.beach_depth,
	sea_level = gal.mapgen.sea_level,
	beach = gal.mapgen.maxheight_beach,
	coastal = gal.mapgen.maxheight_coastal,
	lowland = gal.mapgen.maxheight_lowland,
	shelf = gal.mapgen.maxheight_shelf,
	highland = gal.mapgen.maxheight_highland,
	mountain = gal.mapgen.maxheight_mountain,
	snow_min = gal.mapgen.minheight_snow,
	snow_max = gal.mapgen.maxheight_snow,
	--strato = gal.maxheight_strato,
	strato = 31000,
}

local temperatures = {
	hot = gal.mapgen.temperature_hot,
	warm = gal.mapgen.temperature_warm,
	temperate = gal.mapgen.temperature_temperate,
	cool = gal.mapgen.temperature_cool,
	cold = gal.mapgen.temperature_cold,
}

local humidities = {
	humid = gal.mapgen.humidity_humid,
	semihumid = gal.mapgen.humidity_semihumid,
	temperate = gal.mapgen.humidity_temperate,
	semiarid = gal.mapgen.humidity_semiarid,
	arid = gal.mapgen.humidity_arid,
}

--[[local add_schem = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schematics.select(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "random",
	})
end
--]]
--[[local new_add_schem = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schem(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "random",
	})
end
--]]
--[[local add_tree = function(a, b, c, d, e, f, g)

	for t_idx,tree in pairs(f:split(";", true)) do

		local t_tree = ""
		local t_replace
		local t_name = ""

		if string.find(tree, "-") then
			t_tree, t_replace = unpack(tree:split("-", true))
		else
			t_tree = tree
		end

		--if string.find(t_tree, "bamboo_small") or string.find(t_tree, "banana") or string.find(t_tree, "banksia_coast") or string.find(t_tree, "brazilnut") or string.find(t_tree, "cherry")
		--	 or string.find(t_tree, "cocoa") or string.find(t_tree, "fern_small") or string.find(t_tree, "mangrove_palm") or string.find(t_tree, "mossy") or string.find(t_tree, "petrified") then
		--	t_name = "gal:" .. t_tree .. ""
		--else
		--	t_name = "gal:" .. t_tree .. "_tree"
		--end

		minetest.register_decoration({
			--name = t_name,
			deco_type = "schematic",
			place_on = {a,},
			sidelen = 16,
			fill_ratio = tonumber(b),
			biomes = {c,},
			y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
			y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
			schematic = gal.schem(t_tree, t_replace),
			flags = g or "place_center_x, place_center_z, force_placement",
			rotation = "random",
		})

	end
end
--]]
--[[local add_shroom = function(a, b, c, d, e, f, g)

	for t_idx,tree in pairs(f:split(";", true)) do

		local t_tree
		local t_replace

		if string.find(tree, "-") then
			t_tree, t_replace = unpack(tree:split("-", true))
		else
			t_tree = tree
		end

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = a,
			sidelen = 16,
			fill_ratio = tonumber(b),
			biomes = c,
			y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
			y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
			schematic = gal.schem(t_tree, t_replace),
			flags = g or "place_center_x, place_center_z, force_placement",
			rotation = "random",
		})

	end
end
--]]
--[[local add_plant = function(a, b, c, d, e, f, g, h, i)

	local decos = {}
	local dname = ""

	if string.find(f, ";") then
		for p_idx,plant in pairs(f:split(";", true)) do
			decos[p_idx] = "gal:" .. plant .. ""
			dname = "" .. plant .. ""

		end
	else
		decos = {"gal:" .. f .. ""}
		dname = "gal:" .. f .. ""
	end

	--minetest.log("[MOD] gal:  PLACE_ON: " .. a .. ";     DECO: " .. f .. ";")

	minetest.register_decoration({
		--name = dname,
		deco_type = "simple",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
		--decoration = f,
		decoration = decos,						--f:split(";", true),
		height_max = tonumber(g),
		spawn_by = h,
		num_spawn_by = tonumber(i),
	})
end
--]]
--[[local add_schem_no_rot = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schematics.select(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "0",
	})
end
--]]
--[[local add_schem_water = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or heights[d],
		y_max = tonumber(e) or heights[e],
		schematic = gal.schematics.select(f),
		flags = g or "place_center_x, place_center_z, force_placement",
		rotation = "0",
	})
end
--]]
--[[local add_node = function(a, b, c, d, e, f, g, h, i)

	minetest.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + gal.mapgen.biome_vertical_blend),
		decoration = f,
		height_max = tonumber(g),
		spawn_by = h,
		num_spawn_by = tonumber(i),
	})
end
--]]
--[[local add_water_node = function(a, b, c, d, e, f, g, h, i)

	local t_biomes
	local t_decoration

	if string.find(c, ",") then
		t_biomes = c:split(",", true)
	else
		t_biomes = c
	end

	if string.find(f, ",") then
		t_decoration = f:split(",", true)
	else
		t_decoration = f
	end

	minetest.register_decoration({
		name = "gal:" .. tostring(f) .. "_waterplant",
		deco_type = "simple",
		place_on = a,
		place_offset_y = -1,
		sidelen = 4,
		--fill_ratio = tonumber(b),
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = t_biomes,
		y_min = tonumber(d) or heights[d],
		y_max = tonumber(e) or heights[e],
		flags = "force_placement",
		decoration = "gal:" .. tostring(f) .. "",
		param2 = 48,
		param2_max = 96,
	})
end
--]]

--TREES
--

local deco_tree = function(tname,tbiomes,tsoils,tgrasses,tdensitys,tymins,tymaxs)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. "_pale"
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. "_pale"
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi]
			elseif tgrasses[bi] == "mud" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	
		local t_tree
		local t_replace

		if string.find(tname, "-") then
			t_tree, t_replace = unpack(tname:split("-", true))
		else
			t_tree = tname
		end

		minetest.register_decoration({
			-- name = "gal:" .. tname .. "_tree",
			name = "gal:deco_" .. t_tree .. "_" .. bname .. "_" .. tsoils[bi] .. "_" .. tgrasses[bi] .. "_tree",
			deco_type = "schematic",
			place_on = tdirts,
			sidelen = 16,
			fill_ratio = tonumber(tdensitys[bi]),
			biomes = tbiomes,
			y_min = tonumber(tymins[bi]) or (heights[tymins[bi]] - gal.mapgen.biome_vertical_blend),
			y_max = tonumber(tymaxs[bi]) or (heights[tymaxs[bi]] + gal.mapgen.biome_vertical_blend),
			schematic = gal.schem(t_tree, t_replace),
			flags = "place_center_x, place_center_z, force_placement",
			--rotation = "random",
		})

	end

end

--
--deco_tree("acacia_01",					{"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",},			{"_clayey", "_clay_red", "_sandy", "_sand",},	{"grass", "grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_01",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--[[
deco_tree("acacia_02",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_03",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_04",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_05",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_06",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_07",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--]]

deco_tree("acacia_01-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--[[
deco_tree("acacia_02-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_03-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_04-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_05-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_06-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_07-L=tree_acacia_2_leaves",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--]]

deco_tree("acacia_01-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--[[
deco_tree("acacia_02-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_03-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_04-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_05-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_06-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
deco_tree("acacia_07-L=tree_acacia_leaves_blooms",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.0004,0.0004,0.0004,0.0004,0.0004,0.0004,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)
--]]

deco_tree("acacia_shoestring_01",		{"warm_semiarid", "warm_arid",},											{"_clayey", "_clayey",},			{"grass", "grass", "grass",},	{0.003,0.003,0.003,},{"beach","beach","beach",},{"coastal","coastal","coastal",})
--[[	Acacia (Shoestring)
deco_tree("acacia_shoestring_02",		{"warm_semiarid", "warm_arid",},											{"_clayey", "_clayey",},			{"grass", "grass", "grass",},	0.003,"beach","coastal")
--]]

deco_tree("apple_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "pale", "grass_grove",},
	{0.0007, 0.0005, 0.001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[	Apple (Green)
deco_tree("apple_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "pale", "grass_grove",},
	{0.0007, 0.0005, 0.001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("apple_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "pale", "grass_grove",},
	{0.0007, 0.0005, 0.001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("apple_04",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "pale", "grass_grove",},
	{0.0007, 0.0005, 0.001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("apple_05",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "pale", "grass_grove",},
	{0.0007, 0.0005, 0.001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("ash_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey", "",},
	{"grass", "pale", "grass_grove", "grass_grove",},
	{0.0007, 0.0005, 0.001, 0.001,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("ash_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey", "",},
	{"grass", "pale", "grass_grove", "grass_grove",},
	{0.0007, 0.0005, 0.001, 0.001,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("aspen_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("aspen_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("aspen_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("aspen_04",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("aspen_05",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("aspen_06",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"coastal", "coastal", "coastal",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("aspen_01-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--[[
deco_tree("aspen_02-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_03-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_04-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_05-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_06-L=tree_aspen_leaves_orange",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--]]

deco_tree("aspen_01-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--[[
deco_tree("aspen_02-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_03-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_04-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_05-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_06-L=tree_aspen_leaves_red",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--]]

deco_tree("aspen_01-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--[[
deco_tree("aspen_02-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_03-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_04-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_05-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
deco_tree("aspen_06-L=tree_aspen_leaves_yellow",
	{"temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass_grove", "grass_green",},
	{0.001, 0.001,},
	{"lowland", "lowland",},
	{"shelf", "shelf",}
)
--]]

deco_tree("bamboo_small",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("bamboo_temperate_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("bamboo_temperate_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("bamboo_tropical_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("bamboo_tropical_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("bamboo_tropical_03",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("bamboo_tropical_04",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("banana",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},								{"_silty", "_silty", "_silty",},		{"grass", "grass", "grass",},	{0.003,0.003,0.003,},		{"beach","beach","beach",},		{"lowland","lowland","lowland",})
--[[	Banana
--]]

deco_tree("banksia_bull_01",	{"warm_semihumid", "warm_temperate",},												{"_silty", "_clayey",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
--[[	Banksia (Bull)
deco_tree("banksia_bull_02",	{"warm_semihumid", "warm_temperate",},												{"_silty", "_clayey",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
--]]

deco_tree("banksia_coast_01",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
--[[	Banksia (Coast)
deco_tree("banksia_coast_02",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
deco_tree("banksia_coast_03",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
deco_tree("banksia_coast_04",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},					{"grass", "grass",},			{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--]]

deco_tree("baobab_01",
	{"hot_semiarid", "hot_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
--[[	Boabab
deco_tree("baobab_02",
	{"hot_semiarid", "hot_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
deco_tree("baobab_03",
	{"hot_semiarid", "hot_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
deco_tree("baobab_04",
	{"hot_semiarid", "hot_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
--]]

deco_tree("beech_01",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("beech_02",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("beech_03",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("beech_black_01",				{"temperate_humid", "temperate_semihumid",},								{"_silty", "_clayey",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"lowland","lowland",})
--[[	Beech (Black)
deco_tree("beech_black_02",				{"temperate_humid", "temperate_semihumid",},								{"_silty", "_clayey",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"lowland","lowland",})
--]]

deco_tree("beech_mountain_01",			{"temperate_humid", "temperate_semihumid",},								{"_silty", "_clayey",},				{"grass", "grass",},				{0.003,0.003,},				{"lowland","lowland",},			{"shelf","shelf",})
--[[	Beech (Mountain)
deco_tree("beech_mountain_02",			{"temperate_humid", "temperate_semihumid",},								{"_silty", "_clayey",},				{"grass", "grass",},				{0.003,0.003,},				{"lowland","lowland",},			{"shelf","shelf",})
--]]

deco_tree("beech_southern_01",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("beech_southern_02",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("beech_southern_03",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("birch_01-T=tree_birch_sweet_trunk,L=tree_birch_sweet_leaves",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[
deco_tree("birch_01-T=tree_birch_sweet_trunk,L=tree_birch_sweet_leaves",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("birch_01-T=tree_birch_yellow_trunk,L=tree_birch_yellow_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("birch_01-T=tree_birch_yellow_trunk,L=tree_birch_yellow_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

--[[	Birch (Sweet) - DNU
deco_tree("birch_sweet_01",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("birch_sweet_02",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("birch_sweet_03",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("birch_sweet_04",
	{
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
	},
	{
		"_clayey", "_clayey", "_clay_red", "_clayey",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "dirt", "pale",
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{
		0.0007, 0.0005, 0.0001, 0.0003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]
--[[	Birch (Yellow) - DNU
deco_tree("birch_yellow_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("birch_yellow_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("birch_yellow_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("birch_yellow_04",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)--]]

deco_tree("bloodwood_swamp_01",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy", "",},			{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--[[	Bloodwood (Swamp)
deco_tree("bloodwood_swamp_02",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy", "",},			{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--]]

deco_tree("boab_01",
	{"warm_semiarid", "warm_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
--[[	Boab
deco_tree("boab_02",
	{"warm_semiarid", "warm_semiarid",},
	{"_clayey", "_clay_red",},
	{"pale", "dirt",},
	{0.001,0.001,},
	{"beach","beach",},
	{"shelf","shelf",}
)
--]]

deco_tree("bottlebrush_red_01",			{"temperate_humid",},														{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
--[[	Bottlebrush (Red)
deco_tree("bottlebrush_red_02",			{"temperate_humid",},														{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
deco_tree("bottlebrush_red_03",			{"temperate_humid",},														{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
deco_tree("bottlebrush_red_04",			{"temperate_humid",},														{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
--]]

deco_tree("box_black_01",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
--[[	Box (Black)
deco_tree("box_black_02",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
deco_tree("box_black_03",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
--]]

deco_tree("box_cloncurry_01",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--[[	Box (Cloncurry)
deco_tree("box_cloncurry_02",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--]]

deco_tree("box_white_01",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
--[[	Box (White)
deco_tree("box_white_02",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
deco_tree("box_white_03",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"shelf","shelf",})
--]]

deco_tree("brazilnut_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("brazilnut_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("cabbage_01",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
--[[	Cabbage
deco_tree("cabbage_02",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"coastal","coastal",})
--]]

deco_tree("capirona_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("capirona_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("capirona_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("capirona_04",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("capirona_05",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("capirona_06",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01", "", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "pale", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.0004, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("cedar_01",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("cedar_02",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("cedar_03",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("cherry",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
deco_tree("cherry-L=tree_cherry_leaves2",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)

--[[	Cherry (Extra Schems)
deco_tree("cherry_01",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("cherry_02",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("cherry_03",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("cherry_04",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--]]

deco_tree("cherry_blossom",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey",},
	{"grass","grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--[[	Cherry Blossom
--]]

deco_tree("chestnut_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("chestnut_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("chestnut_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("chestnut_american_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey",},
	{"grass","grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("chestnut_american_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey",},
	{"grass","grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("chestnut_american_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_clayey", "_clayey", "_clayey",},
	{"grass","grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("clementine",					{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},				{0.003,0.003,},				{"beach","beach",},				{"lowland","lowland",})
--[[	Clementine
--]]

deco_tree("cocoa_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("cocoa_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("common_daisy_01",			{"warm_semihumid", "warm_semihumid", "warm_temperate",},					{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},		{0.003,0.003,0.003,},		{"beach","beach","beach",},		{"lowland","lowland","lowland",})
--[[	Common Daisy
deco_tree("common_daisy_02",			{"warm_semihumid", "warm_semihumid", "warm_temperate",},					{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},		{0.003,0.003,0.003,},		{"beach","beach","beach",},		{"lowland","lowland","lowland",})
--]]

deco_tree("conifers_01",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[
deco_tree("conifers_02",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("conifers_03",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("conifers_04",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("conifers_05",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("conifers_06",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("conifers_07",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
		"_sandy", "_sandy", "_sandy", "_sandy", "_sand", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("coolabah_01",				{"hot_temperate",},															{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"lowland",})
--[[	Coolabah
deco_tree("coolabah_02",				{"hot_temperate",},															{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"lowland",})
deco_tree("coolabah_03",				{"hot_temperate",},															{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"lowland",})
deco_tree("coolabah_04",				{"hot_temperate",},															{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"lowland",})
deco_tree("coolabah_05",				{"hot_temperate",},															{"_silty",},						{"grass",},							{0.003,},					{"beach",},						{"lowland",})
--]]

deco_tree("cypress_01",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--[[
deco_tree("cypress_02",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
deco_tree("cypress_03",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--]]

deco_tree("daintree_stringybark_01",	{"warm_humid",},															{"_sandy",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
--[[	Stringybark (Daintree)
deco_tree("daintree_stringybark_02",	{"warm_humid",},															{"_sandy",},						{"grass",},							{0.003,},					{"beach",},						{"coastal",})
--]]

deco_tree("default_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},		{0.003,0.003,0.003,},		{"coastal","coastal","coastal",},{"highland","highland","highland",})

deco_tree("dry_01",
	{
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
	},
	{
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
		"_clayey", "_clay_red", "_sandy", "_sand", "_silty", "_silt_01",
	},
	{
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
		"grass", "dirt", "grass", "dirt", "grass", "dirt",
	},
	{
		0.001,0.001,0.001,0.001,0.001,0.001,
		0.001,0.001,0.001,0.001,0.001,0.001,
	},
	{
		"beach","beach","beach","beach","beach","beach",
		"beach","beach","beach","beach","beach","beach",
	},
	{
		"shelf","shelf","shelf","shelf","shelf","shelf",
		"shelf","shelf","shelf","shelf","shelf","shelf",
	}
)

deco_tree("ebony",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "litter_rainforest", "dirt", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.001,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)

deco_tree("eucalyptus_01",
	{"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",},
	{"_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "dirt", "pale",},
	{0.0007, 0.0005, 0.0001, 0.0005,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[
deco_tree("eucalyptus_02",
	{"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",},
	{"_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "dirt", "pale",},
	{0.0007, 0.0005, 0.0001, 0.0005,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("eucalyptus_lemon_01",		{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"lowland","lowland",})
--[[	Eucalyptus (Lemon)
deco_tree("eucalyptus_lemon_02",		{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},				{0.003,0.003,},				{"coastal","coastal",},			{"lowland","lowland",})
--]]

deco_tree("fern_giant",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("fern_hawaiian",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("fern_large",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("fern_medium",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("fern_mexican",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

deco_tree("fern_palm",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)

--deco_tree("fern_small_01",				{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_silty", "_silty", "_silty",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.04,"beach","lowland")
--deco_tree("fern_small_02",				{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_silty", "_silty", "_silty",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.05,"beach","lowland")
--deco_tree("fern_small_03",				{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_silty", "_silty", "_silty",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.06,"beach","lowland")

deco_tree("fern_silver_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("fern_silver_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("fig_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[
deco_tree("fig_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("fig_03",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("fig_moreton_bay_01",			{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},				{0.0005,0.0005,},			{"beach","beach",},				{"lowland","lowland",})
--[[	Fig (Moreton Bay)
deco_tree("fig_moreton_bay_02",			{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},				{0.0005,0.0005,},			{"beach","beach",},				{"lowland","lowland",})
deco_tree("fig_moreton_bay_03",			{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},				{0.0005,0.0005,},			{"beach","beach",},				{"lowland","lowland",})
--]]

deco_tree("fir_coast_01",
	{
		"cool_humid", "cool_humid", "cool_humid",
	},
	{
		"_clayey", "_clayey", "_clayey",
	},
	{
		"grass","litter_coniferous", "litter_beech",
	},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"lowland", "lowland", "lowland",}
)
--[[deco_tree("fir_coast_02",
	{
		"cool_humid", "cool_humid", "cool_humid",
	},
	{
		"_clayey", "_clayey", "_clayey",
	},
	{
		"grass","litter_coniferous", "litter_beech",
	},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"lowland", "lowland", "lowland",}
)
--]]

deco_tree("fir_doug_01",
	{
		"cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey",
		"_clayey", "_clayey", "_clayey",
	},
	{
		"grass","litter_coniferous", "litter_beech",
		"grass","litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003,
		0.0007, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"lowland", "lowland", "lowland",
		"lowland", "lowland", "lowland",
	}
)
--[[deco_tree("fir_doug_02",
	{
		"cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey",
		"_clayey", "_clayey", "_clayey",
	},
	{
		"grass","litter_coniferous", "litter_beech",
		"grass","litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003,
		0.0007, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"lowland", "lowland", "lowland",
		"lowland", "lowland", "lowland",
	}
)
--]]

deco_tree("fir_01",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[deco_tree("fir_02",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

--[[deco_tree("fir_01-L=tree_fir_leaves2",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]
--[[deco_tree("fir_02-L=tree_fir_leaves2",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]

--[[deco_tree("fir_01-L=tree_fir_leaves3",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]
--[[deco_tree("fir_02-L=tree_fir_leaves3",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]

--[[deco_tree("fir_01-L=tree_fir_leaves4",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]
--[[deco_tree("fir_02-L=tree_fir_leaves4",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	0.03,"beach","shelf"
)
--]]

deco_tree("frost",						{"cold_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Frost
--]]

deco_tree("ginkgo",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_clayey", "_clayey", "_clayey",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[	Ginkgo
--]]

deco_tree("gum_blue_01",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Gum (Blue)
deco_tree("gum_blue_02",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("gum_blue_03",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("gum_blue_04",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("gum_red_river_01",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Gum (Red River)
deco_tree("gum_red_river_02",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("gum_red_river_03",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("gum_red_river_04",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("gum_red_river_05",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("gum_scribbly_01",			{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Gum (Scribbly)
deco_tree("gum_scribbly_02",			{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("gum_snow_01",				{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.003,},{"lowland",},{"shelf"})
--[[	Gum (Snow)
deco_tree("gum_snow_02",				{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.003,},{"lowland",},{"shelf"})
--]]

deco_tree("gum_sugar_01",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--[[	Gum (Sugar)
deco_tree("gum_sugar_02",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
deco_tree("gum_sugar_03",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
deco_tree("gum_sugar_04",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--]]

deco_tree("gum_swamp_01",				{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--[[	Gum (Swamp)
deco_tree("gum_swamp_02",				{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--]]

deco_tree("illawarra_flame_01",			{"warm_humid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Illawarra Flame
deco_tree("illawarra_flame_02",			{"warm_humid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("ipe_yellow",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[	Ipe (Yellow)
--]]

deco_tree("jacaranda_01",
	{"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.003, 0.003, 0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[	Jacaranda
deco_tree("jacaranda_02",
	{"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.003, 0.003, 0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jacaranda_03",
	{"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.003, 0.003, 0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("jarrah_01",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Jarrah
deco_tree("jarrah_02",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
deco_tree("jarrah_03",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("jungle_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("jungle_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_04",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_05",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_06",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_07",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("jungle_08",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "", "", "_clayey", "_clayey", "_clay_red", "", "",},
	{"litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.005, 0.007, 0.0003, 0.003, 0.001,0.004, 0.006, 0.0002, 0.002, 0.001,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("kahikatea_01",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Kahikatea
deco_tree("kahikatea_02",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("kamahi_01",
	{"warm_humid", "warm_semihumid", "warm_temperate",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass", "grass",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[	Kamahi
deco_tree("kamahi_02",
	{"warm_humid", "warm_semihumid", "warm_temperate",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass", "grass",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

--[[	Kamahi (Mossy)
deco_tree("kamahi_01-T=tree_mossy_trunk,L=tree_mossy_leaves",
	{"warm_humid", "warm_semihumid", "warm_temperate",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass", "grass",},
	{0.01, 0.01, 0.01,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("kapok_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clay_red", "", },
	{"grass", "pale", "litter_rainforest", "dirt", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.001,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("kapok_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clay_red", "", },
	{"grass", "pale", "litter_rainforest", "dirt", "litter_rainforest",},
	{0.0007, 0.0005, 0.003, 0.0001, 0.001,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("karaka_01",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Karaka
deco_tree("karaka_02",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("karo_01",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Karo
deco_tree("karo_02",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("karri_01",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.001,},{"beach",},{"coastal"})
--[[	Karri
deco_tree("karri_02",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.001,},{"beach",},{"coastal"})
deco_tree("karri_03",					{"hot_temperate",},															{"_sandy",},						{"grass",},						{0.001,},{"beach",},{"coastal"})
--]]

deco_tree("kauri_01",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--[[	Kauri
deco_tree("kauri_02",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--]]

deco_tree("kawakawa_01",				{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Kawakawa
deco_tree("kawakawa_02",				{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("kowhai_01",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Kowhai
deco_tree("kowhai_02",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("larch_01",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[deco_tree("larch_02",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("larch_03",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
		"_silty", "_silty", "_silty", "_silty", "_silt_01", "", "",
	},
	{
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
		0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("laurel_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "dirt", "pale",},
	{0.0007, 0.0005, 0.0001, 0.0004,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("laurel_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "dirt", "pale",},
	{0.0007, 0.0005, 0.0001, 0.0004,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("laurel_03",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red", "",},
	{"grass", "pale", "dirt", "pale",},
	{0.0007, 0.0005, 0.0001, 0.0004,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("lavender",
	{"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",},
	{"_sandy", "_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_coniferous", "litter_beech", "dirt",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[	Lavender
--]]

deco_tree("lemon",						{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Lemon
--]]

deco_tree("lilly_pilly_01",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Lilly Pilly
deco_tree("lilly_pilly_02",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
deco_tree("lilly_pilly_03",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
deco_tree("lilly_pilly_04",				{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("lumin_spore_01",				{"cold_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Lumin Spore
--]]

deco_tree("macadamia_01",				{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--[[	Macadamia
deco_tree("macadamia_02",				{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
deco_tree("macadamia_03",				{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"coastal",},{"lowland"})
--]]

deco_tree("mahoe_01",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland"})
--[[	Mahoe
deco_tree("mahoe_02",					{"warm_semihumid",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland"})
--]]

deco_tree("mahogany",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",},
	{"grass", "pale", "litter_rainforest", "litter_dark", "dirt", "litter_rainforest", "litter_dark",},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.0008, 0.002,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)

deco_tree("mamaku_01",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Mamaku
deco_tree("mamaku_02",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

deco_tree("mangrove_apple_01",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"2","2",},{"beach","beach"}
)
--[[deco_tree("mangrove_apple_02",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"2","2",},{"beach","beach"}
)
deco_tree("mangrove_apple_03",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"2","2",},{"beach","beach"}
)
--]]

deco_tree("mangrove_black_01",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
--[[deco_tree("mangrove_black_02",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
deco_tree("mangrove_black_03",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
--]]

--SCHEMATIC ERROR STARTS HERE ???   --  Got 320 Expected 336

deco_tree("mangrove_grey_01",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"2","2",},{"beach","beach"}
)

deco_tree("mangrove_palm_01",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"2","2",},{"beach","beach"}
)

deco_tree("mangrove_red_01",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
--[[deco_tree("mangrove_red_02",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
deco_tree("mangrove_red_03",
	{"hot_humid", "hot_semihumid",},
	{"mud_mangrove", "mud_mangrove",},
	{"mud", "mud",},
	{0.01,0.01,},{"0","0",},{"beach","beach"}
)
--]]

deco_tree("mangrove_stilted_01",
	{"hot_semihumid",},
	{"mud_mangrove",},
	{"mud",},
	{0.01,},{"2",},{"beach"}
)

deco_tree("mangrove_white_01",
	{"hot_semihumid",},
	{"mud_mangrove",},
	{"mud",},
	{0.01,},{"0",},{"beach"}
)
--[[deco_tree("mangrove_white_02",
	{"hot_semihumid",},
	{"mud_mangrove",},
	{"mud",},
	{0.01,},{"0",},{"beach"}
)
deco_tree("mangrove_white_03",
	{"hot_semihumid",},
	{"mud_mangrove",},
	{"mud",},
	{0.01,},{"0",},{"beach"}
)
--]]

deco_tree("manuka_01",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--[[	Manuka
deco_tree("manuka_02",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"coastal"})
--]]

--[[	Manuka (Mossy)
deco_tree("manuka_02-T=tree_mossy_trunk,L=tree_mossy_leaves",
	{"warm_temperate",},
	{"_clayey",},
	{"grass",},
	{0.01,},{"coastal",},{"lowland"}
)
--]]

--[[	Maple - 01 (DNU - Wrong Model)
deco_tree("maple_01",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
	},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]
deco_tree("maple_02",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)

deco_tree("maple_02-L=tree_maple_sugar_leaves",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red", "", "",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt", "grass_grove", "grass_green",
	},
	{0.0007, 0.0005, 0.001, 0.003, 0.0001, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)

deco_tree("maple_sugar_01",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[	Maple (Sugar) - 02 (DNU - Wrong Model)
deco_tree("maple_sugar_02",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("maple_sugar_01-L=tree_leaves_orange",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("maple_sugar_01-L=tree_leaves_red",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("maple_sugar_01-L=tree_leaves_yellow",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
		"_clayey", "_clayey", "_clayey", "_clayey", "_clay_red",
	},
	{
		"grass", "pale", "grass_grove", "grass_green", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
		"grass", "pale", "litter_coniferous", "litter_beech", "dirt",
	},
	{
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
		0.0007, 0.0005, 0.001, 0.003, 0.0001,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)

deco_tree("marri_01",					{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.0005,},{"beach",},{"lowland",})
--[[	Marri
deco_tree("marri_02",					{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.0005,},{"beach",},{"lowland",})
deco_tree("marri_03",					{"warm_temperate",},														{"_sandy",},						{"grass",},						{0.0005,},{"beach",},{"lowland",})
--]]

deco_tree("matagouri_01",				{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"coastal",},{"lowland",})
--[[	Matagouri
deco_tree("matagouri_02",				{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"coastal",},{"lowland",})
--]]

deco_tree("merbau_01",					{"warm_humid",},															{"_silt_01",},						{"dirt",},						{0.003,},{"beach",},{"coastal"})
--[[	Merbau
--]]

deco_tree("mesquite_01",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"_sandy", "_sandy", "_sand",
		"_silty", "_silty", "_silt_01",
	},
	{
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
	},
	{
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
	}
)
--[[	Mesquite
deco_tree("mesquite_02",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"_sandy", "_sandy", "_sand",
		"_silty", "_silty", "_silt_01",
	},
	{
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
	},
	{
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("mirabelle",					{"temperate_temperate", "temperate_semiarid",},								{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Mirabelle
--]]

deco_tree("miro_01",					{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Miro
deco_tree("miro_02",					{"warm_temperate",},														{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

--[[	Mossy
deco_tree("mossy_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	{0.003,"beach","highland",})
--]]

deco_tree("mulga_01",					{"warm_semiarid", "warm_semiarid",},										{"_sandy", "_sand",},				{"grass", "dirt",},				{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Mulga
deco_tree("mulga_02",					{"warm_semiarid", "warm_semiarid",},										{"_sandy", "_sand",},				{"grass", "dirt",},				{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("myrtle_lemon_01",			{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Myrtle (Lemon)
deco_tree("myrtle_lemon_02",			{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("myrtle_tasmanian_01",		{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"shelf",})
--[[	Myrtle (Tasmanian)
deco_tree("myrtle_tasmanian_02",		{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"shelf",})
deco_tree("myrtle_tasmanian_03",		{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"shelf",})
--]]

deco_tree("oak_black_01",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
	},
	{
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
	},
	{
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
	}
)
--[[deco_tree("oak_black_02",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
	},
	{
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
	},
	{
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
	}
)
deco_tree("oak_black_03",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
		"_clayey", "_clayey", "_clay_red",
		"_sandy", "_sandy", "_sand",
	},
	{
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
		"grass", "pale", "dirt",
	},
	{
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
		0.0007, 0.0005, 0.0001,
	},
	{
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
		"beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("oak_desert_01",
	{"warm_semiarid", "warm_semiarid", "warm_arid",},
	{"_sandy", "_sand", "_sand",},
	{"grass", "dirt", "dirt",},
	{0.001,0.0005,0.0001,},
	{"beach","beach","beach",},
	{"coastal","coastal","coastal",}
)
--[[	Oak (Desert)
deco_tree("oak_desert_02",
	{"warm_semiarid", "warm_semiarid", "warm_arid",},
	{"_sandy", "_sand", "_sand",},
	{"grass", "dirt", "dirt",},
	{0.001,0.0005,0.0001,},
	{"beach","beach","beach",},
	{"coastal","coastal","coastal",}
)
deco_tree("oak_desert_03",
	{"warm_semiarid", "warm_semiarid", "warm_arid",},
	{"_sandy", "_sand", "_sand",},
	{"grass", "dirt", "dirt",},
	{0.001,0.0005,0.0001,},
	{"beach","beach","beach",},
	{"coastal","coastal","coastal",}
)
deco_tree("oak_desert_04",
	{"warm_semiarid", "warm_semiarid", "warm_arid",},
	{"_sandy", "_sand", "_sand",},
	{"grass", "dirt", "dirt",},
	{0.001,0.0005,0.0001,},
	{"beach","beach","beach",},
	{"coastal","coastal","coastal",}
)
--]]

deco_tree("oak_red_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("oak_red_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("oak_red_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("oak_river_01",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Oak (River)
deco_tree("oak_river_02",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("oak_river_03",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("oak_river_04",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("oak_river_small_01-T=tree_oak_river_trunk,L=tree_oak_river_leaves",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	{0.003,0.003,0.003,},{"beach","beach","beach",},{"highland","highland","highland",})
--[[	Oak (River - Small)
deco_tree("oak_river_small_02-T=tree_oak_river_trunk,L=tree_oak_river_leaves",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("oak_river_small_03-T=tree_oak_river_trunk,L=tree_oak_river_leaves",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("oak_river_small_04-T=tree_oak_river_trunk,L=tree_oak_river_leaves",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--]]

deco_tree("oak_southern_01",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("oak_southern_02",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("oak_southern_03",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("oak_white_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("oak_white_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("oak_white_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

--SCHEMATIC ERROR ENDS HERE ???   --  Got 320 Expected 336

deco_tree("orange",						{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},		{0.01, 0.01, 0.01,},{"beach", "beach", "beach",},{"shelf", "shelf", "shelf",})
--[[	Orange
--]]

deco_tree("pahautea_01",				{"warm_humid",},															{"_silty",},						{"grass",},					{0.003,},{"lowland",},{"shelf",})
--[[	Pahautea
deco_tree("pahautea_02",				{"warm_humid",},															{"_silty",},						{"grass",},					{0.003,},{"lowland",},{"shelf",})
--]]

deco_tree("palm_coconut_01",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[deco_tree("palm_coconut_02",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("palm_coconut_03",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("palm_date_01",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[deco_tree("palm_date_02",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("palm_date_03",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("palm_date_04",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("palm_date_05",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("palm_doum_01",				{"hot_arid",},																{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal",})
--[[deco_tree("palm_doum_02",				{"hot_arid",},																{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal",})
deco_tree("palm_doum_03",				{"hot_arid",},																{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"coastal",})
--]]

deco_tree("palm_fan_01",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)

deco_tree("palm_fountain_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_fountain_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("palm_fountain_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("palm_jungle_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_jungle_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("palm_moriche_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_moriche_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("palm_moriche_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("palm_nikau_01",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_nikau_02",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("palm_royal_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_royal_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("palm_royal_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_sandy", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.003, 0.003, 0.003, 0.003,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("palm_windmill_01",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("palm_windmill_02",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("palm_windmill_03",
	{"warm_humid", "warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_semihumid",},
	{"_sandy", "_sandy", "_sand", "_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt", "grass", "pale", "dirt",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

--[[	Palmetto
deco_tree("palmetto_01",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--]]

deco_tree("paperbark_01",				{"warm_humid", "warm_semihumid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Paperbark
deco_tree("paperbark_02",				{"warm_humid", "warm_semihumid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("paperbark_swamp_01",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Paperbark (Swamp)
deco_tree("paperbark_swamp_02",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("pine_celery_top_01",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Pine (Celery Top)
deco_tree("pine_celery_top_02",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("pine_huon_01",				{"warm_semihumid",},														{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Pine (Huon)
--]]

deco_tree("pine_pinyon_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("pine_pinyon_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("pine_pinyon_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("pine_ponderosa_01",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("pine_ponderosa_02",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("pine_ponderosa_03",
	{"temperate_temperate", "temperate_temperate", "temperate_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("pine_rottnest_island_01",	{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Pine (Rottnest Island)
deco_tree("pine_rottnest_island_02",	{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("pine_yellow_01",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("pine_yellow_02",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("pine_yellow_03",
	{"temperate_humid", "temperate_humid", "temperate_humid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.0007, 0.0005, 0.0001,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("pohutukawa_01",				{"warm_humid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Pohutukawa
deco_tree("pohutukawa_02",				{"warm_humid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("pohutukawa_01-T=tree_scorched_trunk,L=air",
	{"warm_humid",},
	{"_clayey",},
	{"grass",},
	{0.003,},{"beach",},{"lowland",}
)
--[[	Pohutukawa (Scorched)
--]]

deco_tree("poplar_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
--[[	Poplar
deco_tree("poplar_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
deco_tree("poplar_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
--]]

deco_tree("poplar_small_01-T=tree_poplar_trunk,L=tree_poplar_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
--[[	Poplar (Small)
deco_tree("poplar_small_02-T=tree_poplar_trunk,L=tree_poplar_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
deco_tree("poplar_small_03-T=tree_poplar_trunk,L=tree_poplar_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
deco_tree("poplar_small_04-T=tree_poplar_trunk,L=tree_poplar_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
deco_tree("poplar_small_05-T=tree_poplar_trunk,L=tree_poplar_leaves",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"lowland", "lowland", "lowland", "lowland", "lowland",}
)
--]]

deco_tree("quandong_01",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Quandong
deco_tree("quandong_02",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
deco_tree("quandong_03",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
deco_tree("quandong_04",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
deco_tree("quandong_05",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("rangiora_01",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_clayey", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	{0.01, 0.01, 0.01,},{"beach", "beach", "beach",},{"shelf", "shelf", "shelf",})
--[[	Rangiora
deco_tree("rangiora_02",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_clayey", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	{0.01, 0.01, 0.01,},{"beach", "beach", "beach",},{"shelf", "shelf", "shelf",})
--]]

deco_tree("redwood_01",
	{"cool_humid", "cool_humid",},
	{"_clayey", "_clayey",},
	{"litter_coniferous", "litter_beech",},
	{0.001, 0.003,},
	{"coastal", "coastal",},
	{"lowland", "lowland",}
)
--[[deco_tree("redwood_02",
	{"cool_humid", "cool_humid",},
	{"_clayey", "_clayey",},
	{"litter_coniferous", "litter_beech",},
	{0.001, 0.003,},
	{"coastal", "coastal",},
	{"lowland", "lowland",}
)
--]]

deco_tree("redwood_coast_01",
	{"cool_humid",},
	{"_clayey",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--[[deco_tree("redwood_coast_02",
	{"cool_humid",},
	{"_clayey",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
deco_tree("redwood_coast_03",
	{"cool_humid",},
	{"_clayey",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--]]

deco_tree("rimu_01",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Rimu
deco_tree("rimu_02",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("rubber_01",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("rubber_02",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("rubber_03",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
deco_tree("rubber_04",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"_silty", "_silty", "_silty", "_silt_01",},
	{"grass", "pale", "litter_rainforest", "dirt",},
	{0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("sakura",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--[[	Sakura
deco_tree("sakura-L=tree_sakura_leaves2",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--]]

deco_tree("sassafras_southern_01",		{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Sassafras (Southern)
deco_tree("sassafras_southern_02",		{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("sassafras_southern_03",		{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("sassafras_southern_04",		{"warm_semihumid", "warm_temperate",},										{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("scorched_01",
	{"temperate_temperate","temperate_temperate","temperate_temperate","cool_temperate","cool_temperate","cool_temperate",},
	{"_clayey","_sandy","_silty","_clayey","_sandy","_silty",},
	{"grass_grey","grass_grey","grass_grey","grass_grey","grass_grey","grass_grey",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--[[deco_tree("scorched_02",
	{"temperate_temperate","temperate_temperate","temperate_temperate","cool_temperate","cool_temperate","cool_temperate",},
	{"_clayey","_sandy","_silty","_clayey","_sandy","_silty",},
	{"grass_grey","grass_grey","grass_grey","grass_grey","grass_grey","grass_grey",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
deco_tree("scorched_03",
	{"temperate_temperate","temperate_temperate","temperate_temperate","cool_temperate","cool_temperate","cool_temperate",},
	{"_clayey","_sandy","_silty","_clayey","_sandy","_silty",},
	{"grass_grey","grass_grey","grass_grey","grass_grey","grass_grey","grass_grey",},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01,},
	{"beach", "beach", "beach", "beach", "beach", "beach",},
	{"shelf", "shelf", "shelf", "shelf", "shelf", "shelf",}
)
--]]

deco_tree("sequoia_01",
	{"cool_humid", "cool_humid",},
	{"_sandy", "_sandy",},
	{"litter_coniferous", "litter_beech",},
	{0.001, 0.003,},
	{"coastal", "coastal",},
	{"lowland", "lowland",}
)
--[[deco_tree("sequoia_02",
	{"cool_humid", "cool_humid",},
	{"_sandy", "_sandy",},
	{"litter_coniferous", "litter_beech",},
	{0.001, 0.003,},
	{"coastal", "coastal",},
	{"lowland", "lowland",}
)
deco_tree("sequoia_03",
	{"cool_humid", "cool_humid",},
	{"_sandy", "_sandy",},
	{"litter_coniferous", "litter_beech",},
	{0.001, 0.003,},
	{"coastal", "coastal",},
	{"lowland", "lowland",}
)
--]]

deco_tree("sequoia_giant_01",
	{"cool_humid",},
	{"_sandy",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--[[deco_tree("sequoia_giant_02",
	{"cool_humid",},
	{"_sandy",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
deco_tree("sequoia_giant_03",
	{"cool_humid",},
	{"_sandy",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
deco_tree("sequoia_giant_04",
	{"cool_humid",},
	{"_sandy",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--]]

deco_tree("spruce_01",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_silty", "_silty", "_silty", "", "",
		"_silty", "_silty", "_silty", "", "",
	},
	{
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003, 0.001, 0.002,
		0.0007, 0.001, 0.003, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--[[deco_tree("spruce_02",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_silty", "_silty", "_silty", "", "",
		"_silty", "_silty", "_silty", "", "",
	},
	{
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003, 0.001, 0.002,
		0.0007, 0.001, 0.003, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("spruce_03",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_silty", "_silty", "_silty", "", "",
		"_silty", "_silty", "_silty", "", "",
	},
	{
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003, 0.001, 0.002,
		0.0007, 0.001, 0.003, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
deco_tree("spruce_04",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
	},
	{
		"_silty", "_silty", "_silty", "", "",
		"_silty", "_silty", "_silty", "", "",
	},
	{
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
		"grass", "litter_coniferous", "litter_beech", "litter_coniferous", "litter_beech",
	},
	{
		0.0007, 0.001, 0.003, 0.001, 0.002,
		0.0007, 0.001, 0.003, 0.001, 0.002,
	},
	{
		"beach", "beach", "beach", "beach", "beach",
		"beach", "beach", "beach", "beach", "beach",
	},
	{
		"shelf", "shelf", "shelf", "shelf", "shelf",
		"shelf", "shelf", "shelf", "shelf", "shelf",
	}
)
--]]

deco_tree("spruce_sitka_01",
	{"cool_humid",},
	{"_silty",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--[[deco_tree("spruce_sitka_02",
	{"cool_humid",},
	{"_silty",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
deco_tree("spruce_sitka_03",
	{"cool_humid",},
	{"_silty",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
deco_tree("spruce_sitka_04",
	{"cool_humid",},
	{"_silty",},
	{"litter_beech",},
	{0.001,},
	{"coastal",},
	{"lowland",}
)
--]]
--deco_tree("spruce_sitka_05",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("spruce_sitka_06",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("tawa_01",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Tawa
deco_tree("tawa_02",					{"warm_temperate",},														{"_clayey",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("tea_01",						{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Tea
deco_tree("tea_02",						{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
deco_tree("tea_03",						{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
deco_tree("tea_04",						{"warm_humid",},															{"_sandy",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("teak_01",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("teak_02",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("teak_03",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("teak_04",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_clayey", "_clayey", "_clay_red",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("totara_01",					{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Totara
deco_tree("totara_02",					{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("wattle_01",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("wattle_02",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("wattle_03",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("wattle_01-L=tree_wattle_leaves2",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[deco_tree("wattle_02-L=tree_wattle_leaves2",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("wattle_03-L=tree_wattle_leaves2",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("wattle_black_01",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Wattle (Black)
deco_tree("wattle_black_02",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("wattle_black_03",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("wattle_black_04",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("wattle_golden_01",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Wattle (Golden)
deco_tree("wattle_golden_02",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("wattle_golden_03",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("wattle_golden_04",			{"temperate_semihumid", "temperate_temperate",},							{"_clayey", "_clayey",},			{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("wheki_01",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--[[	Wheki
deco_tree("wheki_02",					{"warm_humid",},															{"_silty",},						{"grass",},						{0.003,},{"beach",},{"lowland",})
--]]

deco_tree("willow_01",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"coastal", "coastal", "coastal", "coastal", "coastal",}
)
--[[deco_tree("willow_02",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"coastal", "coastal", "coastal", "coastal", "coastal",}
)
deco_tree("willow_03",
	{"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",},
	{"_silty", "_silty", "_silty", "", "",},
	{"grass", "grass_grove", "grass_green", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003, 0.001, 0.003,},
	{"beach", "beach", "beach", "beach", "beach",},
	{"coastal", "coastal", "coastal", "coastal", "coastal",}
)
--]]

deco_tree("wirewood_01",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Wirewood
deco_tree("wirewood_02",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("wirewood_03",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("woollybutt_darwin_01",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--[[	Woollybutt (Darwin)
deco_tree("woollybutt_darwin_02",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("woollybutt_darwin_03",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
deco_tree("woollybutt_darwin_04",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			{0.003,0.003,},{"beach","beach",},{"coastal","coastal",})
--]]

deco_tree("yellow_healing",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_silty", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	{0.01, 0.01, 0.01,},{"beach", "beach", "beach",},{"shelf", "shelf", "shelf",})
--[[	Yellow Healing
--]]

deco_tree("yellowwood_01",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--[[	Yellowwood
deco_tree("yellowwood_02",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
deco_tree("yellowwood_03",
	{"hot_temperate", "hot_temperate", "hot_temperate",},
	{"_silty", "_silty", "_silt_01",},
	{"grass", "pale", "dirt",},
	{0.003, 0.003, 0.003,},
	{"beach", "beach", "beach",},
	{"shelf", "shelf", "shelf",}
)
--]]

deco_tree("yew_01",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--[[	Yew
deco_tree("yew_02",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
deco_tree("yew_03",
	{"temperate_semihumid", "temperate_semihumid", "temperate_semihumid",},
	{"_silty", "_silty", "_silty",},
	{"grass", "grass_grove", "grass_green",},
	{0.0007, 0.001, 0.003,},
	{"beach", "beach", "beach",},
	{"coastal", "coastal", "coastal",}
)
--]]

---------------
-- GIANT MUSHROOMS
---------------
local deco_shroom = function(tname,tbiomes,tsoils,tgrasses,tdensity,tymin,tymax)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. "_pale"
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. "_pale"
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	end
	
	local t_tree
	local t_replace

	if string.find(tname, "-") then
		t_tree, t_replace = unpack(tname:split("-", true))
	else
		t_tree = tname
	end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = tdirts,
		sidelen = 16,
		fill_ratio = tonumber(tdensity),
		biomes = tbiomes,
		y_min = tonumber(tymin) or (heights[tymin] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(tymax) or (heights[tymax] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schem(t_tree, t_replace),
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

end


deco_shroom("mushroom_giant_morel-B=mushroom_cap_brown_01,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_fat-B=mushroom_cap_brown_02,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_3a-B=mushroom_small_cap_01,H=mushroom_small_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_3b-B=mushroom_small_cap_02,H=mushroom_small_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_tall-B=mushroom_cap_cyan_spotted,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_large-B=mushroom_cap_green_spotted,H=mushroom_02_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_big-B=mushroom_cap_green_dk_spotted,H=mushroom_02_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_giant_tall-B=mushroom_cap_purple_spotted,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_giant_morel_large-B=mushroom_cap_red_spotted,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_short-B=mushroom_cap_yellow_spotted,H=mushroom_01_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_shroom("mushroom_giant_tall-B=mushroom_cap_mottled,H=mushroom_03_trunk",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)



---------------
-- PLANTS
---------------
local deco_plant = function(tname,tbiomes,tsoils,tgrasses,tdensity,tymin,tymax,theightmax)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. "_pale"
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. "_pale"
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt_" .. tsoils[bi]
			elseif tgrasses[bi] == "liquid" then
				tdirts[bi] = "gal:liquid_" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	end
	
	if theightmax and tonumber(theightmax) > 0 then
		minetest.register_decoration({
			-- name = "gal:" .. tname .. "_plant",
			deco_type = "simple",
			place_on = tdirts,
			sidelen = 16,
			fill_ratio = tonumber(tdensity),
			biomes = tbiomes,
			y_min = tonumber(tymin) or (heights[tymin] - gal.mapgen.biome_vertical_blend),
			y_max = tonumber(tymax) or (heights[tymax] + gal.mapgen.biome_vertical_blend),
			decoration = {"gal:" .. tname .. "", },						--f:split(";", true),
			height_max = tonumber(theightmax),
			--spawn_by = h,
			--num_spawn_by = tonumber(i),
		})
	else
		minetest.register_decoration({
			-- name = "gal:" .. tname .. "_plant",
			deco_type = "simple",
			place_on = tdirts,
			sidelen = 16,
			fill_ratio = tonumber(tdensity),
			biomes = tbiomes,
			y_min = tonumber(tymin) or (heights[tymin] - gal.mapgen.biome_vertical_blend),
			y_max = tonumber(tymax) or (heights[tymax] + gal.mapgen.biome_vertical_blend),
			decoration = {"gal:" .. tname .. "", },						--f:split(";", true),
			--height_max = tonumber(g),
			--spawn_by = h,
			--num_spawn_by = tonumber(i),
		})
	end

end


---------------
-- PLANT LIST
---------------

--
-- CACTII	-	TODO:	Most
--
--[[deco_plant("cactus",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
--]]
deco_plant("cactus_column_01",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_column_02",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_globe",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_green_column",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_green_trunk",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_moonflower",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_prickly_pear",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_purple_button",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_purple_column",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_purple_trunk",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_small_column_01",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_small_column_02",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_small_globe",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)
deco_plant("cactus_vine",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.002,"beach","shelf"
)


deco_shroom("cactus_joshua-H=cactus_green_trunk",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.0007,"beach","shelf"
)
deco_shroom("cactus_sagauro-H=cactus_purple_trunk",
	{"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	{"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	{"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	0.0005,"beach","shelf"
)
-- deco_shroom("cactus_tree-H=cactus_purple_trunk",
	-- {"hot_semiarid", "hot_arid", "warm_semiarid", "warm_arid", "temperate_semiarid", "temperate_arid", "cool_semiarid", "cool_arid",},
	-- {"_sandy", "stone_sandstone_white_gravel", "_sandy", "stone_sandstone_gravel", "_sandy", "stone_sandstone_desert_gravel", "_sandy", "stone_gravel",},
	-- {"grass", "stone", "grass", "stone", "grass", "stone", "grass", "stone",},
	-- 0.002,"beach","shelf"
-- )



--
-- FERNS	-	TODO:	Most
--
--[[ deco_plant("fern",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.002,"beach","shelf"
)
--]]
deco_plant("fern_big",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_bluespike",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.01, "beach", "shelf"
)
deco_plant("fern_boston",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("fern_broadleaf_fern",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_broadleaf_fern2",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_dicksonia",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.01, "beach", "shelf"
)
deco_plant("fern_fern",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_fiddlehead",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.01, "beach", "shelf"
)
deco_plant("fern_horsetail_02",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("fern_horsetail_1",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("fern_horsetails",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("fern_ladyfern",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_ladyfern2",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_large_1",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_mangrove",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.002,"beach","shelf"
)
deco_plant("fern_small_1",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("fern_spike",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.01, "beach", "shelf"
)


--
-- FLOWERS	-	TODO:	Most
--
--[[ deco_plant("flower",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
--]]
deco_plant("flower_allium_purple",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_big",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_bird_of_paradise",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_blue",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_cave",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_chrysanthemum_green",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_couch_honeypot",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_daisy_oxeye",
					{"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",},
					0.002,"beach","shelf"
)
deco_plant("flower_daisy_silver",
					{"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",},
					0.002,"beach","shelf"
)
deco_plant("flower_dandelions_white",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_dandelions_yellow",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_dandelions_yellow_small",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_dandelion_white",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_dandelion_yellow",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_delphinium",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_fire",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_fire_02",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_foxglove_pink",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_foxglove_purple",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_geranium_blue",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_geraniums",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_gerbera",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_ground_blue",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_ground_pink",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_ground_red",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_ground_yellow",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_hibiscus",
		{
			"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		},
		{
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest",
			"grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		},
		0.002,"beach","shelf"
)
deco_plant("flower_jungle",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_lantana",
		{
			"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass", "pale", "pale", "pale",
			"grass", "grass", "grass", "pale", "pale", "pale",
			"grass", "grass", "grass", "pale", "pale", "pale",
		},
		0.002,"beach","shelf"
)
deco_plant("flower_lavender",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.002, "beach", "shelf"
)
deco_plant("flower_lazarus_bell",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_lily_calla",	
	{"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale",},
	0.002,"beach","shelf"
)
deco_plant("flower_lily_darling",
	{"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale",},
	0.002,"beach","shelf"
)
deco_plant("flower_lily_flame",
					{"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_jungle_01", "_with_grass_jungle_01", "_with_grass_jungle_01", "_with_grass_jungle_01",},
					0.002,"beach","shelf"
)
deco_plant("flower_lily_mangrove",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_lobelia",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_medium",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_orchid",
		{
			"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		},
		{
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
			"", "_clayey", "_sandy", "", "_clayey", "_sandy",
		},
		{
			"litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_dark", "litter_dark", "litter_dark",
			"litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_dark", "litter_dark", "litter_dark",
		},
		0.002,"beach","shelf"
)
deco_plant("flower_pansy_blue",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_pansy_purple",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_petunia_blue",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.002, "beach", "shelf"
)
deco_plant("flower_petunia_pink",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.002, "beach", "shelf"
)
deco_plant("flower_petunia_white",
	{
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.002, "beach", "shelf"
)
deco_plant("flower_rose",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_rose_frozen",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_roses",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_roses_black",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_roses_small",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)
deco_plant("flower_thistle",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_tulip_black",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_tulip_orange",
	{
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_dry", "grass_dry", "grass_dry", "grass_dry",
	},
	0.001, "beach", "shelf"
)
deco_plant("flower_viola",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
					0.002,"beach","shelf"
)


--
-- GRASSES	-	TODO:	bamboo, clover, giant_1, marram_1, mitchell, tall_1
--
deco_plant("grass_1",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove", "grass_green", "grass_green", "grass_green", "grass_green",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_bamboo_grass",
	{"hot_semihumid", "hot_semihumid", "hot_semihumid",},
	{"_sandy", "_sandy", "_sand",},
	{"grass", "pale", "dirt",},
	0.01,"beach","shelf"
)
deco_plant("grass_clover",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.09, "beach", "shelf"
)
deco_plant("grass_dead_1",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_dry_1",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_giant_1",
	{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
	{"mud_01", "mud_01","mud_01", "mud_01",},
	{"dirt", "dirt","dirt", "dirt",},
	0.04,"sea_level","lowland"
)
deco_plant("grass_golden_1",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_green",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_green_1",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_jungle",
	{
		"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
		"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
	},
	0.04, "beach", "shelf"
)
deco_plant("grass_jungle_1",
	{
		"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
		"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
	},
	0.09, "beach", "shelf"
)
deco_plant("grass_kauri",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty",
	},
	{
		"litter_dry", "litter_dry", "litter_dry", "litter_dry",
		"litter_dry", "litter_dry", "litter_dry", "litter_dry",
		"litter_dry", "litter_dry", "litter_dry", "litter_dry",
		"litter_dry", "litter_dry", "litter_dry", "litter_dry",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_marram_1",
			{"temperate_semihumid", "temperate_temperate",},
			{"", "",},
			{"grass", "grass",},
			0.08, "beach", "shelf"
)
deco_plant("grass_mitchell",
			{"temperate_semihumid", "temperate_temperate",},
			{"", "",},
			{"grass", "grass",},
			0.08, "beach", "shelf"
)
deco_plant("grass_snow_1",
	{
		"cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid",
		"cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid",
		"cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate",
	},
	{
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
	},
	{
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
	},
	0.09, "beach", "shelf"
)
deco_plant("grass_swamp",
	{
		"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
		"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
		"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_swamp_1",
	{
		"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
		"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
		"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
	},
	0.08, "beach", "shelf"
)
deco_plant("grass_tall_1",
	{"hot_semihumid", "warm_semihumid", "temperate_semihumid",},
	{"", "", "",},
	{"grass", "grass", "grass",},
	0.08, "beach", "shelf"
)


--
-- GROUND	-	TODO:	leaf_litter, leaf_litter_2, litter_leaf_pile
--
deco_plant("ground_grass",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.002,"beach","shelf"
)
deco_plant("ground_grass_dry",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.002,"beach","shelf"
)
deco_plant("ground_leaf_litter",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
	0.002,"beach","shelf"
)
deco_plant("ground_leaf_litter_2",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
	0.002,"beach","shelf"
)
deco_plant("litter_leaf_pile",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
	0.002,"beach","shelf"
)


--
-- MUSHROOM		-	TODO:	mushroom_blue_cave, mushroom_fire, mushroom_glow, mushroom_milkcap, mushroom_parasol, mushroom_shaggy_mane, mushroom_sulfur_tuft_1, mushroom_sulfur_tuft_2
--
--[[deco_plant("mushroom",
					{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
					{"", "", "", "", "", "",},
					{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
					0.002,"beach","shelf"
)
--]]
deco_plant("mushroom_blue_cave",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_brown",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("mushroom_fire",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_glow",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_ground_fungus",
	{
		"cold_semiarid", "cold_semiarid", "cold_semiarid", "cold_semiarid", "cold_semiarid", "cold_semiarid",
	},
	{
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
	},
	{
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
	},
	0.04, "beach", "shelf"
)
deco_plant("mushroom_pink",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("mushroom_milkcap",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_parasol",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_purple",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("mushroom_red",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.03, "beach", "shelf"
)
deco_plant("mushroom_red_large",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)
deco_plant("mushroom_shaggy_mane",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_stone",
	{
		"cold_arid", "cold_arid", "cold_arid", "cold_arid", "cold_arid", "cold_arid",
	},
	{
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
	},
	{
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
	},
	0.04, "beach", "shelf"
)
deco_plant("mushroom_sulfur_tuft_1",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_sulfur_tuft_2",
	{"hot_humid", "hot_semihumid", "hot_temperate", "cool_humid", "cool_semihumid", "cool_temperate",},
	{"", "", "", "", "", "",},
	{"litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi", "litter_fungi",},
	0.002,"beach","shelf"
)
deco_plant("mushroom_white",
	{
		"cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid", "cool_humid",
		"cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid", "cool_semihumid",
		"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",
	},
	0.02, "beach", "shelf"
)


--
-- PLANTS	-	TODO:	farming plants, aotearoa plants, australia plants, 
--
--[[deco_plant("plant",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
--]]
deco_plant("plant_aloe_vera",
	{"hot_temperate", "hot_semiarid",},
	{"_sandy", "_sandy",},
	{"grass", "grass",},
	0.002,"beach","shelf"
)
deco_plant("plant_arrow_arum",
	{"temperate_humid", "temperate_semihumid",},
	{"_silty", "_silty",},
	{"grass", "grass",},
	0.002,"beach","coastal"
)
deco_plant("plant_banana_1",
	{
		"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
		"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
		"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
	},
	0.04, "beach", "shelf"
)
deco_plant("plant_barley_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_bracken",
		{"temperate_temperate", "temperate_temperate", "temperate_semiarid", "temperate_semiarid", "temperate_arid", "temperate_arid",},
		{"_sandy", "sand", "_sandy", "sand", "_sandy", "sand",},
		{"grass", "dirt", "grass", "dirt", "grass", "dirt",},
		0.002,"beach","shelf"
)
deco_plant("plant_bristle_tussock",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_bulrush",
	{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
	{"mud_01", "mud_01","mud_01", "mud_01",},
	{"dirt", "dirt","dirt", "dirt",},
	0.04,"sea_level","lowland"
)
deco_plant("plant_carrot_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_cattail",
		{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
		{"mud_01", "mud_01","mud_01", "mud_01",},
		{"dirt", "dirt","dirt", "dirt",},
		0.04,"sea_level","coastal"
)
deco_plant("plant_cattail_02",
		{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
		{"mud_01", "mud_01","mud_01", "mud_01",},
		{"dirt", "dirt","dirt", "dirt",},
		0.04,"sea_level","lowland"
)
deco_plant("plant_cattails_03",
		{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
		{"mud_01", "mud_01","mud_01", "mud_01",},
		{"dirt", "dirt","dirt", "dirt",},
		0.04,"sea_level","coastal"
)
deco_plant("plant_chili_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_coffee_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_corn_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_cotton_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_crabgrass",
		{
			"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
			"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
			"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_creeper",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_cucumber_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_curly",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_curly_ground",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass",
			"pale", "pale", "pale",
			"grass", "grass", "grass",
			"pale", "pale", "pale",
			"grass", "grass", "grass",
			"pale", "pale", "pale",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_dead",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_flax",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_gourd_bottle_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
					{"", "_clayey", "_sandy", "", "_clayey", "_sandy",},
					{"grass", "grass", "grass", "grass", "grass", "grass",},
					0.002,"beach","shelf"
)
deco_plant("plant_heath_gold",
		{"hot_semiarid", "hot_semiarid", "hot_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_heath_green",
		{"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_heath_purple",
		{"warm_semiarid", "warm_semiarid", "warm_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_heath_red",
		{"warm_semiarid", "warm_semiarid", "warm_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_heath_sandwort",
		{"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_heath_saxifrage_purple",
		{"cool_semiarid", "cool_semiarid", "cool_semiarid",},
		{"", "_clayey", "_silty",},
		{"grass", "grass", "grass",},
		0.08,"beach","shelf"
)
deco_plant("plant_juncus_1",
		{
			"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
			"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
			"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_kiokio",
					{"cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate", "cool_temperate",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_beech", "litter_beech", "litter_beech", "litter_beech",},
					0.002,"beach","coastal"
)
deco_plant("plant_mangrove_fern",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_manna_reed",
		{
			"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
			"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
			"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_nettle_carduus",
		{
			"cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid",
			"cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid",
			"cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate",
		},
		{
			"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
			"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
			"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		},
		{
			"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
			"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
			"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_nettle_cleavers",
		{
			"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
			"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
			"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_nettle_giant_hogweed",
		{
			"warm_semiarid", "warm_semiarid", "warm_semiarid",
			"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		},
		{
			"", "_clayey", "_silty",
			"", "_clayey", "_silty",
		},
		{
			"grass", "grass", "grass",
			"grass", "grass", "grass",
		},
		0.08,"beach","shelf"
)
deco_plant("plant_nettle_impatiens",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass",
			"pale", "pale", "pale",
			"grass", "grass", "grass",
			"pale", "pale", "pale",
			"grass", "grass", "grass",
			"pale", "pale", "pale",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_nettle_nettle",
		{
			"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
			"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
			"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_nettle_scotch_broom",
		{
			"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
			"temperate_arid", "temperate_arid", "temperate_arid",
		},
		{
			"", "_clayey", "_silty",
			"", "_clayey", "_silty",
		},
		{
			"grass", "grass", "grass",
			"grass", "grass", "grass",
		},
		0.08,"beach","shelf"
)
deco_plant("plant_palmetto_01",
		{
			"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
			"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
			"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_papyrus",
		{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
		{"mud_01", "mud_01","mud_01", "mud_01",},
		{"dirt", "dirt","dirt", "dirt",},
		0.06,"sea_level","coastal",4
)
deco_plant("plant_pineapple_plant",
		{"hot_humid", "hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_semihumid",},
		{"", "_clayey", "_sandy", "", "_clayey", "_sandy",},
		{"litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",},
		0.002,"beach","shelf"
)
deco_plant("plant_pingao",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_potato_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_raspberries_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_raupo",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_red_tussock",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_reedmace_1",
		{"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
		{"mud_01", "mud_01","mud_01", "mud_01",},
		{"dirt", "dirt","dirt", "dirt",},
		0.04,"sea_level","lowland"
)
deco_plant("plant_rhubarb_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_saltbush",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_small_desert_palm",
		{
			"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		},
		{
			"", "_clayey", "_silty",
		},
		{
			"grass", "grass", "grass",
		},
		0.03,"beach","shelf"
)
deco_plant("plant_small_jungle_tree",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"litter_dark", "litter_dark", "litter_dark",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_spinifex_01",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_spinifex_02",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_strawberry_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_tomato_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_umbrella",
		{
			"hot_humid", "hot_humid", "hot_humid",
			"hot_humid", "hot_humid", "hot_humid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_semihumid", "hot_semihumid", "hot_semihumid",
			"hot_temperate", "hot_temperate", "hot_temperate",
			"hot_temperate", "hot_temperate", "hot_temperate",
		},
		{
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
			"", "_clayey", "_sandy",
		},
		{
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
			"grass", "grass", "grass",
			"litter_rainforest", "litter_rainforest", "litter_rainforest",
		},
		0.002,"beach","shelf"
)
deco_plant("plant_waratah",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
-- deco_plant("plant_waterlily_pink",
					-- {"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
					-- {"water_source", "water_source", "water_source", "water_source",},
					-- {"liquid", "liquid", "liquid", "liquid",},
					-- 0.03,"sea_level","beach"
-- )
-- deco_plant("plant_waterlily_yellow",
					-- {"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid",},
					-- {"water_source", "water_source", "water_source", "water_source",},
					-- {"liquid", "liquid", "liquid", "liquid",},
					-- 0.03,"sea_level","beach"
-- )
deco_plant("plant_weed",
		{
			"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
			"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
			"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
		},
		{
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
			"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		},
		{
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
			"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		},
		0.04, "beach", "shelf"
)
deco_plant("plant_weed_dead",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_weed_eye",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_wheat_1",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_wild_oat",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_wild_oat_dry",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)
deco_plant("plant_wild_onion_1",
		{
			"temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		},
		{
			"", "_clayey", "_silty",
		},
		{
			"grass", "grass", "grass",
		},
		0.02,"beach","shelf"
)
deco_plant("plant_wiwi",
					{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
					{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
					{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
					0.002,"beach","shelf"
)


--
-- SHRUBS	-	TODO:	crystal, fiery
--
--[[deco_plant("shrub",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
	0.002,"beach","shelf"
)
--]]
deco_plant("shrub_crystal",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
	0.002,"beach","shelf"
)
deco_plant("shrub_deciduous",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_dry",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_fiery",
	{"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",},
	{"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",},
	{"grass", "grass", "grass", "grass", "litter_coniferous", "litter_coniferous", "litter_coniferous", "litter_coniferous",},
	0.002,"beach","shelf"
)
deco_plant("shrub_hog_peanut",
	{
		"temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid", "temperate_humid",
		"temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid", "temperate_semihumid",
		"temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate", "temperate_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_grove", "grass_grove", "grass_grove", "grass_grove",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_jungle",
	{
		"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
		"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_lush_01",
	{
		"hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid", "hot_humid",
		"hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid", "hot_semihumid",
		"hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate", "hot_temperate",
		"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
		"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
		"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "litter_rainforest", "litter_rainforest", "litter_rainforest", "litter_rainforest",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_lush_02",
	{
		"warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid", "warm_humid",
		"warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid", "warm_semihumid",
		"warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate", "warm_temperate",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01", "grass_jungle_01",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_scorched",
	{
		"hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid", "hot_semiarid",
		"warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid", "warm_semiarid",
		"temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid", "temperate_semiarid",
		"cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid", "cool_semiarid",
	},
	{
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
		"", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty", "", "_clayey", "_sandy", "_silty",
	},
	{
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
		"grass", "grass", "grass", "grass", "pale", "pale", "pale", "pale", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_grass_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry", "_with_litter_dry",
	},
	0.002,"beach","shelf"
)
deco_plant("shrub_snowy",
	{
		"cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid",
		"cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid",
		"cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate",
	},
	{
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
	},
	{
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
	},
	0.04, "beach", "shelf"
)
deco_plant("shrub_taiga",
	{
		"cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid", "cold_humid",
		"cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid", "cold_semihumid",
		"cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate", "cold_temperate",
	},
	{
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
		"", "permafrost", "permafrost_stoney", "", "permafrost", "permafrost_stoney",
	},
	{
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
		"snow", "snow", "snow", "litter_moss", "litter_moss", "litter_moss",
	},
	0.04, "beach", "shelf"
)



--
-- OCEAN
--
-- Coral reefs
--[[
local deco_coral = function(tname,tbiomes,tsoils,tgrasses,tseed,tymin,tymax)
-- local deco_coral = function(tname,tbiomes,tsoils,tgrasses,tdensity,tymin,tymax)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt_with_grass_" .. bname .. "_pale"
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. ""
			elseif tgrasses[bi] == "pale" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_grass_" .. bname .. "_pale"
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	end
	
	local t_tree
	local t_replace

	if string.find(tname, "-") then
		t_tree, t_replace = unpack(tname:split("-", true))
	else
		t_tree = tname
	end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = tdirts,
		-- sidelen = 16,
		-- fill_ratio = tonumber(tdensity),
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = tonumber(tseed),
			octaves = 3,
			persist = 0.7,
		},
		biomes = tbiomes,
		-- y_min = tonumber(tymin),
		y_min = tonumber(tymin) or (heights[tymin] - gal.mapgen.biome_vertical_blend),
		-- y_max = tonumber(tymax),
		y_max = tonumber(tymax) or (heights[tymax] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schem(t_tree, t_replace),
		-- flags = "place_center_x, place_center_z, force_placement",
		flags = "force_placement",
		rotation = "random",
	})

end

deco_coral("coral_fire-B=coral_fire_coral,H=coral_orange_01",
	{
		"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_temperate", "hot_temperate",
		"warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_temperate", "warm_temperate",
		"temperate_humid", "temperate_humid", "temperate_semihumid", "temperate_semihumid", "temperate_temperate", "temperate_temperate",
	},
	{
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
	},
	{
		"stone", "stone", "stone", "stone", "stone", "stone",
		"stone", "stone", "stone", "stone", "stone", "stone",
		"stone", "stone", "stone", "stone", "stone", "stone",
	},
	6543,-14,-32
	-- 0.05,-14,-32
)

deco_coral("coral_pillar-B=coral_bubble_coral,H=coral_tube_coral",
	{
		"hot_humid", "hot_humid", "hot_semihumid", "hot_semihumid", "hot_temperate", "hot_temperate",
		"warm_humid", "warm_humid", "warm_semihumid", "warm_semihumid", "warm_temperate", "warm_temperate",
		"temperate_humid", "temperate_humid", "temperate_semihumid", "temperate_semihumid", "temperate_temperate", "temperate_temperate",
	},
	{
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
		"sand", "coral_stone", "sand", "coral_stone", "sand", "coral_stone",
	},
	{
		"stone", "stone", "stone", "stone", "stone", "stone",
		"stone", "stone", "stone", "stone", "stone", "stone",
		"stone", "stone", "stone", "stone", "stone", "stone",
	},
	7531,-26,-32
	-- 0.05,-26,-32
)
--]]


minetest.register_decoration({
	name = "gal:corals_1",
	deco_type = "simple",
	place_on = {"gal:sand", "gal:dirt_silt_02", },
	place_offset_y = -1,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 50, y = 50, z = 50},
		seed = 5150,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"warm_temperate_ocean",
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
	},
	y_max = -2,
	y_min = -12,
	flags = "force_placement",
	decoration = {
		"gal:coral_green_01", "gal:coral_pink_01",
		"gal:coral_blue_01", "gal:coral_brown",
		"gal:coral_orange_01", "gal:coral_skeleton",
		"gal:coral_blue_03", "gal:coral_red",
		"gal:coral_orange_03",
	},
})

minetest.register_decoration({
	name = "gal:corals_2",
	deco_type = "simple",
	place_on = {"gal:sand", "gal:dirt_silt_02", },
	place_offset_y = -1,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 50, y = 50, z = 50},
		seed = 7013,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"warm_humid_ocean",
		"warm_semihumid_ocean",
	},
	y_max = -4,
	y_min = -14,
	flags = "force_placement",
	decoration = {
		"gal:coral_green_02", "gal:coral_pink_02",
		"gal:coral_blue_02", "gal:coral_dragon_eye",
		"gal:coral_orange_02", "gal:coral_skeleton",
		"gal:coral_brain", "gal:coral_staghorn",
		"gal:coral_pink_03", "gal:plant_anemone",
	},
})

minetest.register_decoration({
	name = "gal:corals_3",
	deco_type = "schematic",
	place_on = {"gal:sand", "gal:dirt_silt_02", },
	place_offset_y = -1,
	-- sidelen = 16,
	-- fill_ratio = 0.02,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 64, y = 64, z = 64},
		seed = 41,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"hot_humid",
		"hot_semihumid",
		"hot_temperate",
		"warm_humid",
		"warm_semihumid",
		"warm_temperate",
		"temperate_humid",
		"temperate_semihumid",
		"temperate_temperate",
	},
	y_max = -12,
	y_min = -22,
	flags = "force_placement",
	schematic = gal.schem("coral_fire", "B=coral_orange_01,H=coral_fire_coral")
})
minetest.register_decoration({
	name = "gal:corals_4",
	deco_type = "schematic",
	place_on = {"gal:sand", "gal:dirt_silt_02", },
	place_offset_y = -1,
	-- sidelen = 16,
	-- fill_ratio = 0.02,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 64, y = 64, z = 64},
		seed = 41,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"hot_humid",
		"hot_semihumid",
		"hot_temperate",
		"warm_humid",
		"warm_semihumid",
		"warm_temperate",
		"temperate_humid",
		"temperate_semihumid",
		"temperate_temperate",
	},
	y_max = -24,
	y_min = -32,
	flags = "force_placement",
	schematic = gal.schem("coral_pillar", "B=coral_tube_coral,H=coral_bubble_coral")
})


--[[
	minetest.register_decoration({
		name = "gal:corals_3",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 41,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_brain_pink")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_4",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 44,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_brown")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_5",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 42,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_bubble")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_6",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 48,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_dragon_eye")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_7",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 43,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_fire")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_8",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 33,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -8,
		y_min = -14,
		flags = "force_placement",
		schematic = gal.schem("coral_horn")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_9",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 2,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -12,
		y_min = -16,
		flags = "force_placement",
		schematic = gal.schem("coral_orange_01")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_10",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 2,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -12,
		y_min = -16,
		flags = "force_placement",
		schematic = gal.schem("coral_pillar")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_11",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 1,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_sponge")
	})
--]]
--[[
	minetest.register_decoration({
		name = "gal:corals_12",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		-- sidelen = 16,
		-- fill_ratio = 0.02,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 64, y = 64, z = 64},
			seed = 14,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid",
			"hot_semihumid",
			"hot_temperate",
			"warm_humid",
			"warm_semihumid",
			"warm_temperate",
			"temperate_humid",
			"temperate_semihumid",
			"temperate_temperate",
		},
		y_max = -28,
		y_min = -52,
		flags = "force_placement",
		schematic = gal.schem("coral_tube")
	})
--]]


-- Kelp

minetest.register_decoration({
	name = "gal:giant_kelp",
	deco_type = "schematic",
	place_on = {"gal:sand", "gal:dirt_silt_02", },
	place_offset_y = -1,
	-- sidelen = 16,
	-- fill_ratio = 0.02,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 64, y = 64, z = 64},
		seed = 143,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"hot_humid",
		"hot_semihumid",
		"hot_temperate",
		"warm_humid",
		"warm_semihumid",
		"warm_temperate",
		"temperate_humid",
		"temperate_semihumid",
		"temperate_temperate",
	},
	y_max = -12,
	y_min = -52,
	flags = "force_placement",
	schematic = gal.schem("kelp", nil)
})

minetest.register_decoration({
	name = "gal:kelp_1",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 144,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_kelp_1"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:kelp_2",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 145,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_kelp_2"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:kelp_giant_brown",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 146,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_kelp_giant_brown"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:seaweed_temperate",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 147,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_seaweed_temperate"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:seaweed_tropical",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 148,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_seaweed_tropical"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:sea_pickle",
	deco_type = "simple",
	place_on = {"gal:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 149,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"temperate_humid_ocean",
		"temperate_semihumid_ocean",
		"temperate_temperate_ocean",
		"cool_humid_ocean",
		"cool_semihumid_ocean",
		"cool_temperate_ocean"
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {"gal:plant_sea_pickle"},
	param2 = 48,
	param2_max = 96,
})

-- Sea Grass
minetest.register_decoration({
	name = "gal:sea_grass",
	deco_type = "simple",
	place_on = {"gal:sand", },
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 87112,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"hot_semiarid_ocean",
		"warm_temperate_ocean",
		"warm_semiarid_ocean",
		"temperate_temperate_ocean",
		"temperate_semiarid_ocean",
		"cool_temperate_ocean",
		"cool_semiarid_ocean",
	},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = {
		"gal:grass_sea_1", "gal:grass_sea_2",
		"gal:grass_sea_3", "gal:grass_sea_subtropical",
		"gal:grass_sea_temperate", "gal:grass_sea_tropical",
	},
	param2 = 48,
	param2_max = 96,
})



--[[minetest.register_decoration({
	name = "gal:plant_waterlilies",
	deco_type = "simple",
	place_on = {"gal:liquid_water_source", "gal:liquid_water_river_source", "gal:liquid_water_river_muddy_source", "gal:liquid_water_swamp_source", "gal:liquid_water_dirty_source", },
	place_offset_y = 0,
	-- sidelen = 16,
	-- fill_ratio = 0.7,
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 87112,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		-- "hot_humid_swamp",
		-- "hot_semihumid_swamp",
		-- "warm_humid_swamp",
		-- "temperate_humid_swamp"
		"hot_humid",
		"hot_semihumid",
	},
	y_max = 2,
	y_min = 0,
	flags = "force_placement",
	decoration = {"gal:plant_waterlily_pink", "gal:plant_waterlily_yellow", },
	param2 = 48,
	param2_max = 96,
})
--]]
--
minetest.register_decoration({
	name = "gal:waterlily_pink_plant",
	-- deco_type = "simple",
	deco_type = "schematic",
	-- place_on = {"gal:liquid_water_source", "gal:liquid_water_river_source", "gal:liquid_water_river_muddy_source", "gal:liquid_water_swamp_source", "gal:liquid_water_dirty_source", },
	place_on = {"gal:dirt_mud_01", },
	--place_offset_y = 0,
	sidelen = 16,
	fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
	biomes = {
		-- "hot_humid_swamp",
		-- "hot_semihumid_swamp",
		-- "warm_humid_swamp",
		-- "temperate_humid_swamp"
		"hot_humid",
		"hot_semihumid",
	},
	-- y_max = tonumber(heights["lowland"]),
	y_max = 0,
	-- y_min = tonumber(heights["sea_level"]) + 1,
	y_min = 0,
	flags = "force_placement",
	schematic = gal.schem("plant_waterlily_pink", ""),
	--decoration = {"gal:plant_waterlily_pink", "gal:plant_waterlily_yellow", },
	--param2 = 48,
	--param2_max = 96,
	-- spawn_by = {"gal:liquid_water_source", "gal:liquid_water_river_source", "gal:liquid_water_river_muddy_source", "gal:liquid_water_swamp_source", "gal:liquid_water_dirty_source", },
	rotation = "random",
})
minetest.register_decoration({
	name = "gal:waterlily_pink_with_flower_plant",
	deco_type = "schematic",
	place_on = {"gal:dirt_mud_01", },
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		"hot_humid",
		"hot_semihumid",
	},
	y_max = 0,
	y_min = 0,
	flags = "force_placement",
	schematic = gal.schem("plant_waterlily_pink_with_flower", ""),
	rotation = "random",
})
minetest.register_decoration({
	name = "gal:waterlily_yellow_plant",
	deco_type = "schematic",
	place_on = {"gal:dirt_mud_01", },
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		"hot_humid",
		"hot_semihumid",
	},
	y_max = 0,
	y_min = 0,
	flags = "force_placement",
	schematic = gal.schem("plant_waterlily_yellow", ""),
	rotation = "random",
})
minetest.register_decoration({
	name = "gal:waterlily_yellow_with_flower_plant",
	deco_type = "schematic",
	place_on = {"gal:dirt_mud_01", },
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		"hot_humid",
		"hot_semihumid",
	},
	y_max = 0,
	y_min = 0,
	flags = "force_placement",
	schematic = gal.schem("plant_waterlily_yellow_with_flower", ""),
	rotation = "random",
})
--


--[[
minetest.register_decoration({
	name = "gal:reedmace_water",
	deco_type = "simple",
	place_on = {"gal:dirt_mud_01", },
	place_offset_y = -1,
	sidelen = 16,
	fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
	biomes = {
		"hot_humid_swamp",
		"hot_semihumid_swamp",
		"warm_humid_swamp",
		"temperate_humid_swamp"
	},
	y_max = 1,
	y_min = -1,
	flags = "force_placement",
	decoration = {"gal:plant_reedmace_water", "gal:plant_reedmace_sapling_water", },
	param2 = 48,
	param2_max = 96,
})
--]]
minetest.register_decoration({
	name = "gal:reedmace_01_plant",
	deco_type = "schematic",
	place_on = {"gal:dirt_mud_01", },
	--place_offset_y = 0,
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		-- "hot_humid_swamp",
		-- "hot_semihumid_swamp",
		-- "warm_humid_swamp",
		-- "temperate_humid_swamp"
		"hot_humid",
		"hot_semihumid",
	},
	--y_min = heights["beach_depth"] - gal.mapgen.biome_vertical_blend,
	y_min = 0,
	--y_max = heights["beach"] + gal.mapgen.biome_vertical_blend,
	y_max = 0,
	schematic = gal.schem("plant_reedmace_01", ""),
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
})
minetest.register_decoration({
	name = "gal:reedmace_02_plant",
	deco_type = "schematic",
	place_on = {"gal:dirt_mud_01", },
	--place_offset_y = 0,
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		-- "hot_humid_swamp",
		-- "hot_semihumid_swamp",
		-- "warm_humid_swamp",
		-- "temperate_humid_swamp"
		"hot_humid",
		"hot_semihumid",
	},
	--y_min = heights["beach_depth"] - gal.mapgen.biome_vertical_blend,
	y_min = 0,
	--y_max = heights["beach"] + gal.mapgen.biome_vertical_blend,
	y_max = 0,
	schematic = gal.schem("plant_reedmace_02", ""),
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
})


minetest.register_decoration({
	name = "gal:mangrove_roots",
	deco_type = "simple",
	place_on = {"gal:dirt_silt_01"},
	place_offset_y = -1,
	sidelen = 16,
	fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
	biomes = {
		"hot_humid_beach",
		"hot_semihumid_beach",
		"warm_humid_beach"
	},
	y_max = 1,
	y_min = -1,
	flags = "force_placement",
	decoration = {"gal:tree_mangrove_root"},
	param2 = 48,
	param2_max = 96,
})
--[[
minetest.register_decoration({
	name = "gal:mangrove_saplings",
	deco_type = "simple",
	place_on = {"gal:dirt_silt_01"},
	place_offset_y = -1,
	sidelen = 16,
	fill_ratio = 0.7,
	biomes = {
		"hot_humid_beach",
		"hot_semihumid_beach",
		"warm_humid_beach"
	},
	y_max = 1,
	y_min = 0,
	flags = "force_placement",
	decoration = {"gal:tree_mangrove_sapling"},
	param2 = 48,
	param2_max = 96,
})
minetest.register_decoration({
	name = "gal:mangrove_saplings",
	deco_type = "schematic",
	place_on = a,
	sidelen = 16,
	fill_ratio = tonumber(b),
	biomes = c,
	y_min = tonumber(d) or (heights[d] - gal.biome_vertical_blend),
	y_max = tonumber(e) or (heights[e] + gal.biome_vertical_blend),
	schematic = gal.schem(t_tree, t_replace),
	flags = g or "place_center_x, place_center_z, force_placement",
	rotation = "random",
})
--]]



-- for i, deco in ipairs(gal.lib.csv.read("|", gal.path .. "/gal_ecology_trees_decorations.csv")) do

	-- --#Deco_Type, Place_On, FillRatio, Biome, Y_Min, Y_Max, Deco_Node, HeightMax, SpawnBy, NumSpawnBy
	-- local decotype, placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby = unpack(deco)


	-- --minetest.log(S("[MOD] gal: " .. decotype .. "; " .. placeon .. "; " .. biome .. "; " .. deconode))


	-- if decotype then
		-- if decotype ~= "" then
			-- -- if decotype == "node" then
				-- -- add_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			-- -- end

			-- -- if decotype == "water_node" then
				-- -- add_water_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			-- -- end

			-- -- if decotype == "schem" then
				-- -- -- if heightmax == "" then
					-- -- -- add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				-- -- -- else
					-- -- -- add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- -- -- end
			-- -- end

			-- -- if decotype == "newschem" then
				-- -- if heightmax == "" then
					-- -- new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				-- -- else
					-- -- new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- -- end
			-- -- end

			-- -- if decotype == "trees" then
				-- -- if heightmax == "" then
					-- -- add_tree(placeon, fillratio, biome, ymin, ymax, deconode)
				-- -- else
					-- -- add_tree(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- -- end
			-- -- end

			-- if decotype == "shroom" then
				-- if heightmax == "" then
					-- add_tree(placeon, fillratio, biome, ymin, ymax, deconode)
				-- else
					-- add_tree(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- end
			-- end

			-- -- if decotype == "plants" then
				-- -- if heightmax == "" then
					-- -- add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
				-- -- else
					-- -- add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- -- end
			-- -- end

			-- -- if decotype == "no_rot" then
				-- -- -- if heightmax == "" then
					-- -- -- add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode)
				-- -- -- else
					-- -- -- add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				-- -- -- end
			-- -- end

			-- -- if decotype == "water_schem" then
				-- -- add_schem_water(placeon, fillratio, biome, ymin, ymax, deconode)
			-- -- end

		-- end
	-- end

-- end










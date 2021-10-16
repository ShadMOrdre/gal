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

local add_schem = function(a, b, c, d, e, f, g)

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

local new_add_schem = function(a, b, c, d, e, f, g)

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

local add_tree = function(a, b, c, d, e, f, g)

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

local add_shroom = function(a, b, c, d, e, f, g)

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

local add_plant = function(a, b, c, d, e, f, g, h, i)

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

local add_schem_no_rot = function(a, b, c, d, e, f, g)

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

local add_schem_water = function(a, b, c, d, e, f, g, h)

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

local add_node = function(a, b, c, d, e, f, g, h, i)

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

local add_water_node = function(a, b, c, d, e, f, g, h, i)

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
		name = "gal:corals_" .. tostring(f) .. "",
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
		decoration = f,
		param2 = 48,
		param2_max = 96,
	})
end


--TREES
--

local deco_tree = function(tname,tbiomes,tsoils,tgrasses,tdensity,tymin,tymax)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. "_" .. bname .. ""
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. "_" .. bname .. ""
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	end
	

	minetest.register_decoration({
		name = "gal:" .. tname .. "_tree",
		deco_type = "schematic",
		place_on = tdirts,
		sidelen = 16,
		fill_ratio = tonumber(tdensity),
		biomes = tbiomes,
		y_min = tonumber(tymin) or (heights[tymin] - gal.mapgen.biome_vertical_blend),
		y_max = tonumber(tymax) or (heights[tymax] + gal.mapgen.biome_vertical_blend),
		schematic = gal.schem(tname, nil),
		flags = "place_center_x, place_center_z, force_placement",
		--rotation = "random",
	})

end

--deco_tree("tree","dirt","biomes","density","minheight","maxheight")
--[[
deco_tree("acacia_01",					"warm_semiarid",						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("acacia_shoestring_01",		"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("apple_01",					"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("ash_01",						"temperate_temperate", "temperate_semiarid",},								{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("aspen_01",					"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("bamboo_temperate_01",		"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("bamboo_tropical_01",			"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("banksia_bull_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("baobab_01",					"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("beech_01",					"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("beech_black_01",				"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("beech_mountain_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("beech_southern_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("birch_sweet_01",				"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("birch_yellow_01",			"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("bloodwood_swamp_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("boab_01",					"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("bottlebrush_red_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("box_black_01",				"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("box_cloncurry_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("box_white_01",				"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("acacia_01",				"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("chestnut_01",				"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("conifers_01",				"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "",},			{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","highland")
deco_tree("cypress_01",					"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("ebony",						"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("eucalyptus_01",				"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("fir_01",						"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "",},			{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","highland")
deco_tree("jungle_01",					"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("kapok_01",					"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("larch_01",					"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "",},			{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","highland")
deco_tree("mahogany",					"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("mangrove_red_01",			"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("maple_01",					"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("oak_01",						"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_brown", "_clayey", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("palm_coconut_01",			"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("palm_fountain_01",			"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("palm_royal_01",				"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("pine_01",					"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_brown", "_clayey", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("poplar_01",					"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("spruce_01",					"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "",},			{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","highland")
deco_tree("teak_01",					"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("wattle_golden_01",			"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("willow_01",					"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("yellowwood_01",				"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "",},			{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("yew_01",						"temperate_humid",			{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("yew_01",						"temperate_semihumid",		{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","highland")
--]]
--
--deco_tree("acacia_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "",},			0.003,"beach","highland")
deco_tree("acacia_01",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_02",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_03",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_04",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_05",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_06",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("acacia_07",					{"warm_semiarid", "warm_semiarid", "warm_semiarid",},						{"_black", "_brown", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
--deco_tree("acacia_01",				{"warm_semiarid",},															{"_black",},						{"grass",},						0.003,"beach","highland")
--deco_tree("acacia_01",				{"warm_semiarid",},															{"_brown",},						{"grass",},						0.003,"beach","highland")
--deco_tree("acacia_01",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","highland")

deco_tree("acacia_shoestring_01",		{"warm_semiarid", "warm_arid",},											{"_clayey", "_clayey",},			{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("acacia_shoestring_02",		{"warm_semiarid", "warm_arid",},											{"_clayey", "_clayey",},			{"grass", "grass", "grass",},	0.003,"beach","coastal")

deco_tree("apple_01",					{"temperate_temperate",},													{"_black",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("apple_02",					{"temperate_temperate",},													{"_black",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("apple_03",					{"temperate_temperate",},													{"_black",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("apple_04",					{"temperate_temperate",},													{"_black",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("apple_05",					{"temperate_temperate",},													{"_black",},						{"grass",},						0.003,"coastal","shelf")

deco_tree("ash_01",						{"temperate_semihumid", "temperate_semihumid", "temperate_temperate",},		{"_black", "_brown", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("ash_02",						{"temperate_semihumid", "temperate_semihumid", "temperate_temperate",},		{"_black", "_brown", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("aspen_01",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("aspen_02",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("aspen_03",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("aspen_04",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("aspen_05",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("aspen_06",					{"cool_semihumid", "cool_temperate",},										{"_black", "_brown",},	{"litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")

--deco_tree("bamboo_small",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")

deco_tree("bamboo_temperate_01",		{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("bamboo_temperate_02",		{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("bamboo_tropical_01",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("bamboo_tropical_02",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("bamboo_tropical_03",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("bamboo_tropical_04",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_silty",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")

deco_tree("banana",						{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("banksia_bull_01",			{"warm_semihumid", "warm_temperate",},										{"_black", "_brown",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("banksia_bull_02",			{"warm_semihumid", "warm_temperate",},										{"_black", "_brown",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("banksia_coast_01",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("banksia_coast_02",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("banksia_coast_03",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("banksia_coast_04",			{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("baobab_01",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("baobab_02",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("baobab_03",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("baobab_04",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("beech_01",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"beach","shelf")
deco_tree("beech_02",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"beach","shelf")
deco_tree("beech_03",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"beach","shelf")

deco_tree("beech_black_01",				{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("beech_black_02",				{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("beech_mountain_01",			{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("beech_mountain_02",			{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")

deco_tree("beech_southern_01",			{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("beech_southern_02",			{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("beech_southern_03",			{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("birch_sweet_01",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("birch_sweet_02",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("birch_sweet_03",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("birch_sweet_04",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")

deco_tree("birch_yellow_01",			{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("birch_yellow_02",			{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("birch_yellow_03",			{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("birch_yellow_04",			{"temperate_semihumid", "temperate_temperate",},							{"_black", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("bloodwood_swamp_01",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy", "",},			{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("bloodwood_swamp_02",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy", "",},			{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("boab_01",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("boab_02",					{"warm_semiarid", "warm_semiarid",},										{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("bottlebrush_red_01",			{"temperate_humid",},														{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("bottlebrush_red_02",			{"temperate_humid",},														{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("bottlebrush_red_03",			{"temperate_humid",},														{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("bottlebrush_red_04",			{"temperate_humid",},														{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("box_black_01",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("box_black_02",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("box_black_03",				{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("box_cloncurry_01",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("box_cloncurry_02",			{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("box_white_01",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("box_white_02",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("box_white_03",				{"warm_semihumid", "warm_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("brazilnut_01",				{"warm_humid", "warm_humid",},												{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("brazilnut_02",				{"warm_humid", "warm_humid",},												{"_clayey", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("cabbage_01",					{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("cabbage_02",					{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("capirona_01",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("capirona_02",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("capirona_03",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("capirona_04",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("capirona_05",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","shelf")
deco_tree("capirona_06",				{"hot_humid",},																{"_clayey",},						{"grass",},						0.003,"coastal","shelf")

deco_tree("cedar_01",					{"temperate_temperate", "temperate_temperate",},							{"_brown", "_clayey",},				{"grass", "grass",},			0.003,"shelf","highland")
deco_tree("cedar_02",					{"temperate_temperate", "temperate_temperate",},							{"_brown", "_clayey",},				{"grass", "grass",},			0.003,"shelf","highland")
deco_tree("cedar_03",					{"temperate_temperate", "temperate_temperate",},							{"_brown", "_clayey",},				{"grass", "grass",},			0.003,"shelf","highland")

--deco_tree("cherry",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

--deco_tree("cherry_01",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("cherry_02",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("cherry_03",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("cherry_04",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

--
deco_tree("cherry_blossom",				{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("chestnut_01",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("chestnut_02",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("chestnut_03",				{"temperate_semihumid", "temperate_temperate",},							{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("chestnut_american_01",		{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("chestnut_american_02",		{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("chestnut_american_03",		{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("clementine",					{"warm_temperate", "warm_semiarid",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("cocoa_01",					{"hot_humid", "hot_humid",},												{"_brown", "_clayey",},				{"litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")
deco_tree("cocoa_02",					{"hot_humid", "hot_humid",},												{"_brown", "_clayey",},				{"litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")

deco_tree("common_daisy_01",			{"warm_semihumid", "warm_semihumid", "warm_temperate",},					{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("common_daisy_02",			{"warm_semihumid", "warm_semihumid", "warm_temperate",},					{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("conifers_01",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_black", "_black",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("conifers_02",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"lowland","highland")
deco_tree("conifers_03",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_sandy", "_sandy", "_sandy",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"beach","coastal")
deco_tree("conifers_04",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_clayey", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"beach","lowland")
deco_tree("conifers_05",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_sandy", "_sandy", "_sandy",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"coastal","lowland")
deco_tree("conifers_06",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_clayey", "_clayey", "_clayey",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"coastal","shelf")
deco_tree("conifers_07",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.008,"lowland","shelf")

deco_tree("coolabah_01",				{"hot_temperate", "hot_temperate",},										{"_black", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("coolabah_02",				{"hot_temperate", "hot_temperate",},										{"_black", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("coolabah_03",				{"hot_temperate", "hot_temperate",},										{"_black", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("coolabah_04",				{"hot_temperate", "hot_temperate",},										{"_black", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("coolabah_05",				{"hot_temperate", "hot_temperate",},										{"_black", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("cypress_01",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("cypress_02",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("cypress_03",					{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("daintree_stringybark_01",	{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("daintree_stringybark_02",	{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")

--
deco_tree("default_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

--
deco_tree("dry_01",						{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")

deco_tree("ebony",						{"hot_humid", "hot_semihumid",},											{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

--
deco_tree("eucalyptus_01",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","shelf")
deco_tree("eucalyptus_02",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","shelf")

deco_tree("eucalyptus_lemon_01",		{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","lowland")
deco_tree("eucalyptus_lemon_02",		{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("fern_silver_01",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("fern_silver_02",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("fig_01",						{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("fig_02",						{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("fig_03",						{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("fig_moreton_bay_01",			{"warm_temperate", "warm_semiarid",},										{"_brown", "_brown",},				{"grass", "grass",},			0.0005,"beach","lowland")
deco_tree("fig_moreton_bay_02",			{"warm_temperate", "warm_semiarid",},										{"_brown", "_brown",},				{"grass", "grass",},			0.0005,"beach","lowland")
deco_tree("fig_moreton_bay_03",			{"warm_temperate", "warm_semiarid",},										{"_brown", "_brown",},				{"grass", "grass",},			0.0005,"beach","lowland")

deco_tree("fir_coast_01",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("fir_coast_02",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")

deco_tree("fir_doug_01",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","coastal")
deco_tree("fir_doug_02",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","coastal")

deco_tree("fir_01",						{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","lowland")
deco_tree("fir_02",						{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","lowland")

deco_tree("frost",						{"cold_temperate",},														{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("ginkgo",						{"warm_temperate",},														{"_silty",},						{"grass",},						0.003,"beach","lowland")

deco_tree("gum_blue_01",				{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("gum_blue_02",				{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("gum_blue_03",				{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("gum_blue_04",				{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("gum_red_river_01",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.0005,"beach","coastal")
deco_tree("gum_red_river_02",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.0005,"beach","coastal")
deco_tree("gum_red_river_03",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.0005,"beach","coastal")
deco_tree("gum_red_river_04",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.0005,"beach","coastal")
deco_tree("gum_red_river_05",			{"hot_semihumid", "hot_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.0005,"beach","coastal")

deco_tree("gum_scribbly_01",			{"warm_temperate",},														{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("gum_scribbly_02",			{"warm_temperate",},														{"_sandy",},						{"grass",},						0.003,"beach","coastal")

deco_tree("gum_snow_01",				{"warm_temperate",},														{"_sandy",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("gum_snow_02",				{"warm_temperate",},														{"_sandy",},						{"grass",},						0.003,"lowland","shelf")

deco_tree("gum_sugar_01",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("gum_sugar_02",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("gum_sugar_03",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("gum_sugar_04",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("gum_swamp_01",				{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("gum_swamp_02",				{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("illawarra_flame_01",			{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","coastal")
deco_tree("illawarra_flame_02",			{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","coastal")

deco_tree("ipe_yellow",					{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("jarrah_01",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")
deco_tree("jarrah_02",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")
deco_tree("jarrah_03",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")

deco_tree("jungle_01",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_black", "_black",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"lowland","highland")
deco_tree("jungle_02",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_brown", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"lowland","highland")
deco_tree("jungle_03",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_brown", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"beach","coastal")
deco_tree("jungle_04",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_black", "_black",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"beach","coastal")
deco_tree("jungle_05",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_brown", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"beach","lowland")
deco_tree("jungle_06",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_brown", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"beach","lowland")
deco_tree("jungle_07",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_black", "_black",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"coastal","shelf")
deco_tree("jungle_08",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_brown", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.005,"coastal","shelf")

deco_tree("jungle_green_01",			{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("jungle_green_02",			{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("jungle_green_03",			{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("kahikatea_01",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("kahikatea_02",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("kamahi_01",					{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("kamahi_02",					{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")

deco_tree("kapok_01",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"beach","shelf")
deco_tree("kapok_02",					{"hot_humid", "hot_semihumid", "hot_temperate",},							{"_black", "_brown", "_brown",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"beach","shelf")

deco_tree("karaka_01",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("karaka_02",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("karo_01",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"beach","coastal")
deco_tree("karo_02",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"beach","coastal")

deco_tree("karri_01",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")
deco_tree("karri_02",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")
deco_tree("karri_03",					{"hot_temperate",},															{"_sandy",},						{"grass",},						0.001,"beach","coastal")

deco_tree("kauri_01",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("kauri_02",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("kawakawa_01",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("kawakawa_02",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("kowhai_01",					{"warm_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","coastal")
deco_tree("kowhai_02",					{"warm_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","coastal")

deco_tree("larch_01",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"coastal","highland")
deco_tree("larch_02",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"coastal","highland")
deco_tree("larch_03",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"coastal","highland")

deco_tree("laurel_01",					{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("laurel_02",					{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("laurel_03",					{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","lowland")

deco_tree("lavender",					{"warm_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","lowland")

deco_tree("lemon",						{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","lowland")

deco_tree("lilly_pilly_01",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("lilly_pilly_02",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("lilly_pilly_03",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("lilly_pilly_04",				{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("lumin_spore_01",				{"cold_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","coastal")

deco_tree("macadamia_01",				{"warm_temperate",},														{"_black",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("macadamia_02",				{"warm_temperate",},														{"_black",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("macadamia_03",				{"warm_temperate",},														{"_black",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("mahoe_01",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("mahoe_02",					{"warm_semihumid",},														{"_brown",},						{"grass",},						0.003,"beach","lowland")

deco_tree("mahogany",					{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","lowland")

deco_tree("mamaku_01",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")
deco_tree("mamaku_02",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","coastal")

deco_tree("mangrove_apple_01",			{"hot_semihumid", "warm_humid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_apple_02",			{"hot_semihumid", "warm_humid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_apple_03",			{"hot_semihumid", "warm_humid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")

deco_tree("mangrove_black_01",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_black_02",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_black_03",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")

deco_tree("mangrove_grey_01",			{"hot_semihumid", "warm_humid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")

--deco_tree("mangrove_palm_01",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("mangrove_red_01",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_red_02",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")
deco_tree("mangrove_red_03",			{"hot_humid", "hot_semihumid",},											{"_silt_01", "_silt_01",},			{"dirt", "dirt",},				0.003,"beach_depth","beach")

deco_tree("mangrove_stilted_01",		{"warm_humid",},															{"_silt_01",},						{"dirt",},						0.003,"beach_depth","beach")

deco_tree("mangrove_white_01",			{"warm_humid",},															{"_silt_01",},						{"dirt",},						0.003,"beach_depth","beach")
deco_tree("mangrove_white_02",			{"warm_humid",},															{"_silt_01",},						{"dirt",},						0.003,"beach_depth","beach")
deco_tree("mangrove_white_03",			{"warm_humid",},															{"_silt_01",},						{"dirt",},						0.003,"beach_depth","beach")

deco_tree("manuka_01",					{"warm_temperate",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("manuka_02",					{"warm_temperate",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("maple_01",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("maple_02",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("maple_sugar_01",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("maple_sugar_02",				{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_black", "_black", "_black",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("marri_01",					{"warm_temperate",},														{"_sandy",},						{"grass",},						0.0005,"beach","lowland")
deco_tree("marri_02",					{"warm_temperate",},														{"_sandy",},						{"grass",},						0.0005,"beach","lowland")
deco_tree("marri_03",					{"warm_temperate",},														{"_sandy",},						{"grass",},						0.0005,"beach","lowland")

deco_tree("matagouri_01",				{"warm_temperate",},														{"_silty",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("matagouri_02",				{"warm_temperate",},														{"_silty",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("merbau_01",					{"warm_humid",},															{"_silt_01",},						{"dirt",},						0.003,"beach","coastal")

deco_tree("mesquite_01",				{"temperate_temperate", "temperate_semiarid",},								{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("mesquite_02",				{"temperate_temperate", "temperate_semiarid",},								{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("mirabelle",					{"temperate_temperate", "temperate_semiarid",},								{"_black", "_black",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("miro_01",					{"warm_temperate",},														{"_black",},						{"grass",},						0.003,"beach","lowland")
deco_tree("miro_02",					{"warm_temperate",},														{"_black",},						{"grass",},						0.003,"beach","lowland")

--deco_tree("mossy_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("mulga_01",					{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","lowland")
deco_tree("mulga_02",					{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","lowland")

deco_tree("myrtle_lemon_01",			{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","lowland")
deco_tree("myrtle_lemon_02",			{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","lowland")

deco_tree("myrtle_tasmanian_01",		{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","shelf")
deco_tree("myrtle_tasmanian_02",		{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","shelf")
deco_tree("myrtle_tasmanian_03",		{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","shelf")

deco_tree("oak_01",						{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("oak_02",						{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("oak_03",						{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("oak_desert_01",				{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","shelf")
deco_tree("oak_desert_02",				{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","shelf")
deco_tree("oak_desert_03",				{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","shelf")
deco_tree("oak_desert_04",				{"warm_semiarid", "warm_arid",},											{"_sandy", "sand",},				{"grass", "stone",},				0.003,"coastal","shelf")

deco_tree("oak_red_01",					{"temperate_humid", "temperate_semihumid",},								{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("oak_red_02",					{"temperate_humid", "temperate_semihumid",},								{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("oak_red_03",					{"temperate_humid", "temperate_semihumid",},								{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("oak_river_01",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("oak_river_02",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("oak_river_03",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("oak_river_04",				{"warm_semihumid", "warm_temperate",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"coastal","shelf")

--deco_tree("oak_river_small_01",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("oak_river_small_02",		{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("oak_river_small_03",		{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("oak_river_small_04",		{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("oak_southern_01",			{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("oak_southern_02",			{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("oak_southern_03",			{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("oak_white_01",				{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("oak_white_02",				{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("oak_white_03",				{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("orange",						{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","coastal")

deco_tree("pahautea_01",				{"warm_humid",},															{"_black",},						{"grass",},					0.003,"lowland","shelf")
deco_tree("pahautea_02",				{"warm_humid",},															{"_black",},						{"grass",},					0.003,"lowland","shelf")

deco_tree("palm_coconut_01",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("palm_coconut_02",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("palm_coconut_03",			{"hot_semihumid", "hot_temperate",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("palm_date_01",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("palm_date_02",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("palm_date_03",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("palm_date_04",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("palm_date_05",				{"hot_semiarid", "warm_semiarid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("palm_doum_01",				{"hot_arid",},																{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("palm_doum_02",				{"hot_arid",},																{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("palm_doum_03",				{"hot_arid",},																{"_sandy",},						{"grass",},						0.003,"beach","coastal")

deco_tree("palm_fan_01",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"beach","shelf")

deco_tree("palm_fountain_01",			{"hot_semihumid", "hot_temperate", "warm_semihumid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_fountain_02",			{"hot_semihumid", "hot_temperate", "warm_semihumid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_fountain_03",			{"hot_semihumid", "hot_temperate", "warm_semihumid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("palm_jungle_01",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")
deco_tree("palm_jungle_02",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","shelf")

deco_tree("palm_moriche_01",			{"hot_semihumid", "hot_semihumid", "warm_semihumid",},						{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_moriche_02",			{"hot_semihumid", "hot_semihumid", "warm_semihumid",},						{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_moriche_03",			{"hot_semihumid", "hot_semihumid", "warm_semihumid",},						{"_sandy", "_sandy", "_sandy",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("palm_nikau_01",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"beach","shelf")
deco_tree("palm_nikau_02",				{"warm_semihumid",},														{"_sandy",},						{"grass",},						0.003,"beach","shelf")

deco_tree("palm_royal_01",				{"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_royal_02",				{"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("palm_royal_03",				{"hot_semihumid", "hot_temperate", "hot_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("palm_windmill_01",			{"warm_temperate", "temperate_temperate",},									{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("palm_windmill_02",			{"warm_temperate", "temperate_temperate",},									{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("palm_windmill_03",			{"warm_temperate", "temperate_temperate",},									{"_brown", "_brown",},				{"grass", "grass",},			0.003,"coastal","shelf")

--deco_tree("palmetto_01",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("paperbark_01",				{"warm_humid", "warm_semihumid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("paperbark_02",				{"warm_humid", "warm_semihumid",},											{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("paperbark_swamp_01",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("paperbark_swamp_02",			{"warm_humid", "warm_semihumid",},											{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("pine_01",					{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_clayey", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("pine_02",					{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_clayey", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("pine_03",					{"temperate_semihumid", "temperate_temperate", "temperate_semiarid",},		{"_clayey", "_clayey", "_clayey",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("pine_celery_top_01",			{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("pine_celery_top_02",			{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("pine_huon_01",				{"warm_semihumid",},														{"_black",},						{"grass",},						0.003,"coastal","shelf")

--RENAME TALL STRAIGHT MODELS TO PONDEROSA PINE
deco_tree("pine_lodgepole_01",			{"temperate_temperate", "temperate_semiarid",},								{"_clayey", "_clayey",},			{"grass", "grass",},			0.003,"lowland","highland")
deco_tree("pine_lodgepole_02",			{"temperate_temperate", "temperate_semiarid",},								{"_clayey", "_clayey",},			{"grass", "grass",},			0.003,"lowland","highland")
deco_tree("pine_lodgepole_03",			{"temperate_temperate", "temperate_semiarid",},								{"_clayey", "_clayey",},			{"grass", "grass",},			0.003,"lowland","highland")

deco_tree("pine_pinyon_01",				{"temperate_semiarid",},													{"_clayey",},						{"grass",},						0.003,"lowland","highland")
deco_tree("pine_pinyon_02",				{"temperate_semiarid",},													{"_clayey",},						{"grass",},						0.003,"lowland","highland")
deco_tree("pine_pinyon_03",				{"temperate_semiarid",},													{"_clayey",},						{"grass",},						0.003,"lowland","highland")

deco_tree("pine_rottnest_island_01",	{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},			0.003,"beach","coastal")
deco_tree("pine_rottnest_island_02",	{"warm_temperate", "warm_semiarid",},										{"_clayey", "_clayey",},			{"grass", "grass",},			0.003,"beach","coastal")

deco_tree("pohutukawa_01",				{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","coastal")
deco_tree("pohutukawa_02",				{"warm_humid",},															{"_brown",},						{"grass",},						0.003,"beach","coastal")

deco_tree("poplar_01",					{"temperate_temperate",},													{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("poplar_02",					{"temperate_temperate",},													{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("poplar_03",					{"temperate_temperate",},													{"_brown",},						{"grass",},						0.003,"beach","lowland")

--deco_tree("poplar_small_01",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("poplar_small_02",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("poplar_small_03",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("poplar_small_04",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("poplar_small_05",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("quandong_01",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","lowland")
deco_tree("quandong_02",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","lowland")
deco_tree("quandong_03",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","lowland")
deco_tree("quandong_04",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","lowland")
deco_tree("quandong_05",				{"warm_semiarid",},															{"_clayey",},						{"grass",},						0.003,"beach","lowland")

deco_tree("rangiora_01",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("rangiora_02",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("redwood_01",					{"temperate_humid",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("redwood_02",					{"temperate_humid",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("redwood_coast_01",			{"temperate_humid",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("redwood_coast_02",			{"temperate_humid",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")
deco_tree("redwood_coast_03",			{"temperate_humid",},														{"_clayey",},						{"grass",},						0.003,"coastal","lowland")

deco_tree("rimu_01",					{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("rimu_02",					{"warm_humid", "warm_semihumid",},											{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("rubber_01",					{"hot_humid", "hot_humid", "hot_semihumid",},									{"_clayey", "_sandy", "_sandy",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")
deco_tree("rubber_02",					{"hot_humid", "hot_humid", "hot_semihumid",},									{"_clayey", "_sandy", "_sandy",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")
deco_tree("rubber_03",					{"hot_humid", "hot_humid", "hot_semihumid",},									{"_clayey", "_sandy", "_sandy",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")
deco_tree("rubber_04",					{"hot_humid", "hot_humid", "hot_semihumid",},									{"_clayey", "_sandy", "_sandy",},	{"litter_rainforest", "litter_rainforest", "litter_rainforest",},	0.003,"coastal","lowland")

deco_tree("sakura",						{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("sassafras_southern_01",		{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("sassafras_southern_02",		{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("sassafras_southern_03",		{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("sassafras_southern_04",		{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")

deco_tree("scorched_01",				{"warm_temperate", "temperate_temperate", "cool_temperate",},				{"_grey", "_grey", "_grey",},		{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("scorched_02",				{"warm_temperate", "temperate_temperate", "cool_temperate",},				{"_grey", "_grey", "_grey",},		{"grass", "grass", "grass",},	0.003,"beach","highland")
deco_tree("scorched_03",				{"warm_temperate", "temperate_temperate", "cool_temperate",},				{"_grey", "_grey", "_grey",},		{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("sequoia_01",					{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("sequoia_02",					{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("sequoia_03",					{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")

deco_tree("sequoia_giant_01",			{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("sequoia_giant_02",			{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("sequoia_giant_03",			{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")
deco_tree("sequoia_giant_04",			{"temperate_semihumid",},													{"_clayey",},						{"grass",},						0.003,"lowland","shelf")

deco_tree("spruce_01",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_02",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_03",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_04",					{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")

deco_tree("spruce_sitka_01",			{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_sitka_02",			{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_sitka_03",			{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
deco_tree("spruce_sitka_04",			{"cool_humid", "cool_semihumid", "cool_temperate",},						{"_brown", "_brown", "_brown",},	{"litter_coniferous", "litter_coniferous", "litter_coniferous",},	0.003,"beach","shelf")
--deco_tree("spruce_sitka_05",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")
--deco_tree("spruce_sitka_06",			{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","highland")

deco_tree("tawa_01",					{"warm_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","lowland")
deco_tree("tawa_02",					{"warm_temperate",},														{"_brown",},						{"grass",},						0.003,"beach","lowland")

deco_tree("tea_01",						{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("tea_02",						{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("tea_03",						{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")
deco_tree("tea_04",						{"warm_humid",},															{"_sandy",},						{"grass",},						0.003,"beach","coastal")

deco_tree("teak_01",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("teak_02",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("teak_03",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")
deco_tree("teak_04",					{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_brown", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"beach","lowland")

deco_tree("totara_01",					{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")
deco_tree("totara_02",					{"warm_semihumid", "warm_temperate",},										{"_black", "_black",},				{"grass", "grass",},			0.003,"coastal","shelf")

deco_tree("wattle_black_01",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_black_02",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_black_03",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_black_04",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("wattle_golden_01",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_golden_02",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_golden_03",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wattle_golden_04",			{"temperate_semihumid", "temperate_temperate",},							{"_brown", "_brown",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("wheki_01",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","lowland")
deco_tree("wheki_02",					{"warm_humid",},															{"_black",},						{"grass",},						0.003,"beach","lowland")

deco_tree("willow_01",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("willow_02",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("willow_03",					{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")

deco_tree("wirewood_01",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wirewood_02",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("wirewood_03",				{"warm_temperate", "warm_semiarid",},										{"_silty", "_silty",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("woollybutt_darwin_01",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("woollybutt_darwin_02",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("woollybutt_darwin_03",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")
deco_tree("woollybutt_darwin_04",		{"warm_temperate", "warm_semiarid",},										{"_sandy", "_sandy",},				{"grass", "grass",},			0.003,"beach","lowland")

deco_tree("yellow_healing",				{"warm_semihumid", "warm_temperate", "warm_semiarid",},						{"_black", "_brown", "_brown",},	{"grass", "grass", "grass",},	0.003,"coastal","shelf")

deco_tree("yellowwood_01",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("yellowwood_02",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")
deco_tree("yellowwood_03",				{"warm_semihumid", "warm_temperate",},										{"_brown", "_brown",},				{"grass", "grass",},			0.003,"lowland","shelf")

deco_tree("yew_01",						{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("yew_02",						{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")
deco_tree("yew_03",						{"temperate_humid", "temperate_semihumid",},								{"_black", "_brown",},				{"grass", "grass", "grass",},	0.003,"beach","coastal")


--[[
deco_tree("acacia_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("acacia_shoestring_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("apple_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("ash_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("aspen_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("bamboo_small",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("bamboo_temperate_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("bamboo_tropical_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("banana",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("banksia_bull_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("banksia_coast_big_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("banksia_coast_small_01",	{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("baobab_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("beech_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("beech_black_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("beech_mountain_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("beech_southern_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("birch_sweet_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("birch_yellow_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("bloodwood_swamp_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("boab_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("bottlebrush_red_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("box_black_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("box_cloncurry_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("box_white_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("brazilnut_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("cabbage_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("capirona_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("cedar_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("cherry_blossom",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("cherry",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("cherry_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("chestnut_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("chestnut_american_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("clementine",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("cocoa_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("common_daisy_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("conifers_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("coolabah_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("cypress_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("daintree_stringybark_01",	{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("default_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("dry_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("ebony",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("eucalyptus_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("eucalyptus_lemon_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fern_silver_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fig_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fig_moreton_bay_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fir_coast_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fir_doug_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("fir_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("frost",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("ginkgo",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_blue_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_red_river_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_scribbly_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_snow_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_sugar_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("gum_swamp_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("illawarra_flame_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("ipe_yellow",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("jarrah_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("jungle_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("jungle_green_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kahikatea_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kamahi_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kapok_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("karaka_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("karo_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("karri_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kauri_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kawakawa_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("kowhai_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("larch_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("laurel_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("lavender",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("lemon",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("lilly_pilly_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("lumin_spore_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("macadamia_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mahoe_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mahogany",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mamaku_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_red_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_black_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_apple_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_grey_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("mangrove_palm_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_stilted_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mangrove_white_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("manuka_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("maple_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("maple_sugar_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("marri_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("matagouri_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("merbau_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mesquite_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mirabelle",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("miro_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("mossy_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("mulga_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("myrtle_lemon_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("myrtle_tasmanian_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_desert_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_red_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_river_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_southern_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("oak_white_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("orange",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pahautea_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_coconut_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_date_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_doum_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_fan_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_fountain_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_jungle_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_moriche_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_nikau_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_royal_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("palm_windmill_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("palmetto_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("paperbark_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("paperbark_swamp_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--deco_tree("petrified_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_celery_top_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_huon_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_lodgepole_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_pinyon_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pine_rottnest_island_01",	{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("pohutukawa_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("poplar_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("poplar_small_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("quandong_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("rangiora_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("redwood_coast_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("redwood_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("rimu_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("rubber_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("sakura",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("sassafras_southern_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("scorched_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("sequoia_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("sequoia_giant_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("spruce_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("spruce_sitka_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("tawa_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("tea_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("teak_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("totara_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("wattle_black_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("wattle_golden_01",			{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("wheki_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("willow_01",					{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("wirewood_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("woollybutt_darwin_01",		{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("yellowwood_01",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("yellow_healing",				{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
deco_tree("yew_01",						{"gal:dirt_with_grass_warm_semihumid", "gal:dirt_with_grass_warm_temperate",},{"warm_semihumid", "warm_temperate",},0.003,"beach","highland")
--]]

--
--[[
	minetest.register_decoration({
		name = "gal:redwood_coast_01_tree",
		deco_type = "schematic",
		place_on = {"gal:dirt_with_grass_warm_semihumid", },
		sidelen = 16,
		fill_ratio = 0.003,
		biomes = {
			"warm_semihumid",
		},
		y_min = 6,
		y_max = heights["shelf"] + gal.biome_vertical_blend,
		schematic = gal.schem("redwood_coast_01", nil),
		flags = "place_center_x, place_center_z, force_placement",
		--rotation = "random",
	})
	minetest.register_decoration({
		name = "gal:redwood_coast_02_tree",
		deco_type = "schematic",
		place_on = {"gal:dirt_with_grass_warm_semihumid", },
		sidelen = 16,
		fill_ratio = 0.003,
		biomes = {
			"warm_semihumid",
		},
		y_min = 6,
		y_max = heights["shelf"] + gal.biome_vertical_blend,
		schematic = gal.schem("redwood_coast_02", nil),
		flags = "place_center_x, place_center_z, force_placement",
		--rotation = "random",
	})
--
	minetest.register_decoration({
		name = "gal:acacia_03_tree",
		deco_type = "schematic",
		place_on = {"gal:dirt_with_grass_warm_semihumid", },
		sidelen = 16,
		fill_ratio = 0.003,
		biomes = {
			"warm_semihumid",
		},
		y_min = 6,
		y_max = heights["shelf"] + gal.biome_vertical_blend,
		schematic = gal.schem("acacia_03", nil),
		flags = "place_center_x, place_center_z, force_placement",
		--rotation = "random",
	})
--]]


-- PLANTS

local deco_plant = function(tname,tbiomes,tsoils,tgrasses,tdensity,tymin,tymax)

	local tdirts = {}
	
	for bi,bname in pairs(tbiomes) do
		if tsoils[bi] == "" then
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. "_" .. bname .. ""
			else
				tdirts[bi] = "gal:dirt_with_" .. tgrasses[bi] .. ""
			end
		else
			if tgrasses[bi] == "grass" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. "_" .. bname .. ""
			elseif tgrasses[bi] == "dirt" then
				tdirts[bi] = "gal:dirt" .. tsoils[bi]
			elseif tgrasses[bi] == "stone" then
				tdirts[bi] = "gal:" .. tsoils[bi]
			else
				tdirts[bi] = "gal:dirt" .. tsoils[bi] .. "_with_" .. tgrasses[bi] .. ""
			end
		end
	end
	

	minetest.register_decoration({
		name = "gal:" .. tname .. "",
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

deco_plant("grass_1",					{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
--deco_plant("grass_1",					{"hot_temperate", "warm_temperate", "temperate_temperate",},				{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_bamboo",				{"hot_humid", "warm_humid", "temperate_humid",},							{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_clover",				{"hot_semihumid", "warm_semihumid", "temperate_semihumid",},				{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_dead_1",				{"hot_semiarid", "warm_semiarid", "temperate_semiarid", "cool_semiarid",},	{"", "", "", "",},	{"grass", "grass", "grass", "grass",},	0.003,"beach","shelf")
deco_plant("grass_dry_1",				{"hot_semiarid", "warm_semiarid", "temperate_semiarid", "cool_semiarid",},	{"", "", "", "",},	{"grass", "grass", "grass", "grass",},	0.008,"beach","shelf")
--deco_plant("grass_giant_1",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_giant_1",				{"hot_humid", "warm_humid", "temperate_humid",},							{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_golden_1",			{"hot_semiarid", "warm_semiarid", "temperate_semiarid", "cool_semiarid",},	{"", "", "", "",},	{"grass", "grass", "grass", "grass",},	0.005,"beach","shelf")
deco_plant("grass_green",				{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"", "", "",},		{"grass", "grass", "grass",},			0.005,"beach","shelf")
deco_plant("grass_green_1",				{"hot_temperate", "warm_temperate", "temperate_temperate",},				{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
--deco_plant("grass_green_1",			{"temperate_humid", "temperate_semihumid", "temperate_temperate",},			{"", "", "",},		{"grass", "grass", "grass",},			0.008,"beach","shelf")
deco_plant("grass_jungle",				{"hot_humid", "hot_semihumid", "hot_temperate",},							{"", "", "",},		{"grass", "grass", "grass",},			0.005,"beach","shelf")
deco_plant("grass_jungle_1",			{"hot_humid", "hot_semihumid", "hot_temperate",},							{"", "", "",},		{"grass", "grass", "grass",},			0.008,"beach","shelf")
deco_plant("grass_kauri",				{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
deco_plant("grass_marram_1",			{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
deco_plant("grass_mitchell",			{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
--deco_plant("grass_sea_1",				{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
--deco_plant("grass_sea_temperate",		{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
--deco_plant("grass_sea_subtropical",	{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
--deco_plant("grass_sea_tropical",		{"temperate_semihumid", "temperate_temperate",},							{"", "",},			{"grass", "grass",},					0.003,"beach","shelf")
deco_plant("grass_snow_1",				{"cold_humid", "cold_semihumid", "cold_temperate",},						{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_swamp",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"", "", "",},		{"grass", "grass", "grass",},			0.005,"beach","shelf")
deco_plant("grass_swamp_1",				{"warm_humid", "warm_semihumid", "warm_temperate",},						{"", "", "",},		{"grass", "grass", "grass",},			0.008,"beach","shelf")
--deco_plant("grass_tall_1",			{"warm_humid", "warm_semihumid", "warm_temperate",},						{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")
deco_plant("grass_tall_1",				{"hot_semihumid", "warm_semihumid", "temperate_semihumid",},				{"", "", "",},		{"grass", "grass", "grass",},			0.003,"beach","shelf")



-- Coral reefs
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
			seed = 7013,
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
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 4,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid_ocean",
			"hot_semihumid_ocean",
			"hot_temperate_ocean",
			"warm_humid_ocean",
			"warm_semihumid_ocean",
			"warm_temperate_ocean",
			"temperate_humid_ocean",
			"temperate_semihumid_ocean",
			"temperate_temperate_ocean",
		},
		y_max = -8,
		y_min = -14,
		flags = "force_placement",
		schematic = gal.schem("coral_brain_pink")
	})

	minetest.register_decoration({
		name = "gal:corals_4",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 3,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid_ocean",
			"hot_semihumid_ocean",
			"hot_temperate_ocean",
			"warm_humid_ocean",
			"warm_semihumid_ocean",
			"warm_temperate_ocean",
			"temperate_humid_ocean",
			"temperate_semihumid_ocean",
			"temperate_temperate_ocean",
		},
		y_max = -8,
		y_min = -14,
		flags = "force_placement",
		schematic = gal.schem("coral_bubble")
	})

	minetest.register_decoration({
		name = "gal:corals_5",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 2,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid_ocean",
			"hot_semihumid_ocean",
			"hot_temperate_ocean",
			"warm_humid_ocean",
			"warm_semihumid_ocean",
			"warm_temperate_ocean",
			"temperate_humid_ocean",
			"temperate_semihumid_ocean",
			"temperate_temperate_ocean",
		},
		y_max = -8,
		y_min = -14,
		flags = "force_placement",
		schematic = gal.schem("coral_fire")
	})

	minetest.register_decoration({
		name = "gal:corals_6",
		deco_type = "schematic",
		place_on = {"gal:sand", "gal:dirt_silt_02", },
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 1,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"hot_humid_ocean",
			"hot_semihumid_ocean",
			"hot_temperate_ocean",
			"warm_humid_ocean",
			"warm_semihumid_ocean",
			"warm_temperate_ocean",
			"temperate_humid_ocean",
			"temperate_semihumid_ocean",
			"temperate_temperate_ocean",
		},
		y_max = -8,
		y_min = -14,
		flags = "force_placement",
		schematic = gal.schem("coral_pillar")
	})

-- Kelp
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
			seed = 87112,
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
			seed = 87112,
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
			seed = 87112,
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
			seed = 87112,
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
			seed = 87112,
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
			seed = 87112,
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




	minetest.register_decoration({
		name = "gal:plant_waterlily",
		deco_type = "simple",
		place_on = {"gal:liquid_water_source", },
		place_offset_y = 0,
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
		y_max = 2,
		y_min = 0,
		flags = "force_placement",
		decoration = {"gal:plant_waterlily_pink", "gal:plant_waterlily_yellow", },
		param2 = 48,
		param2_max = 96,
	})


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
	minetest.register_decoration({
		name = "gal:reedmace_01",
		deco_type = "schematic",
		place_on = {"gal:dirt_mud_01", },
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.7,
		biomes = {
			"hot_humid_swamp",
			"hot_semihumid_swamp",
			"warm_humid_swamp",
			"temperate_humid_swamp"
		},
		y_min = heights["beach_depth"] - gal.mapgen.biome_vertical_blend,
		y_max = heights["beach"] + gal.mapgen.biome_vertical_blend,
		schematic = gal.schem("plant_reedmace_01", ""),
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})
	minetest.register_decoration({
		name = "gal:reedmace_02",
		deco_type = "schematic",
		place_on = {"gal:dirt_mud_01", },
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.7,
		biomes = {
			"hot_humid_swamp",
			"hot_semihumid_swamp",
			"warm_humid_swamp",
			"temperate_humid_swamp"
		},
		y_min = heights["beach_depth"] - gal.mapgen.biome_vertical_blend,
		y_max = heights["beach"] + gal.mapgen.biome_vertical_blend,
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



for i, deco in ipairs(gal.lib.csv.read("|", gal.path .. "/gal_ecology_trees_decorations.csv")) do

	--#Deco_Type, Place_On, FillRatio, Biome, Y_Min, Y_Max, Deco_Node, HeightMax, SpawnBy, NumSpawnBy
	local decotype, placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby = unpack(deco)


	--minetest.log(S("[MOD] gal: " .. decotype .. "; " .. placeon .. "; " .. biome .. "; " .. deconode))


	if decotype then
		if decotype ~= "" then
			if decotype == "node" then
				add_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			end

			if decotype == "water_node" then
				add_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			end

			if decotype == "schem" then
				if heightmax == "" then
					add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "newschem" then
				if heightmax == "" then
					new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "trees" then
				--if heightmax == "" then
				--	add_tree(placeon, fillratio, biome, ymin, ymax, deconode)
				--else
				--	add_tree(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				--end
			end

			if decotype == "shroom" then
				if heightmax == "" then
					add_tree(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_tree(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "plants" then
				if heightmax == "" then
					add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
				else
					add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "no_rot" then
				if heightmax == "" then
					add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end

			if decotype == "water_schem" then
				add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
			end

			end
		end
	end

end










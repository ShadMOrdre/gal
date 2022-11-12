--
-- Register lib_materials ecosystems
--
-- Define constants that can be used in csv
--[[local heights = {
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
}--]]


--[[local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end--]]



--[[if gal.ecosystem_base == "default" then

	for i, ecosystem in ipairs(gal.lib.csv.read("|", gal.path .. "/" .. gal.ecosystem_data_file .. ".csv")) do
		local oretype, orename, wherein, threshold, ymin, ymax, biome = unpack(ecosystem)

		local spread_val = 2^(tonumber(threshold) * 10)
		local ore_seed = i

		if oretype == "dirt" then
			minetest.register_ore({
				ore_type = "sheet",
				ore = "gal:" .. orename,
				wherein = "gal:" .. wherein,
				clust_size = 8,
				y_min = tonumber(ymin) or (heights[ymin] - gal.mapgen.biome_vertical_blend),
				y_max = tonumber(ymax) or (heights[ymax] + gal.mapgen.biome_vertical_blend),
				noise_threshold = tonumber(threshold),
				noise_params = {
					offset = 0,
					scale = 1,
					spread = {x = 128, y = 128, z = 128},
					seed = ore_seed,
					octaves = 5,
					persist = 0.60
				},
				column_height_min = (gal.mapgen.biome_vertical_range / 2) + gal.mapgen.biome_vertical_blend,  --1
				column_height_max = gal.mapgen.biome_vertical_range + (gal.mapgen.biome_vertical_blend * 2),
				column_midpoint_factor = 0.5,
				biomes = biome or nil
			})
		elseif oretype == "fungi" then
			minetest.register_ore({
				ore_type = "sheet",
				ore = "gal:" .. orename,
				wherein = "gal:" .. wherein,
				clust_size = (tonumber(threshold) * 10),
				y_min = tonumber(ymin),
				y_max = tonumber(ymax),
				noise_threshold = tonumber(threshold),
				noise_params = {
					offset = 0,
					scale = 1,
					spread = {x = spread_val, y = spread_val, z = spread_val},
					seed = ore_seed,
					octaves = 5,
					persist = 0.60
				},
					column_height_min = 1,
					column_height_max = gal.mapgen.biome_vertical_range,
					column_midpoint_factor = 0.5,
				biomes = biome or nil
			})
		elseif oretype == "blob" then

			minetest.register_ore({
				ore_type = "sheet",
				ore = "gal:" .. orename,
				wherein = "gal:" .. wherein,
				clust_size = 8,
				y_min = tonumber(ymin) or (heights[ymin] - gal.mapgen.biome_vertical_blend),
				y_max = tonumber(ymax) or (heights[ymax] + gal.mapgen.biome_vertical_blend),
				noise_threshold = tonumber(threshold),
				noise_params = {
					offset = 0,
					scale = 1,
					spread = {x = 128, y = 128, z = 128},
					seed = ore_seed,
					octaves = 5,
					persist = 0.60
				},
				column_height_min = (gal.mapgen.biome_vertical_range / 2) + gal.mapgen.biome_vertical_blend,  --1
				column_height_max = gal.mapgen.biome_vertical_range + (gal.mapgen.biome_vertical_blend * 2),
				column_midpoint_factor = 0.5,
				biomes = biome or nil
			})

		elseif oretype == "" then

		else

		end
	end

else

	minetest.register_ore({
		ore_type = "sheet",
		ore = "gal:dirt_with_litter_fungi",
		wherein = {"gal:dirt_with_litter_coniferous", "gal:dirt_with_litter_rainforest", },
		clust_size = 8,
		y_min = 4,
		y_max = 100,
		noise_threshold = 0.8,
		noise_params = {
			offset = 0,
			scale = 1,
			spread = {x = 64, y = 64, z = 64},
			seed = math.random(1,256),
			octaves = 5,
			persist = 0.60
		},
		column_height_min = 1,
		column_height_max = gal.mapgen.biome_vertical_range,
		column_midpoint_factor = 0.5,
		-- biomes = biome or nil
	})

end--]]



local biome_list = {
	"hot_humid",
	"hot_semihumid",
	"hot_temperate",
	"hot_semiarid",
	"hot_arid",
	"warm_humid",
	"warm_semihumid",
	"warm_temperate",
	"warm_semiarid",
	"warm_arid",
	"temperate_humid",
	"temperate_semihumid",
	"temperate_temperate",
	"temperate_semiarid",
	"temperate_arid",
	"cool_humid",
	"cool_semihumid",
	"cool_temperate",
	"cool_semiarid",
	"cool_arid",
	"cold_humid",
	"cold_semihumid",
	"cold_temperate",
	"cold_semiarid",
	"cold_arid",
}



--[[gal.ecosystems = {
	hot_humid = {
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"coral_stone","coral_skeleton"},				{"coral_tube_coral_skeleton","coral_horn_coral_skeleton"},	{"coral_bubble_coral_skeleton","coral_fire_coral_skeleton"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"mud_mangrove","mud_mangrove"},						{"dirt_mud_01","dirt_mud_01"},						{"sand_volcanic","sand_black"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_humid_pale",""},					{"", ""}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	hot_semihumid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"mud_mangrove","mud_mangrove"},						{"dirt_mud_01","dirt_mud_01"},						{"sand_volcanic","sand_black"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	hot_temperate	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_rainforest","_with_litter_dark"},		{"_with_grass_hot_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_granite_01","stone_granite_brown"},			{"stone_basalt_01","stone_gabbro"},					{"stone_sandstone_desert","stone_sand"}},
			stone		=	{{"stone_granite_black","stone_granite_brown_02"},		{"stone_basalt_02","stone_diorite"},				{"stone_desert","stone_brown"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	hot_semiarid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_hot_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_hot_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_hot_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_hot_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	hot_arid		=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},

	warm_humid = {
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},			{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},			{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},			{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},			{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	warm_semihumid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},							{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},							{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},							{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},							{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	warm_temperate	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_jungle_01","_with_grass_jungle_01"},		{"_with_grass_warm_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},			{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},			{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone_bluestone","stone_greenstone"},				{"stone_andesite","stone_granite_pink"},			{"stone_gneiss_03","stone_gneiss_01"}},
			stone		=	{{"stone_bluestone_basalt","stone"},					{"stone_andesite","stone_granite_pink_02"},			{"stone_basalt_03","stone_gneiss_02"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	warm_semiarid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_warm_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_warm_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_warm_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_warm_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	warm_arid		=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},

	temperate_humid = {
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_humid_pale",""},			{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_humid_pale",""},			{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_humid_pale",""},			{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_humid_pale",""},			{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	temperate_semihumid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_semihumid_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_semihumid_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_semihumid_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_semihumid_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	temperate_temperate	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_temperate_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_temperate_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay"},							{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_temperate_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_grove","_with_grass_green"},				{"_with_grass_temperate_temperate_pale",""},		{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	temperate_semiarid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_temperate_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_temperate_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_temperate_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_temperate_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	temperate_arid		=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_desert_gravel","stone_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_desert_gravel","stone_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_desert_gravel","stone_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","stone_sandstone_white"},	{"stone_sandstone_gravel","stone_sandstone"},	{"stone_sandstone_desert_gravel","stone_sandstone_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},

	cool_humid = {
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_humid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	cool_semihumid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_semihumid_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	cool_temperate	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_litter_coniferous","_with_litter_beech"},		{"_with_grass_cool_temperate_pale",""},				{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	cool_semiarid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_cool_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_cool_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_cool_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"_with_grass_dry","_with_litter_dry"},				{"_with_grass_cool_semiarid_pale",""},					{}},
			fill		=	{{"dirt_clayey","dirt_clay_red"},						{"dirt_sandy","dirt_sand"},							{"dirt_silty","dirt_silt_01"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},
	cool_arid		=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		coastal		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		lowland		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		shelf		=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		highland	=	{
			top			=	{{"stone_sandstone_desert_gravel","sand_desert"},		{"stone_sandstone_white_gravel","sand_white"},					{}},
			fill		=	{{"stone_sandstone_white_gravel","sand_white"},			{"stone_sandstone_gravel","sand2"},					{"stone_sandstone_desert_gravel","sand_desert"}},
			stone		=	{{"stone_sandstone_white", "stone_sandstone_white"},	{"stone_sandstone_desert_stone", "stone_sandstone"},{"stone_desert", "stone_sandstone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone_travertine","stone_travertine"},				{"stone_travertine","stone_travertine"},			{"stone_travertine","stone_travertine"}},
			dungeon_alt	=	{{"stone_with_moss","stone_with_algae"},				{"stone_with_algae","stone_with_lichen"},			{"mineral_salt_crystal","stone_with_salt"}},
		},
	},

	cold_humid = {
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		coastal		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		lowland		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		shelf		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		highland	=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
	},
	cold_semihumid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		coastal		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		lowland		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		shelf		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		highland	=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
		},
	},
	cold_temperate	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		coastal		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		lowland		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		shelf		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		highland	=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_moss","_with_litter_moss"},			{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"stone","stone"},										{"stone","stone"},									{"stone","stone"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
	},
	cold_semiarid	=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		coastal		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		lowland		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		shelf		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		highland	=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
	},
	cold_arid		=	{
		deep_cave	=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		cave		=	{
			top			=	{{},			{},			{}},
			fill		=	{{},			{},			{}},
			stone		=	{{},			{},			{}},
			dungeon		=	{{},			{},			{}},
			dungeon_alt	=	{{},			{},			{}},
		},
		ocean		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		beach		=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"sand","sand"},										{"sand","sand"},									{"sand","sand"}},
			stone		=	{{"stone_sandstone","stone_sandstone"},					{"stone_sandstone","stone_sandstone"},				{"stone_sandstone","stone_sandstone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		coastal		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		lowland		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		shelf		=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		highland	=	{
			top			=	{{"_with_snow","_with_snow"},							{"_with_litter_stones","_with_litter_stones"},		{}},
			fill		=	{{"dirt_permafrost","dirt_permafrost_stoney"},			{"dirt_permafrost","dirt_permafrost_stoney"},		{"dirt_permafrost","dirt_permafrost_stoney"}},
			stone		=	{{"stone_sandstone_desert_stone", "stone_desert"},		{"stone_sandstone", "stone_sandstone_desert"},		{"stone_siltstone", "stone"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		mountain	=	{
			top			=	{{"",""},												{"",""},											{}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
		strato		=	{
			top			=	{{"",""},												{"",""},											{"",""}},
			fill		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			stone		=	{{"stone","stone_desert"},								{"stone","stone_desert"},							{"stone","stone_desert"}},
			dungeon		=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
			dungeon_alt	=	{{"ice","ice_2"},										{"ice","ice_2"},									{"ice","ice_2"}},
		},
	},


}
--]]


gal.ecosystems = {}
-- if gal.ecosystem_base == "gal" then

	for i, ecosystem in ipairs(gal.lib.csv.read("|", gal.path .. "/" .. gal.ecosystem_data_file .. ".csv")) do

		local biome, altitude, t_t, top1, top2, t_f, fill1, fill2, fill3, t_s, stone1, stone2, stone3, t_d, dungeon1, dungeon2, dungeon3, t_da, dungeon_alt1, dungeon_alt2, dungeon_alt3 = unpack(ecosystem)
		-- unpack(top1:split(",", true))

		if not (gal.ecosystems[tostring(biome)]) then
			gal.ecosystems[tostring(biome)] = {}
		end
		if not (gal.ecosystems[tostring(biome)][tostring(altitude)]) then
			gal.ecosystems[tostring(biome)][tostring(altitude)] = {}
		end

		-- gal.ecosystems_new[tostring(biome)][tostring(altitude)].top = {{top1}, {top2}}
		-- gal.ecosystems_new[tostring(biome)][tostring(altitude)].fill = {{fill1}, {fill2}, {fill3}}
		-- gal.ecosystems_new[tostring(biome)][tostring(altitude)].stone = {{stone1}, {stone2}, {stone3}}
		-- gal.ecosystems_new[tostring(biome)][tostring(altitude)].dungeon = {{dungeon1}, {dungeon2}, {dungeon3}}
		-- gal.ecosystems_new[tostring(biome)][tostring(altitude)].dungeon_alt = {{dungeon_alt1}, {dungeon_alt2}, {dungeon_alt3}}

		gal.ecosystems[tostring(biome)][tostring(altitude)].top = {{unpack(top1:split(",", true))}, {unpack(top2:split(",", true))}}
		gal.ecosystems[tostring(biome)][tostring(altitude)].fill = {{unpack(fill1:split(",", true))}, {unpack(fill2:split(",", true))}, {unpack(fill3:split(",", true))}}
		gal.ecosystems[tostring(biome)][tostring(altitude)].stone = {{unpack(stone1:split(",", true))}, {unpack(stone2:split(",", true))}, {unpack(stone3:split(",", true))}}
		gal.ecosystems[tostring(biome)][tostring(altitude)].dungeon = {{unpack(dungeon1:split(",", true))}, {unpack(dungeon2:split(",", true))}, {unpack(dungeon3:split(",", true))}}
		gal.ecosystems[tostring(biome)][tostring(altitude)].dungeon_alt = {{unpack(dungeon_alt1:split(",", true))}, {unpack(dungeon_alt2:split(",", true))}, {unpack(dungeon_alt3:split(",", true))}}

				-- gal.ecosystems_new.biome.altitude.top = {{unpack(top1:split(",", true))}, {unpack(top2:split(",", true))}}
				-- gal.ecosystems_new.biome.altitude.fill = {{unpack(fill1:split(",", true))}, {unpack(fill2:split(",", true))}, {unpack(fill3:split(",", true))}}
				-- gal.ecosystems_new.biome.altitude.stone = {{unpack(stone1:split(",", true))}, {unpack(stone2:split(",", true))}, {unpack(stone3:split(",", true))}}
				-- gal.ecosystems_new.biome.altitude.dungeon = {{unpack(dungeon1:split(",", true))}, {unpack(dungeon2:split(",", true))}, {unpack(dungeon3:split(",", true))}}
				-- gal.ecosystems_new.biome.altitude.dungeon_alt = {{unpack(dungeon_alt1:split(",", true))}, {unpack(dungeon_alt2:split(",", true))}, {unpack(dungeon_alt3:split(",", true))}}

				-- gal.ecosystems_new.biome.altitude.top1 = tostring(top1)
				-- gal.ecosystems_new.biome.altitude.top2 = tostring(top2)
				-- gal.ecosystems_new.biome.altitude.top3 = tostring(top3)
				-- gal.ecosystems_new.biome.altitude.fill1 = tostring(fill1)
				-- gal.ecosystems_new.biome.altitude.fill2 = tostring(fill2)
				-- gal.ecosystems_new.biome.altitude.fill3 = tostring(fill3)
				-- gal.ecosystems_new.biome.altitude.stone1 = tostring(stone1)
				-- gal.ecosystems_new.biome.altitude.stone2 = tostring(stone2)
				-- gal.ecosystems_new.biome.altitude.stone3 = tostring(stone3)
				-- gal.ecosystems_new.biome.altitude.dungeon1 = tostring(dungeon1)
				-- gal.ecosystems_new.biome.altitude.dungeon2 = tostring(dungeon2)
				-- gal.ecosystems_new.biome.altitude.dungeon3 = tostring(dungeon3)
				-- gal.ecosystems_new.biome.altitude.dungeon_alt1 = tostring(dungeon_alt1)
				-- gal.ecosystems_new.biome.altitude.dungeon_alt2 = tostring(dungeon_alt2)
				-- gal.ecosystems_new.biome.altitude.dungeon_alt3 = tostring(dungeon_alt3)

	end
-- end

local max   = math.max
local min   = math.min


-- local biome_def				= {}
-- if minetest.get_mapgen_setting("mg_name") == "singlenode" then
	-- if gal.mg_earth == true then
		-- biome_def				= mg_earth.biome_info[t_biome]
	-- else
		-- biome_def				= gal.biome_info[t_biome]
	-- end
-- else
	-- biome_def				= gal.biome_info[t_biome]
-- end


local np_seed = math.random(1,256)

local np_eco1				= {offset = 0, scale = 1, seed = 2835, spread = {x = (128 * gal.settings.mg_world_scale), y = (128 * gal.settings.mg_world_scale), z = (128 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 4}
local np_eco2				= {offset = 0, scale = 1, seed = 6674, spread = {x = (128 * gal.settings.mg_world_scale), y = (128 * gal.settings.mg_world_scale), z = (128 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 4}
local np_eco3				= {offset = 0, scale = 1, seed = 6940, spread = {x = (128 * gal.settings.mg_world_scale), y = (128 * gal.settings.mg_world_scale), z = (128 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 4}
local np_eco4				= {offset = 0, scale = 1, seed = 8321, spread = {x = (256 * gal.settings.mg_world_scale), y = (256 * gal.settings.mg_world_scale), z = (256 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 2}
local np_eco5				= {offset = 0, scale = 1, seed = 6940, spread = {x = (256 * gal.settings.mg_world_scale), y = (256 * gal.settings.mg_world_scale), z = (256 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 2}
local np_eco6				= {offset = 0, scale = 1, seed = np_seed, spread = {x = (256 * gal.settings.mg_world_scale), y = (256 * gal.settings.mg_world_scale), z = (256 * gal.settings.mg_world_scale)}, octaves = 5, persist = 0.5, lacunarity = 2}

if gal.settings.mg_world_scale >= 0.1 then
	minetest.register_ore({
		ore_type = "sheet",
		ore = "gal:dirt_with_litter_fungi",
		wherein = {"gal:dirt_with_litter_coniferous", "gal:dirt_with_litter_rainforest", },
		clust_size = 8,
		y_min = 4,
		y_max = 100,
		noise_threshold = 0.8,
		noise_params = np_eco6,
		column_height_min = 1,
		column_height_max = gal.mapgen.biome_vertical_range,
		column_midpoint_factor = 0.5,
		-- biomes = biome or nil
	})
end

function gal.get_ecosystem(ppos,pbiome)

	local n1					= minetest.get_perlin(np_eco1):get_2d({x=ppos.x,y=ppos.z})
	local n2					= minetest.get_perlin(np_eco2):get_2d({x=ppos.x,y=ppos.z})
	local n3					= minetest.get_perlin(np_eco3):get_2d({x=ppos.x,y=ppos.z})
	local n4					= minetest.get_perlin(np_eco4):get_2d({x=ppos.x,y=ppos.z})
	local n5					= minetest.get_perlin(np_eco5):get_2d({x=ppos.x,y=ppos.z})

	local biome_default			= 0.5
	local soil_threshold		= 1.0
	local dirt_threshold		= 1.0

	local soil					= max(n1, n2, n3)
	local ground				= max(n4, n5)
	
	local soil_type_idx			= 0
	local soil_idx				= 0
	local top_type_idx			= 0
	local top_idx				= 0
	
	if ground == n4 then
		top_type_idx			= 1
	elseif ground == n5 then
		top_type_idx			= 2
	end

	if ground > biome_default then
		top_idx					= 1
		if ground > soil_threshold and top_type_idx == 1 then
			top_idx				= 2
		end
	end
	
	if soil == n1 then
		soil_type_idx			= 1
	elseif soil == n2 then
		soil_type_idx			= 2
	elseif soil == n3 then
		soil_type_idx			= 3
	end
	
	if soil > biome_default then
		soil_idx				= 1
		if soil > dirt_threshold then
			soil_idx			= 2
			top_type_idx		= 2
			top_idx				= 2
		end
	end

	return soil_type_idx, soil_idx, top_type_idx, top_idx

end

function gal.get_ecosystem_data(pbiome, palt, soil_type_idx, soil_idx, top_type_idx, top_idx)

	-- local biome_def				= minetest.registered_biomes[pbiome]
	local biome_def				= gal.biome_info[pbiome]

	local e_tops				= {}
	local e_fillers				= {}
	local e_stones				= {}
	local e_dungeons			= {}
	local e_dungeon_alts		= {}
	local e_top					= ""
	local e_fill				= ""
	local e_stone				= ""
	local e_dungeon				= ""
	local e_dungeon_alt			= ""

	-- local biome_mod, biome_name = unpack(pbiome:split(":", true))
	-- local biome_name = pbiome

	local ecosystem = gal.ecosystems[pbiome][palt]
	-- local ecosystem = gal.ecosystems_new[pbiome][palt]
	-- minetest.log(pbiome)

	e_fillers					= ecosystem.fill
	e_stones					= ecosystem.stone
	e_dungeons					= ecosystem.dungeon
	e_dungeon_alts				= ecosystem.dungeon_alt

	if soil_idx > 0 then
		if soil_type_idx > 0 then
			e_fill				= "gal:" .. e_fillers[soil_type_idx][soil_idx]
			e_stone				= "gal:" .. e_stones[soil_type_idx][soil_idx]
			e_dungeon			= "gal:" .. e_dungeons[soil_type_idx][soil_idx]
			e_dungeon_alt		= "gal:" .. e_dungeon_alts[soil_type_idx][soil_idx]
			if palt == "ocean" or palt == "beach" then
				e_fill			= "gal:" .. e_fillers[soil_type_idx][soil_idx]
				e_stone			= "gal:" .. e_stones[soil_type_idx][soil_idx]
				e_dungeon		= "gal:" .. e_dungeons[soil_type_idx][soil_idx]
				e_dungeon_alt	= "gal:" .. e_dungeon_alts[soil_type_idx][soil_idx]
			end
			if palt == "mountain" or palt == "strato" then
				e_fill			= "gal:" .. e_fillers[soil_type_idx][soil_idx]
				e_stone			= "gal:" .. e_stones[soil_type_idx][soil_idx]
				e_dungeon		= "gal:" .. e_dungeons[soil_type_idx][soil_idx]
				e_dungeon_alt	= "gal:" .. e_dungeon_alts[soil_type_idx][soil_idx]
			end
		end
	else
		e_fill					= minetest.get_name_from_content_id(biome_def.b_filler)
		e_stone					= minetest.get_name_from_content_id(biome_def.b_stone)
		e_dungeon				= minetest.get_name_from_content_id(biome_def.b_dungeon)
		e_dungeon_alt			= minetest.get_name_from_content_id(biome_def.b_dungeon_alt)
		if palt == "ocean" or palt == "beach" then
			e_fill				= "gal:stone_sandstone"
			e_stone				= "gal:stone"
			e_dungeon			= "gal:stone"
			e_dungeon_alt		= "gal:stone"
		end
		if palt == "mountain" or palt == "strato" then
			e_fill				= minetest.get_name_from_content_id(biome_def.b_stone)
			e_stone				= minetest.get_name_from_content_id(biome_def.b_stone)
			e_dungeon			= minetest.get_name_from_content_id(biome_def.b_dungeon)
			e_dungeon_alt		= minetest.get_name_from_content_id(biome_def.b_dungeon_alt)
		end
	end


	e_tops						= ecosystem.top

	if top_idx > 0 then
		if top_type_idx > 0 then
			if e_tops[top_type_idx][top_idx] then
				e_top				= e_fill .. "" .. e_tops[top_type_idx][top_idx]
			else
				e_top				= e_fill
			end
			if string.find(pbiome, "_arid") then
				--e_top			= "gal:" .. e_tops[top_type_idx][top_idx]
				e_top			= e_fill
			end
			if palt == "ocean" or palt == "beach" then
				e_top			= e_fill
			end
			if palt == "mountain" or palt == "strato" then
				e_top			= e_fill
			end
		else
			e_top				= minetest.get_name_from_content_id(biome_def.b_top)
		end
	else
		e_top				= minetest.get_name_from_content_id(biome_def.b_top)
		if soil_idx > 0 then
			if string.find(pbiome, "_arid") then
				e_top			= e_fill
			else
				if string.find(pbiome, "cold_") then
					if string.find(pbiome, "humid") then
						e_top			= e_fill .. "_with_snow"
					else
						e_top			= e_fill
					end
				else
					e_top			= e_fill .. "_with_grass_" .. pbiome
				end
			end
		end
		if palt == "ocean" or palt == "beach" then
			e_top				= "gal:sand"
		end
		if palt == "mountain" or palt == "strato" then
			e_top				= minetest.get_name_from_content_id(biome_def.b_stone)
		end
	end

	-- if palt == "ocean" or palt == "beach" then
		-- e_top					= "gal:sand"
	-- end
	-- if palt == "mountain" or palt == "strato" then
		-- e_top					= biome_def.b_stone
	-- end

	local t_top					= minetest.get_content_id(e_top)
	local t_fill				= minetest.get_content_id(e_fill)
	local t_stone				= minetest.get_content_id(e_stone)
	local t_dungeon				= minetest.get_content_id(e_dungeon)
	local t_dungeon_alt			= minetest.get_content_id(e_dungeon_alt)

	return t_top, t_fill, t_stone, t_dungeon, t_dungeon_alt

end










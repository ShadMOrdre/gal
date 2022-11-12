
--Mapgen object.


gal.mapgen.name = "gal_mapgen"
gal.mapgen.path = gal.path_mod .. "/mapgen"
gal.mapgen.ver_maj = 0
gal.mapgen.ver_min = 0
gal.mapgen.ver_rev = 1


--engine mapgen parameters.
gal.mapgen.mg_seed = minetest.get_mapgen_setting("seed")

gal.mapgen.rivergen = {}

function gal.mapgen.save_rivergen(pfile)

	if not pfile or pfile == "" then
		return
	end

	--table.sort(gal.lib.voronoi.neighbors)

	local temp_rivergen = "#Index|Z_Pos|X_Pos|Y_Pos\n"
	temp_rivergen = temp_rivergen .. "#R_Z|R_X|R_Y\n"
	
	for i_r, i_riv in pairs(gal.mapgen.rivergen) do

		temp_rivergen = temp_rivergen .. "" .. i_r .. "|" .. i_riv .. "\n"

	end

	temp_rivergen = temp_rivergen .. "#" .. "\n"

	gal.lib.csv.save_worldpath(temp_rivergen, pfile)

end
--gal.mapgen.save_rivergen("mg_rivergen")



gal.heightmap = {}
gal.biomemap = {}
gal.biome_info = {}
gal.eco_map = {}


-- gal.mapgen.heightmap = {}
-- gal.mapgen.biomemap = {}
-- gal.mapgen.biome_info = {}
-- gal.mapgen.biome_data = {}
-- gal.mapgen.chunk_biome = nil
-- gal.mapgen.chunk_mean_altitude = nil
-- gal.mapgen.chunk_min_altitude = nil
-- gal.mapgen.chunk_max_altitude = nil
-- gal.mapgen.chunk_voronoi_cells = nil


--gal.mapgen.mg_world_scale = 0.01667
--gal.mapgen.mg_world_scale = 1
gal.mapgen.mg_world_scale = gal.settings.mg_world_scale
gal.mapgen.mg_world_scale_inverse = 0.001 / gal.mapgen.mg_world_scale
gal.mapgen.mg_half_chunk_size = 40
gal.mapgen.mg_map_size = 60000


--gal.mapgen.mg_base_height = 300 * gal.mapgen.mg_world_scale
gal.mapgen.mg_base_height = gal.settings.mg_base_height * gal.mapgen.mg_world_scale
gal.mapgen.water_level = (1 * gal.mapgen.mg_world_scale)

gal.mapgen.rivers_width = (5 * gal.mapgen.mg_world_scale)
gal.mapgen.river_size_factor = (gal.mapgen.rivers_width / 100)

	--gal.mapgen.mgv7_mapgen_scale_factor =  8
	--gal.mapgen.biome_vertical_range =  35 * gal.mapgen.mg_world_scale
	--gal.mapgen.biome_vertical_range =  (gal.mapgen.mg_base_height / 6) * gal.mapgen.mg_world_scale
--gal.mapgen.biome_vertical_range =  (gal.mapgen.mg_base_height / 6)
gal.mapgen.biome_vertical_range =  (gal.mapgen.mg_base_height / 5)
	--gal.mapgen.biome_vertical_range =  175 / 6
	--gal.mapgen.biome_vertical_blend = (gal.mapgen.biome_vertical_range / 5) * gal.mapgen.mg_world_scale
gal.mapgen.biome_vertical_blend = (gal.mapgen.biome_vertical_range / 6.25) * gal.mapgen.mg_world_scale
gal.mapgen.mg_biome_mode = "full"
gal.mapgen.use_heat_scalar = true
gal.mapgen.use_humid_scalar = true



--DEFAULTS
-- -192, -4, 0, 4, 30, 60, 90, 120, 150, 285, 485, 1250
-- -192, -4, 0, 4, 40, 80, 120, 160, 200, 380, 780, 1800
--gal.mapgen.ocean_depth = -192 * gal.mapgen.mg_world_scale
--gal.mapgen.ocean_depth = -2000 * gal.mapgen.mg_world_scale
gal.mapgen.ocean_depth = (gal.mapgen.mg_base_height * -1.4) * gal.mapgen.mg_world_scale
gal.mapgen.beach_depth = -4 * gal.mapgen.mg_world_scale
gal.mapgen.sea_level = gal.mapgen.water_level
gal.mapgen.maxheight_beach = 4 * gal.mapgen.mg_world_scale
gal.mapgen.maxheight_coastal = gal.mapgen.sea_level + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_lowland = gal.mapgen.maxheight_coastal + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_shelf = gal.mapgen.maxheight_lowland + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_highland = gal.mapgen.maxheight_shelf + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_mountain = gal.mapgen.maxheight_highland + (gal.mapgen.biome_vertical_range * 2)
--gal.mapgen.minheight_snow = gal.mapgen.maxheight_mountain + gal.mapgen.biome_vertical_range
gal.mapgen.minheight_snow = gal.mapgen.maxheight_mountain + (gal.mapgen.biome_vertical_range * 2)
gal.mapgen.maxheight_snow = gal.mapgen.minheight_snow  + (gal.mapgen.biome_vertical_range * 2)
--gal.mapgen.maxheight_strato = gal.mapgen.maxheight_snow  + (gal.mapgen.biome_vertical_range * (gal.mapgen.biome_vertical_blend / 2))
gal.mapgen.maxheight_strato = 31000 * gal.mapgen.mg_world_scale

-- 100, 75, 50, 25, 0
-- 90, 75, 50, 25, 10
-- 90, 70, 50, 30, 10
gal.mapgen.temperature_hot = 100
gal.mapgen.temperature_warm = 75
gal.mapgen.temperature_temperate = 50
gal.mapgen.temperature_cool = 25
gal.mapgen.temperature_cold = 0
gal.mapgen.humidity_humid = 100
gal.mapgen.humidity_semihumid = 75
gal.mapgen.humidity_temperate = 50
gal.mapgen.humidity_semiarid = 25
gal.mapgen.humidity_arid = 0


gal.mapgen.c_air							= minetest.get_content_id("air")
gal.mapgen.c_ignore							= minetest.get_content_id("ignore")

gal.mapgen.c_top							= minetest.get_content_id("gal:dirt_with_grass")
gal.mapgen.c_filler							= minetest.get_content_id("gal:dirt")
gal.mapgen.c_stone							= minetest.get_content_id("gal:stone")
gal.mapgen.c_water							= minetest.get_content_id("gal:liquid_water_source")
gal.mapgen.c_water_top						= minetest.get_content_id("gal:liquid_water_source")
gal.mapgen.c_river							= minetest.get_content_id("gal:liquid_water_river_source")
gal.mapgen.c_river_bed						= minetest.get_content_id("gal:dirt_mud_01")

gal.mapgen.c_cave_liquid					= minetest.get_content_id("gal:liquid_lava_source")
gal.mapgen.c_dungeon						= minetest.get_content_id("gal:stone_cobble")
gal.mapgen.c_dungeon_alt					= minetest.get_content_id("gal:stone_cobble_mossy")

gal.mapgen.c_snow							= minetest.get_content_id("gal:snow_block")
gal.mapgen.c_ice							= minetest.get_content_id("gal:ice")
		
gal.mapgen.c_sand							= minetest.get_content_id("gal:sand_beach")
gal.mapgen.c_sandstone						= minetest.get_content_id("gal:stone_sandstone")

-- gal.mapgen.c_air				= nil
-- gal.mapgen.c_ignore				= nil

-- gal.mapgen.c_top				= nil
-- gal.mapgen.c_filler				= nil
-- gal.mapgen.c_stone				= nil
-- gal.mapgen.c_water				= nil
-- gal.mapgen.c_river				= nil
-- gal.mapgen.c_gravel				= nil

-- gal.mapgen.c_lava				= nil
-- gal.mapgen.c_ice				= nil
-- gal.mapgen.c_mud				= nil

-- gal.mapgen.c_cobble				= nil
-- gal.mapgen.c_mossy				= nil
-- gal.mapgen.c_block				= nil
-- gal.mapgen.c_brick				= nil
-- gal.mapgen.c_sand				= nil
-- gal.mapgen.c_dirt				= nil
-- gal.mapgen.c_dirtperm				= nil
-- gal.mapgen.c_dirtgrass				= nil


--dofile(gal.mapgen.path .. "/mapgen_biome_data.lua")
--dofile(gal.mapgen.path .. "/mapgen_biome_functions.lua")

local function update_biomes()

	for name, desc in pairs(minetest.registered_biomes) do

		if desc then

			gal.biome_info[desc.name] = {}

			gal.biome_info[desc.name].b_name = desc.name
			gal.biome_info[desc.name].b_cid = minetest.get_biome_id(name)

			gal.biome_info[desc.name].b_top = gal.mapgen.c_top
			gal.biome_info[desc.name].b_top_depth = 1
			gal.biome_info[desc.name].b_filler = gal.mapgen.c_filler
			gal.biome_info[desc.name].b_filler_depth = 4
			gal.biome_info[desc.name].b_stone = gal.mapgen.c_stone
			gal.biome_info[desc.name].b_water_top = gal.mapgen.c_water
			gal.biome_info[desc.name].b_water_top_depth = 1
			gal.biome_info[desc.name].b_water = gal.mapgen.c_water
			gal.biome_info[desc.name].b_river = gal.mapgen.c_river
			gal.biome_info[desc.name].b_riverbed = gal.mapgen.c_gravel
			gal.biome_info[desc.name].b_riverbed_depth = 2
			gal.biome_info[desc.name].b_cave_liquid = gal.mapgen.c_lava
			gal.biome_info[desc.name].b_dungeon = gal.mapgen.c_stone
			gal.biome_info[desc.name].b_dungeon_alt = gal.mapgen.c_mossy
			gal.biome_info[desc.name].b_dungeon_stair = gal.mapgen.c_brick
			gal.biome_info[desc.name].b_node_dust = gal.mapgen.c_air
			gal.biome_info[desc.name].vertical_blend = 0
			gal.biome_info[desc.name].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.biome_info[desc.name].max_pos = {x=31000, y=31000, z=31000}
			gal.biome_info[desc.name].b_miny = -31000
			gal.biome_info[desc.name].b_maxy = 31000
			gal.biome_info[desc.name].b_heat = 50
			gal.biome_info[desc.name].b_humid = 50
		

			if desc.node_top and desc.node_top ~= "" then
				gal.biome_info[desc.name].b_top = minetest.get_content_id(desc.node_top) or gal.mapgen.c_top
			end

			if desc.depth_top ~= nil then
				gal.biome_info[desc.name].b_top_depth = tonumber(desc.depth_top)
			end

			if desc.node_filler and desc.node_filler ~= "" then
				gal.biome_info[desc.name].b_filler = minetest.get_content_id(desc.node_filler) or gal.mapgen.c_filler
			end

			if desc.depth_filler ~= nil then
				gal.biome_info[desc.name].b_filler_depth = tonumber(desc.depth_filler)
			end

			if desc.node_stone and desc.node_stone ~= "" then
				gal.biome_info[desc.name].b_stone = minetest.get_content_id(desc.node_stone) or gal.mapgen.c_stone
				-- gal.biome_info[desc.name].b_stone = gal.mapgen.c_stone
			-- else
				-- gal.biome_info[desc.name].b_stone = gal.mapgen.c_stone
			end

			if desc.node_water_top and desc.node_water_top ~= "" then
				gal.biome_info[desc.name].b_water_top = minetest.get_content_id(desc.node_water_top) or gal.mapgen.c_water
			end

			if desc.depth_water_top ~= nil then
				gal.biome_info[desc.name].b_water_top_depth = tonumber(desc.depth_water_top)
			end

			if desc.node_water and desc.node_water ~= "" then
				gal.biome_info[desc.name].b_water = minetest.get_content_id(desc.node_water) or gal.mapgen.c_water
			end

			if desc.node_river_water and desc.node_river_water ~= "" then
				gal.biome_info[desc.name].b_river = minetest.get_content_id(desc.node_river_water) or gal.mapgen.c_river
			end

			if desc.node_riverbed and desc.node_riverbed ~= "" then
				gal.biome_info[desc.name].b_riverbed = minetest.get_content_id(desc.node_riverbed) or gal.mapgen.c_river_bed
			end

			if desc.depth_riverbed ~= nil then
				gal.biome_info[desc.name].b_riverbed_depth = tonumber(desc.depth_riverbed)
			end

			if desc.node_cave_liquid and desc.node_cave_liquid ~= "" then
				if type(desc.node_cave_liquid) == "table" then
					gal.biome_info[desc.name].b_cave_liquid = minetest.get_content_id(desc.node_cave_liquid[1]) or gal.mapgen.c_cave_liquid
				elseif type(desc.node_cave_liquid) == "string" then
					gal.biome_info[desc.name].b_cave_liquid = minetest.get_content_id(desc.node_cave_liquid) or gal.mapgen.c_cave_liquid
				end
			end

			if desc.node_dungeon and desc.node_dungeon ~= "" then
				gal.biome_info[desc.name].b_dungeon = minetest.get_content_id(desc.node_dungeon) or gal.mapgen.c_dungeon
			end

			if desc.node_dungeon_alt and desc.node_dungeon_alt ~= "" then
				gal.biome_info[desc.name].b_dungeon_alt = minetest.get_content_id(desc.node_dungeon_alt) or gal.mapgen.c_dungeon_alt
			end

--[[
			if desc.node_dungeon_stair and desc.node_dungeon_stair ~= "" then
				gal.biome_info[desc.name].b_dungeon_stair = minetest.get_content_id(desc.node_dungeon_stair) or gal.mapgen.c_river
			end

		if desc.node_dust and desc.node_dust ~= "" then
				gal.biome_info[desc.name].b_node_dust = minetest.get_content_id(desc.node_dust)
			end
--]]

			if desc.vertical_blend ~= nil then
				gal.biome_info[desc.name].vertical_blend = tonumber(desc.vertical_blend)
			end

			if desc.y_min ~= nil then
				gal.biome_info[desc.name].b_miny = tonumber(desc.y_min)
			end

			if desc.y_max ~= nil then
				gal.biome_info[desc.name].b_maxy = tonumber(desc.y_max)
			end

			if desc.min_pos ~= nil then
				gal.biome_info[desc.name].min_pos = desc.min_pos
			end

			if desc.max_pos ~= nil then
				gal.biome_info[desc.name].max_pos = desc.max_pos
			end

			if desc.heat_point ~= nil then
				gal.biome_info[desc.name].b_heat = tonumber(desc.heat_point)
			end

			if desc.humidity_point ~= nil then
				gal.biome_info[desc.name].b_humid = tonumber(desc.humidity_point)
			end


		end
	end
end

minetest.register_on_mods_loaded(function()

	update_biomes()

end)


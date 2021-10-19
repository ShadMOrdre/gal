
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



gal.mapgen.heightmap = {}
gal.mapgen.biomemap = {}
gal.mapgen.biome_info = {}
gal.mapgen.biome_data = {}
gal.mapgen.chunk_biome = nil
gal.mapgen.chunk_mean_altitude = nil
gal.mapgen.chunk_min_altitude = nil
gal.mapgen.chunk_max_altitude = nil
gal.mapgen.chunk_voronoi_cells = nil


--gal.mapgen.mg_world_scale = 0.01667
--gal.mapgen.mg_world_scale = 1
gal.mapgen.mg_world_scale = gal.settings.mg_world_scale
gal.mapgen.mg_world_scale_inverse = 0.001 / gal.mapgen.mg_world_scale
gal.mapgen.mg_half_chunk_size = 40
gal.mapgen.mg_map_size = 60000


--gal.mapgen.mg_base_height = 300 * gal.mapgen.mg_world_scale
gal.mapgen.mg_base_height = gal.settings.mg_base_height * gal.mapgen.mg_world_scale
gal.mapgen.water_level = (1 * gal.mapgen.mg_world_scale)

--gal.mapgen.mgv7_mapgen_scale_factor =  8
--gal.mapgen.biome_vertical_range =  35 * gal.mapgen.mg_world_scale
--gal.mapgen.biome_vertical_range =  (gal.mapgen.mg_base_height / 6) * gal.mapgen.mg_world_scale
gal.mapgen.biome_vertical_range =  (gal.mapgen.mg_base_height / 6)
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
gal.mapgen.maxheight_mountain = gal.mapgen.maxheight_highland + gal.mapgen.biome_vertical_range
--gal.mapgen.minheight_snow = gal.mapgen.maxheight_mountain + gal.mapgen.biome_vertical_range
gal.mapgen.minheight_snow = gal.mapgen.maxheight_mountain + (gal.mapgen.biome_vertical_range * 2)
gal.mapgen.maxheight_snow = gal.mapgen.minheight_snow  + (gal.mapgen.biome_vertical_range * 2)
--gal.mapgen.maxheight_strato = gal.mapgen.maxheight_snow  + (gal.mapgen.biome_vertical_range * (gal.mapgen.biome_vertical_blend / 2))
gal.mapgen.maxheight_strato = 31000

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


gal.mapgen.c_air				= nil
gal.mapgen.c_ignore				= nil

gal.mapgen.c_top				= nil
gal.mapgen.c_filler				= nil
gal.mapgen.c_stone				= nil
gal.mapgen.c_water				= nil
gal.mapgen.c_river				= nil
gal.mapgen.c_gravel				= nil

gal.mapgen.c_lava				= nil
gal.mapgen.c_ice				= nil
gal.mapgen.c_mud				= nil

gal.mapgen.c_cobble				= nil
gal.mapgen.c_mossy				= nil
gal.mapgen.c_block				= nil
gal.mapgen.c_brick				= nil
gal.mapgen.c_sand				= nil
gal.mapgen.c_dirt				= nil
gal.mapgen.c_dirtperm				= nil
gal.mapgen.c_dirtgrass				= nil


--dofile(gal.mapgen.path .. "/mapgen_biome_data.lua")
--dofile(gal.mapgen.path .. "/mapgen_biome_functions.lua")













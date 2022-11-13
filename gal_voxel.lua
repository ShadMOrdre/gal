



local nobj_heatmap = nil
local nbuf_heatmap = {}
local nobj_heatblend = nil
local nbuf_heatblend = {}
local nobj_humiditymap = nil
local nbuf_humiditymap = {}
local nobj_humidityblend = nil
local nbuf_humidityblend = {}

np_heat = {
	flags = "defaults",
	lacunarity = 2,
	offset = 50,
	scale = 50,
	spread = {x = 1000, y = 1000, z = 1000},
	seed = 5349,
	octaves = 3,
	persist = 0.5,
}
np_heat_blend = {
	flags = "defaults",
	lacunarity = 2,
	offset = 0,
	scale = 1.5,
	spread = {x = 8, y = 8, z = 8},
	seed = 13,
	octaves = 2,
	persist = 1,
}
np_humid = {
	flags = "defaults",
	lacunarity = 2,
	offset = 50,
	scale = 50,
	spread = {x = 1000, y = 1000, z = 1000},
	seed = 842,
	octaves = 3,
	persist = 0.5,
}
np_humid_blend = {
	flags = "defaults",
	lacunarity = 2,
	offset = 0,
	scale = 1.5,
	spread = {x = 8, y = 8, z = 8},
	seed = 90003,
	octaves = 2,
	persist = 1,
}



gal.mapgen_times = {
	noisemaps = {},
	preparation = {},
	loop2d = {},
	loop3d = {},
	biomes = {},
	mainloop = {},
	setdata = {},
	liquid_lighting = {},
	writing = {},
	make_chunk = {},
}

local function calc_biome_from_noise(heat, humid, pos)
	local biome_closest = nil
	local biome_closest_blend = nil
	local dist_min = 31000
	local dist_min_blend = 31000

	for i, biome in pairs(gal.biome_info) do
		local min_pos, max_pos = biome.min_pos, biome.max_pos
		if pos.y >= min_pos.y and pos.y <= max_pos.y + biome.vertical_blend
				and pos.x >= min_pos.x and pos.x <= max_pos.x
				and pos.z >= min_pos.z and pos.z <= max_pos.z then
			local d_heat = heat - biome.b_heat
			local d_humid = humid - biome.b_humid
			local dist = d_heat*d_heat + d_humid*d_humid -- Pythagorean distance

			if pos.y <= max_pos.y then -- Within y limits of biome
				if dist < dist_min then
					dist_min = dist
					biome_closest = biome
				elseif dist < dist_min_blend and dist > dist_min then -- Blend area above biome
					dist_min_blend = dist
					biome_closest_blend = biome
				end
			end
		end
	end

	-- Carefully tune pseudorandom seed variation to avoid single node dither
	-- and create larger scale blending patterns similar to horizontal biome
	-- blend.
	local seed = math.floor(pos.y + (heat+humid) * 0.9)
	local rng = PseudoRandom(seed)

	if biome_closest_blend and dist_min_blend <= dist_min
			and rng:next(0, biome_closest_blend.vertical_blend) >= pos.y - biome_closest_blend.max_pos.y then
		return biome_closest_blend.b_name
	end

	if biome_closest then
		return biome_closest.b_name
	end

	return

end

local function generate_2d_map(minp, maxp, seed, area)

	nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, {x = maxp.x - minp.x + 1, y = maxp.x - minp.x + 1, z = 0})
	nbuf_heatmap = nobj_heatmap:get_2d_map({x = minp.x, y = minp.z})

	nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, {x = maxp.x - minp.x + 1, y = maxp.x - minp.x + 1, z = 0})
	nbuf_heatblend = nobj_heatblend:get_2d_map({x = minp.x, y = minp.z})

	nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, {x = maxp.x - minp.x + 1, y = maxp.x - minp.x + 1, z = 0})
	nbuf_humiditymap = nobj_humiditymap:get_2d_map({x = minp.x, y = minp.z})

	nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, {x = maxp.x - minp.x + 1, y = maxp.x - minp.x + 1, z = 0})
	nbuf_humidityblend = nobj_humidityblend:get_2d_map({x = minp.x, y = minp.z})

	--2D HEIGHTMAP GENERATION

	local index2d = 1

	local hm = {}
	-- local bm = {}
	if minetest.get_mapgen_setting("mg_name") == "singlenode" then
		if gal.mg_earth then
			hm = mg_earth.heightmap
			bm = mg_earth.biomemap
		elseif gal.mg_mapgen_rivers then
			hm = mapgen_rivers.heightmap
			-- bm = mapgen_rivers.biomemap
		else
			hm = minetest.get_mapgen_object("heightmap")
			-- bm = minetest.get_mapgen_object("biomemap")
		end
	else
		hm = minetest.get_mapgen_object("heightmap")
		-- bm = minetest.get_mapgen_object("biomemap")
	end


	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do

			local nheat = minetest.get_perlin(np_heat):get_2d({x=x,y=z}) + minetest.get_perlin(np_heat_blend):get_2d({x=x,y=z})
			-- local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]
			local nhumid = minetest.get_perlin(np_humid):get_2d({x=x,y=z}) + minetest.get_perlin(np_humid_blend):get_2d({x=x,y=z})
			-- local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

			local t_y = minp.y - 1

			local h_y = hm[index2d]
			if h_y and h_y > -31000 then
				t_y = h_y
			end

			gal.heightmap[index2d] = t_y

			local nbiome_name = ""
			if gal.mg_earth then
				gal.biomemap[index2d] = bm[index2d]
			else
				if not nbiome_name or nbiome_name == "" then
					nbiome_name = calc_biome_from_noise(nheat,nhumid,{x=x,y=t_y,z=z})
				end
				if not nbiome_name or nbiome_name == "" then
					local nbiome_data = minetest.get_biome_data({x=x,y=t_y,z=z})
					nbiome_name = minetest.get_biome_name(nbiome_data.biome)
				end
				gal.biomemap[index2d] = nbiome_name
			end

			if gal.config.enable_ecosystems == true then
				local soil_type_idx, soil_idx, top_type_idx, top_idx = gal.get_ecosystem({x = x, y = t_y, z = z},nbiome_name)
				gal.eco_map[index2d] = {soil_type_idx, soil_idx, top_type_idx, top_idx}
			end


			index2d = index2d + 1

		end
	end

end


local data = {}

local function generate_map(minp, maxp, seed)

	-- Start time of mapchunk generation.
	local mg_timer = {}
	mg_timer["start"] = os.clock()

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	vm:get_data(data)
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	local x_stride = area.xstride
	local y_stride = area.ystride -- Tip : the ystride of a VoxelArea is the number to add to the array index to get the index of the position above. It's faster because it avoids to completely recalculate the index.
	local z_stride = area.zstride
	local stride = (maxp.x - minp.x + 1)

	local write = false

	-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
	mg_timer["preparation"] = os.clock()

	mg_timer["loop3D"] = os.clock()

	--2D HEIGHTMAP GENERATION
----------------------------------------------------------------------
	generate_2d_map(minp, maxp, seed, area)
----------------------------------------------------------------------

	mg_timer["loop2D"] = os.clock()
	print("Time elapsed: "..tostring( mg_timer["loop2D"] - mg_timer["loop3D"] ));

	local index2d = 1
	local index3d = 1

	for z = minp.z, maxp.z do
		for y = minp.y, maxp.y do
			for x = minp.x, maxp.x do

				local ivm = area:index(x, y, z)
				local ai = area:index(x,y+1,z) --above index
				local bi = area:index(x,y-1,z) --below index

				local t_height				= gal.heightmap[index2d]
				local t_biome				= gal.biomemap[index2d]
				local biome_def				= gal.biome_info[t_biome]

				local t_ignore				= gal.mapgen.c_ignore
				local t_air					= gal.mapgen.c_air

				local t_sand				= gal.mapgen.c_sand
				local t_sandstone			= gal.mapgen.c_sandstone

				local t_node				= t_ignore
				if data[ivm] == t_air then
					t_node					= t_air
				end

				local t_stone				= biome_def.b_stone
				local t_filler				= biome_def.b_filler
				local t_top					= biome_def.b_top
					-- local t_water				= biome_def.b_water
					-- local t_water_top			= biome_def.b_water_top
						-- b_water_top_depth		= gal.biome_info[t_biome].b_water_top_depth or 1
					-- local t_river				= biome_def.b_river
					-- local t_riverbed			= biome_def.b_riverbed
						-- b_riverbed_depth			= gal.biome_info[t_biome].b_riverbed_depth or 4
					-- local t_cave_liquid			= biome_def.b_cave_liquid
				local t_dungeon				= biome_def.b_dungeon
				local t_dungeon_alt			= biome_def.b_dungeon_alt
					--t_dungeon_stair			= gal.biome_info[t_biome].b_dungeon_stair

				local t_eco				= gal.eco_map[index2d]

				local t_alt = gal.get_altitude_zone({x = x, y = t_height, z = z})
				local soil_type_idx, soil_idx, top_type_idx, top_idx = unpack(t_eco)
				if gal.ecosystems[t_biome] then
					t_top, t_filler, t_stone, t_dungeon, t_dungeon_alt = gal.get_ecosystem_data(t_biome, t_alt, soil_type_idx, soil_idx, top_type_idx, top_idx)
				end

				-- local t_top, t_filler, t_stone, t_dungeon, t_dungeon_alt
				-- if soil_idx > 0 then
					-- t_top = e_top
					-- t_filler = e_filler
					-- t_stone = e_stone
					-- t_dungeon = e_dungeon
					-- t_dungeon_alt = e_dungeon_alt
				-- else
					-- t_top = b_top
					-- t_filler = b_filler
					-- t_stone = b_stone
					-- t_dungeon = b_dungeon
					-- t_dungeon_alt = b_dungeon_alt
				-- end
--[[				t_top = b_top
				t_filler = b_filler
				t_stone = b_stone
				t_dungeon = b_dungeon
				t_dungeon_alt = b_dungeon_alt
				t_top = e_top
				t_filler = e_filler
				t_stone = e_stone
				t_dungeon = e_dungeon
				t_dungeon_alt = e_dungeon_alt--]]

				if y <= gal.mapgen.water_level then
					t_top = t_sand
					t_filler = t_sandstone
				end
				if data[ivm] == biome_def.b_top then
					t_node					= t_top
				end
				if data[ivm] == biome_def.b_filler then
					t_node					= t_filler
				end
				if data[ivm] == biome_def.b_stone then
					t_node					= t_stone
				end
				if data[ivm] == biome_def.b_dungeon then
					t_node					= t_dungeon
				end
				if data[ivm] == biome_def.b_dungeon_alt then
					t_node					= t_dungeon_alt
				end
				if (data[bi] == t_air or data[bi] == t_ignore) and t_node == t_stone then --ceiling
					-- t_node = t_dungeon
					-- if math.random() < 0.01 then
						t_node = t_dungeon_alt
						-- t_node = t_dungeon
					-- end
				end
				--ground
				if data[bi] == t_stone and (t_node == t_air or t_node == t_ignore) then --ground
					-- data[bi] = t_dungeon
					-- if math.random() < 0.01 then
						-- data[bi] = t_dungeon_alt
						data[bi] = t_dungeon
					-- end
				end

				data[ivm] = t_node

				index2d = index2d + 1
				index3d = index3d + 1

				write = true

			end
			index2d = index2d - (maxp.x - minp.x + 1) --shift the 2D index back
		end
		index2d = index2d + (maxp.x - minp.x + 1) --shift the 2D index up a layer
	end

	mg_timer["mainloop"] = os.clock()

	if write then
		vm:set_data(data)
	end

	mg_timer["setdata"] = os.clock()
	
	if write then

		minetest.generate_ores(vm,minp,maxp)
		minetest.generate_decorations(vm,minp,maxp)
			
		vm:set_lighting({day = 0, night = 0})
		vm:calc_lighting()
		vm:update_liquids()
	end

	mg_timer["liquid_lighting"] = os.clock()

	if write then
		vm:write_to_map()
	end

	mg_timer["write"] = os.clock()

	-- Print generation time of this mapchunk.
	local gen_msg = ("[gal] Generating from %s to %s"):format(minetest.pos_to_string(minp), minetest.pos_to_string(maxp)) .. "  :  " .. math.ceil((os.clock() - mg_timer["start"]) * 1000) .. " ms"
	print(gen_msg)

	table.insert(gal.mapgen_times.noisemaps, 0)
	table.insert(gal.mapgen_times.preparation,  mg_timer["preparation"] - mg_timer["start"])
	table.insert(gal.mapgen_times.loop3d, mg_timer["loop3D"] -  mg_timer["preparation"])
	table.insert(gal.mapgen_times.loop2d, mg_timer["loop2D"] - mg_timer["loop3D"])
	table.insert(gal.mapgen_times.mainloop, mg_timer["mainloop"] - mg_timer["loop2D"])
	table.insert(gal.mapgen_times.setdata, mg_timer["setdata"] - mg_timer["mainloop"])
	table.insert(gal.mapgen_times.liquid_lighting, mg_timer["liquid_lighting"] - mg_timer["setdata"])
	table.insert(gal.mapgen_times.writing, mg_timer["write"] - mg_timer["liquid_lighting"])
	table.insert(gal.mapgen_times.make_chunk, mg_timer["write"] - mg_timer["start"])

	-- Deal with memory issues. This, of course, is supposed to be automatic.
	local mem = math.floor(collectgarbage("count")/1000)

	if mem > 1000 then
		print("gal is manually collecting garbage as memory use has exceeded 500K.")
		collectgarbage("collect")
	end

end


minetest.register_on_generated(generate_map)


local function mean( t )
	local sum = 0
	local count= 0

	for k,v in pairs(t) do
		if type(v) == 'number' then
			sum = sum + v
			count = count + 1
		end
	end

	return (sum / count)
end

minetest.register_on_shutdown(function()

	if #gal.mapgen_times.make_chunk == 0 then
		return
	end

	--local average, standard_dev
	local average
	minetest.log("gal lua Mapgen Times:")

	average = mean(gal.mapgen_times.noisemaps)
	minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.preparation)
	minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.loop2d)
	minetest.log(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.loop3d)
	minetest.log(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.mainloop)
	minetest.log(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.setdata)
	minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.liquid_lighting)
	minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.writing)
	minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)

	average = mean(gal.mapgen_times.make_chunk)
	minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)

end)


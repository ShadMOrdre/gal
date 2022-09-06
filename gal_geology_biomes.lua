--
-- Register biomes
--


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

local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end


-- if gal.ecosystem_base == "default" then
	-- gal.biome_data_file = "gal_geology_biomes_default"
-- else
	gal.biome_data_file = "gal_geology_biomes_gal"
-- end



for i, biome in ipairs(gal.lib.csv.read("|", gal.path .. "/" .. gal.biome_data_file .. ".csv")) do

	--#Name|Dust|NodeTop|NodeTopDepth|Filler|FillerDepth|Stone|WaterTop|WaterTopDepth|Water|River water|RiverBed|RiverBedDepth|CaveLiquid|DungeonNode|DungeonAlt|DungeonStair|Y-min|Y-max|Temperature|Humidity|MaxPos|MinPos|VerticalBlend
	local a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x = unpack(biome)
	--minetest.log(a .. ", " .. b .. ", " .. c .. ", " .. d .. ", " .. e .. ", " .. f .. ", " .. g .. ", " .. h .. ", " .. i .. ", " .. j .. ", " .. k .. ", " .. l)

	-- Parse node names: transform empty strings into nil and separate node and count
--	b = read_node_str(b)
--	local c1, c2 = read_node_str(c)
--	local d1, d2 = read_node_str(d)
--	e = read_node_str(e)
--	local f1, f2 = read_node_str(f)
--	g = read_node_str(g)
--	h = read_node_str(h)

	a = read_node_str(a)
	b = read_node_str(b)
	c = read_node_str(c)
	d = read_node_str(d)
	e = read_node_str(e)
	f = read_node_str(f)
	g = read_node_str(g)
	h = read_node_str(h)
	i = read_node_str(i)
	j = read_node_str(j)
	k = read_node_str(k)
	l = read_node_str(l)
	m = read_node_str(m)
	n = read_node_str(n)
	o = read_node_str(o)
	p = read_node_str(p)
	q = read_node_str(q)
	r = read_node_str(r)
	s = read_node_str(s)
	t = read_node_str(t)
	u = read_node_str(u)
	v = read_node_str(v)
	w = read_node_str(w)
	x = read_node_str(x)

	minetest.register_biome({
		name = a,
		node_dust = b or nil,
		node_top = c or nil,
		depth_top = tonumber(d),
		node_filler = e or nil,
		depth_filler = tonumber(f),
		node_stone = g or nil,
		node_water_top = h or nil,
		depth_water_top = tonumber(i),
		node_water = j or nil,
		node_river_water = k or nil,
		node_riverbed = l or nil,
		depth_riverbed = tonumber(m),
		node_cave_liquid = n or nil,
		node_dungeon = o or nil,
		node_dungeon_alt = p or nil,
		node_dungeon_stair = q or nil,
		y_min = tonumber(r) or heights[r],
		y_max = tonumber(s) or heights[s],
		heat_point = tonumber(t) or temperatures[t],
		humidity_point = tonumber(u) or humidities[u],
		max_pos = tonumber(v),
		min_pos = tonumber(w),
		vertical_blend = tonumber(x) or gal.mapgen.biome_vertical_blend,
	})
end


function gal.get_altitude_zone(ppos)

	local t_altitude = ""

	if (ppos.y < gal.mapgen.beach_depth) then
		t_altitude = "ocean"
	elseif (ppos.y >= gal.mapgen.beach_depth) and (ppos.y < gal.mapgen.maxheight_beach) then
		t_altitude = "beach"
	elseif (ppos.y >= gal.mapgen.maxheight_beach) and (ppos.y < gal.mapgen.maxheight_coastal) then
		t_altitude = "coastal"
	elseif (ppos.y >= gal.mapgen.maxheight_coastal) and (ppos.y < gal.mapgen.maxheight_lowland) then
		t_altitude = "lowland"
	elseif (ppos.y >= gal.mapgen.maxheight_lowland) and (ppos.y < gal.mapgen.maxheight_shelf) then
		t_altitude = "shelf"
	elseif (ppos.y >= gal.mapgen.maxheight_shelf) and (ppos.y < gal.mapgen.maxheight_highland) then
		t_altitude = "highland"
	elseif (ppos.y >= gal.mapgen.maxheight_highland) and (ppos.y < gal.mapgen.maxheight_mountain) then
		t_altitude = "mountain"
	elseif (ppos.y >= gal.mapgen.maxheight_mountain) then
		t_altitude = "strato"
	end

--[[
	if ppos.y >= -31000 and ppos.y < -20000 then
		t_name = "generic_mantle"
	elseif ppos.y >= -20000 and ppos.y < -15000 then
		t_name = "stone_basalt_01_layer"
	elseif ppos.y >= -15000 and ppos.y < -10000 then
		t_name = "stone_brown_layer"
	elseif ppos.y >= -10000 and ppos.y < -6000 then
		t_name = "stone_sand_layer"
	elseif ppos.y >= -6000 and ppos.y < -5000 then
		t_name = "desert_stone_layer"
	elseif ppos.y >= -5000 and ppos.y < -4000 then
		t_name = "desert_sandstone_layer"
	elseif ppos.y >= -4000 and ppos.y < -3000 then
		t_name = "generic_stone_limestone_01_layer"
	elseif ppos.y >= -3000 and ppos.y < -2000 then
		t_name = "generic_granite_layer"
	elseif ppos.y >= -2000 and ppos.y < gal.mapgen.ocean_depth then
		t_name = "generic_stone_layer"
	else
		
	end
--]]

	return t_altitude

end

function gal.get_biome_name(pheat,phumid,ppos)

	local t_heat, t_humid, t_altitude, t_name

	--local m_heat1 = 12.5
	--local m_heat1 = 5
	local m_heat1 = (gal.mapgen.temperature_cool + gal.mapgen.temperature_cold) / 2
	--local m_heat2 = 37.5
	--local m_heat2 = 35
	local m_heat2 = (gal.mapgen.temperature_temperate + gal.mapgen.temperature_cool) / 2
	--local m_heat3 = 62.5
	--local m_heat3 = 65
	local m_heat3 = (gal.mapgen.temperature_warm + gal.mapgen.temperature_temperate) / 2
	--local m_heat4 = 87.5
	--local m_heat4 = 95
	local m_heat4 = (gal.mapgen.temperature_hot + gal.mapgen.temperature_warm) / 2

	--local m_humid1 = 12.5
	--local m_humid1 = 5
	local m_humid1 = (gal.mapgen.humidity_semiarid + gal.mapgen.humidity_arid) / 2
	--local m_humid2 = 37.5
	--local m_humid2 = 35
	local m_humid2 = (gal.mapgen.humidity_temperate + gal.mapgen.humidity_semiarid) / 2
	--local m_humid3 = 62.5
	--local m_humid3 = 65
	local m_humid3 = (gal.mapgen.humidity_semihumid + gal.mapgen.humidity_temperate) / 2
	--local m_humid4 = 87.5
	--local m_humid4 = 95
	local m_humid4 = (gal.mapgen.humidity_humid + gal.mapgen.humidity_semihumid) / 2


	if pheat < m_heat1 then
		t_heat = "cold"
	elseif pheat >= m_heat1 and pheat < m_heat2 then
		t_heat = "cool"
	elseif pheat >= m_heat2 and pheat < m_heat3 then
		t_heat = "temperate"
	elseif pheat >= m_heat3 and pheat < m_heat4 then
		t_heat = "warm"
	elseif pheat >= m_heat4 then
		t_heat = "hot"
	else

	end

	if phumid < m_humid1 then
		t_humid = "_arid"
	elseif phumid >= m_humid1 and phumid < m_humid2 then
		t_humid = "_semiarid"
	elseif phumid >= m_humid2 and phumid < m_humid3 then
		t_humid = "_temperate"
	elseif phumid >= m_humid3 and phumid < m_humid4 then
		t_humid = "_semihumid"
	elseif phumid >= m_humid4 then
		t_humid = "_humid"
	else

	end


--[[if ppos.y < gal.mapgen.beach_depth then
		t_altitude = "_ocean"
	elseif ppos.y >= gal.mapgen.beach_depth and ppos.y < gal.mapgen.maxheight_beach then
		t_altitude = "_beach"
	elseif ppos.y >= gal.mapgen.maxheight_beach and ppos.y < gal.mapgen.maxheight_highland then
		t_altitude = ""
	elseif ppos.y >= gal.mapgen.maxheight_highland and ppos.y < gal.mapgen.maxheight_mountain then
		t_altitude = "_mountain"
	elseif ppos.y >= gal.mapgen.maxheight_mountain then
		t_altitude = "_strato"
	else
		t_altitude = ""
	end
--]]

--[[if t_heat and t_heat ~= "" and t_humid and t_humid ~= "" then
		t_name = t_heat .. t_humid .. t_altitude
	else
		if (t_heat == "hot") and (t_humid == "_humid") and (pheat > 90) and (phumid > 90) and (t_altitude == "_beach") then
			t_name = "hot_humid_swamp"
		elseif (t_heat == "hot") and (t_humid == "_semihumid") and (pheat > 90) and (phumid > 80) and (t_altitude == "_beach") then
			t_name = "hot_semihumid_swamp"
		elseif (t_heat == "warm") and (t_humid == "_humid") and (pheat > 80) and (phumid > 90) and (t_altitude == "_beach") then
			t_name = "warm_humid_swamp"
		elseif (t_heat == "temperate") and (t_humid == "_humid") and (pheat > 57) and (phumid > 90) and (t_altitude == "_beach") then
			t_name = "temperate_humid_swamp"
		else
			t_name = "temperate_temperate"
		end
	end
--]]

--[[if ppos.y >= -31000 and ppos.y < -20000 then
		t_name = "generic_mantle"
	elseif ppos.y >= -20000 and ppos.y < -15000 then
		t_name = "stone_basalt_01_layer"
	elseif ppos.y >= -15000 and ppos.y < -10000 then
		t_name = "stone_brown_layer"
	elseif ppos.y >= -10000 and ppos.y < -6000 then
		t_name = "stone_sand_layer"
	elseif ppos.y >= -6000 and ppos.y < -5000 then
		t_name = "desert_stone_layer"
	elseif ppos.y >= -5000 and ppos.y < -4000 then
		t_name = "desert_sandstone_layer"
	elseif ppos.y >= -4000 and ppos.y < -3000 then
		t_name = "generic_stone_limestone_01_layer"
	elseif ppos.y >= -3000 and ppos.y < -2000 then
		t_name = "generic_granite_layer"
	elseif ppos.y >= -2000 and ppos.y < gal.mapgen.ocean_depth then
		t_name = "generic_stone_layer"
	else
		
	end
--]]

	t_name = t_heat .. t_humid

	return t_name

end






















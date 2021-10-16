

local S = gal.intllib

--Local vars to define air and tree trunks, leaves, fruits, vines, and other associated nodes for use within the lua schematics
--air is defined as an _ (underscore) throughout
--Leaf direction and probabilities are defined.
--Trunk direction and probabilities are defined
--Vine direction is defined
--Fruit uses a generic probability of 127


--[[  LUA SCHEMATICS NEED TO BE REDEFINED TO USE CENTRALIZED LOCAL VARIABLES UPDATING EACH VAR FOR EACH SCHEMATIC
--]]

local __ = {name = "air",param2 = 0,prob = 0}
local D0 = {name = "gal:dirt", param2 = 0, prob = 254}
local S0 = {name = "gal:stone", param2 = 0, prob = 254}

local LL --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 254, force_place = true}
local L0 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 254}
local L1 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 222}
local L2 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 190}
local L3 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 126}
local L4 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 96}
local L5 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 64}
local L6 --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 32}
local LN --= {name = "gal:tree_NAME_leaves",param2 = 0,prob = 254}
local LE --= {name = "gal:tree_NAME_leaves",param2 = 1,prob = 254}
local LS --= {name = "gal:tree_NAME_leaves",param2 = 2,prob = 254}
local LW --= {name = "gal:tree_NAME_leaves",param2 = 3,prob = 254}

local TT --= {name = "gal:tree_NAME_trunk",param2 = 0,prob = 254, force_place = true}
local T0 --= {name = "gal:tree_NAME_trunk",param2 = 0,prob = 254}
local T1 --= {name = "gal:tree_NAME_trunk",param2 = 0,prob = 254}
local T2 --= {name = "gal:tree_NAME_trunk",param2 = 0,prob = 160}
local T3 --= {name = "gal:tree_NAME_trunk",param2 = 0,prob = 127}
local TN --= {name = "gal:tree_NAME_trunk",param2 = 4,prob = 254}
local TS --= {name = "gal:tree_NAME_trunk",param2 = 8,prob = 254}
local TE --= {name = "gal:tree_NAME_trunk",param2 = 12,prob = 254}
local TW --= {name = "gal:tree_NAME_trunk",param2 = 16,prob = 254}

local V0 --= {name = "gal:plant_vine_01",param2 = 0,prob = 254}
local V1 --= {name = "gal:plant_vine_01",param2 = 1,prob = 254}
local V2 --= {name = "gal:plant_vine_01",param2 = 2,prob = 254}
local V3 --= {name = "gal:plant_vine_01",param2 = 3,prob = 254}
local VN --= {name = "gal:plant_vine_01",param2 = 0,prob = 254}
local VE --= {name = "gal:plant_vine_01",param2 = 1,prob = 254}
local VS --= {name = "gal:plant_vine_01",param2 = 2,prob = 254}
local VW --= {name = "gal:plant_vine_01",param2 = 3,prob = 254}

local F0 --= {name = "gal:fruit_NAME",param2 = 0,prob = 254}
local F1 --= {name = "gal:fruit_NAME",param2 = 0,prob = 222}
local F2 --= {name = "gal:fruit_NAME",param2 = 0,prob = 190}
local F3 --= {name = "gal:fruit_NAME",param2 = 0,prob = 127}
local F4 --= {name = "gal:fruit_NAME",param2 = 0,prob = 62}
local FN --= {name = "gal:fruit_NAME",param2 = 0,prob = 254}
local FE --= {name = "gal:fruit_NAME",param2 = 1,prob = 254}
local FS --= {name = "gal:fruit_NAME",param2 = 2,prob = 254}
local FW --= {name = "gal:fruit_NAME",param2 = 3,prob = 254}

local CN --= {name = "gal:fruit_NAME",param2 = 0,prob = 254}
local CE --= {name = "gal:fruit_NAME",param2 = 1,prob = 254}
local CS --= {name = "gal:fruit_NAME",param2 = 2,prob = 254}
local CW --= {name = "gal:fruit_NAME",param2 = 3,prob = 254}

local le_temp_schem = {}

--PLANTS

-- Bamboo Stalk with Leaves
	le_temp_schem = {
		size = {x = 1,y = 7,z = 1},
		data = {
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "gal:tree_bamboo_small_top",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254}
		}
	}
gal.schematics.insert("tree_bamboo_small_01", le_temp_schem)

--Cactus
	T0 = {name = "gal:cactus_green_trunk", param2 = 0, prob = 254}
	le_temp_schem = {
		size = {x = 5,y = 6,z = 1},
		data = {
			__, __, T0, __, __,
			__, __, T0, __, __,
			__, __, T0, __, __,
			T0, T0, T0, T0, T0,
			T0, __, T0, __, T0,
			__, __, T0, __, __
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254}
		}
	}
gal.schematics.insert("schem_cactus_01", le_temp_schem)



--Fern Trees
	local tr = {name = "gal:tree_fern_giant_trunk", param2 = 0, prob = 254}
	local tt = {name = "gal:tree_fern_giant_trunk_top", param2 = 0, prob = 254}
	local lp = {name = "gal:tree_fern_giant_leaves", param2 = 0, prob = 254}
	local ln = {name = "gal:tree_fern_giant_leaves_end", param2 = 0, prob = 254}
	local le = {name = "gal:tree_fern_giant_leaves_end", param2 = 1, prob = 254}
	local ls = {name = "gal:tree_fern_giant_leaves_end", param2 = 2, prob = 254}
	local lw = {name = "gal:tree_fern_giant_leaves_end", param2 = 3, prob = 254}
	local cr = {name = "gal:tree_fern_giant_crown", param2 = 0, prob = 254}
	le_temp_schem = {
		size = {x = 7, y = 21, z = 7},
		data = {

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, ls, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			lw, __, __, tr, __, __, le, 
			lp, __, lp, cr, lp, __, lp, 
			__, lp, __, __, __, lp, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, ln, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 127},
			{ypos = 6,prob = 254},
			{ypos = 7,prob = 127},
			{ypos = 8,prob = 254},
			{ypos = 9,prob = 127},
			{ypos = 10,prob = 254},
			{ypos = 11,prob = 127},
			{ypos = 12,prob = 254},
			{ypos = 13,prob = 127},
			{ypos = 14,prob = 254},
			{ypos = 15,prob = 127},
			{ypos = 16,prob = 254},
			{ypos = 17,prob = 254},
			{ypos = 18,prob = 254},
			{ypos = 19,prob = 254},
			{ypos = 20,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern_giant", le_temp_schem)

	local lbn = {name = "gal:tree_fern_giant_leaves_big", param2 = 0, prob = 254}
	local lbe = {name = "gal:tree_fern_giant_leaves_big", param2 = 1, prob = 254}
	local lbs = {name = "gal:tree_fern_giant_leaves_big", param2 = 2, prob = 254}
	local lbw = {name = "gal:tree_fern_giant_leaves_big", param2 = 3, prob = 254}
	le_temp_schem = {
		size = {x = 7, y = 7, z = 7},
		data = {

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbs, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbs, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbs, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			lbw, __,lbw,cr,lbe, __,lbe, 
			__, lbw, __,__, __,lbe, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbn, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbn, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __,lbn, __, __, __, 
			__, __, __, __, __, __, __, 

		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern", le_temp_schem)

	cr = {name = "gal:tree_fern_giant2_crown", param2 = 0, prob = 254}
	lp = {name = "gal:tree_fern_giant2_leaves", param2 = 0, prob = 254}
	ln = {name = "gal:tree_fern_giant2_leaves_end", param2 = 0, prob = 254}
	le = {name = "gal:tree_fern_giant2_leaves_end", param2 = 1, prob = 254}
	ls = {name = "gal:tree_fern_giant2_leaves_end", param2 = 2, prob = 254}
	lw = {name = "gal:tree_fern_giant2_leaves_end", param2 = 3, prob = 254}
	le_temp_schem = {
		size = {x = 7, y = 7, z = 7},
		data = {

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, ls, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			__, __, __, tr, __, __, __, 
			lw, __, __, tt, __, __, le, 
			lp, __, lp, cr, lp, __, lp, 
			__, lp, __, __, __, lp, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, lp, __, __, __, 

			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, __, __, __, __, 
			__, __, __, ln, __, __, __, 
			__, __, __, lp, __, __, __, 
			__, __, __, __, __, __, __, 

		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 254},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern_giant_2", le_temp_schem)

	le_temp_schem = {
		size = {x = 1,y = 4,z = 1},
		data = {
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_leaves_01",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern_small_01", le_temp_schem)

	le_temp_schem = {
		size = {x = 1,y = 4,z = 1},
		data = {
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_leaves_02",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern_small_02", le_temp_schem)

	le_temp_schem = {
		size = {x = 1,y = 6,z = 1},
		data = {
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_trunk_top",prob = 254},
			{param2 = 0,name = "gal:tree_fern_small_leaves",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254}
		}
	}
gal.schematics.insert("schem_tree_fern_small", le_temp_schem)






-- bush
local ai = {name = "air", param1 = 000}
local bp = {name = "gal:bush", param1 = 255}
local br = {name = "gal:bush", param1 = 100}
gal.bush = {

	size = {x = 5, y = 3, z = 5},

	data = {

		br, bp, bp, bp, br,
		ai, ai, ai, ai, ai,
		ai, ai, ai, ai, ai,

		bp, bp, bp, bp, bp,
		ai, br, bp, br, ai,
		ai, ai, ai, ai, ai,

		bp, bp, bp, bp, bp,
		ai, bp, bp, bp, ai,
		ai, ai, br, ai, ai,

		bp, bp, bp, bp, bp,
		ai, br, bp, br, ai,
		ai, ai, ai, ai, ai,

		br, bp, bp, bp, br,
		ai, ai, ai, ai, ai,
		ai, ai, ai, ai, ai,

	},

	yslice_prob = {
		{ypos = 1, prob = 127},
	},
}




--Blueberry bush
T0 = {name = "gal:bush_trunk", param2 = 0, prob = 254}
L0 = {name = "gal:bush_blueberry_leaves", param2 = 0, prob = 254}
L1 = {name = "gal:bush_blueberry_leaves", param2 = 0, prob = 192}
le_temp_schem = {
	size = {x = 3, y = 4, z = 3},
	data = {
		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L1, L0,

		__, D0, __,
		__, T0, __,
		L0, L0, L0,
		L1, L0, L0,

		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L0, L1
	},
	yslice_prob = {
		{ypos = 0,prob = 254},
		{ypos = 1,prob = 254},
		{ypos = 2,prob = 254},
		{ypos = 3,prob = 254},
	}
}
gal.schematics.insert("schem_bush_blueberry", le_temp_schem)

--Hawthorne bush
T0 = {name = "gal:bush_trunk", param2 = 0, prob = 254}
L0 = {name = "gal:bush_hawthorne_leaves", param2 = 0, prob = 254}
L1 = {name = "gal:bush_hawthorne_leaves", param2 = 0, prob = 192}
le_temp_schem = {
	size = {x = 3, y = 4, z = 3},
	data = {
		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L1, L0,

		__, D0, __,
		__, T0, __,
		L0, L0, L0,
		L1, L0, L0,

		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L0, L1
	},
	yslice_prob = {
		{ypos = 0,prob = 254},
		{ypos = 1,prob = 254},
		{ypos = 2,prob = 254},
		{ypos = 3,prob = 254},
	}
}
gal.schematics.insert("schem_bush_hawthorne", le_temp_schem)

--Rhodedendron bush
T0 = {name = "gal:bush_trunk", param2 = 0, prob = 254}
L0 = {name = "gal:bush_rhodedendron_leaves_1", param2 = 0, prob = 254}
L1 = {name = "gal:bush_rhodedendron_leaves_1", param2 = 0, prob = 192}
le_temp_schem = {
	size = {x = 3, y = 4, z = 3},
	data = {
		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L1, L0,

		__, D0, __,
		__, T0, __,
		L0, L0, L0,
		L1, L0, L0,

		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L0, L1
	},
	yslice_prob = {
		{ypos = 0,prob = 254},
		{ypos = 1,prob = 254},
		{ypos = 2,prob = 254},
		{ypos = 3,prob = 254},
	}
}
gal.schematics.insert("schem_bush_rhodedendron", le_temp_schem)

--Rhodedendron bush
T0 = {name = "gal:bush_trunk", param2 = 0, prob = 254}
L0 = {name = "gal:bush_rhodedendron_leaves_3", param2 = 0, prob = 254}
L1 = {name = "gal:bush_rhodedendron_leaves_3", param2 = 0, prob = 192}
le_temp_schem = {
	size = {x = 3, y = 4, z = 3},
	data = {
		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L1, L0,

		__, D0, __,
		__, T0, __,
		L0, L0, L0,
		L1, L0, L0,

		__, __, __,
		__, __, __,
		L0, L0, L0,
		L0, L0, L1
	},
	yslice_prob = {
		{ypos = 0,prob = 254},
		{ypos = 1,prob = 254},
		{ypos = 2,prob = 254},
		{ypos = 3,prob = 254},
	}
}
gal.schematics.insert("schem_bush_rhodedendron_blooming", le_temp_schem)


--
-- waterlilies
	le_temp_schem = {
		size = {x = 1, y = 3, z = 1},
		data = {
			{name = "gal:sand", param2 = 0, prob = 254},
			{name = "gal:liquid_water_source", param2 = 0, prob = 254},
			{name = "gal:plant_waterlily_pink", param2 = 0, prob = 254}
		},
	}
	gal.schematics.insert("schem_waterlily_pink", le_temp_schem)

	le_temp_schem = {
		size = {x = 1, y = 3, z = 1},
		data = {
			{name = "gal:sand", param2 = 0, prob = 254},
			{name = "gal:liquid_water_source", param2 = 0, prob = 254},
			{name = "gal:plant_waterlily_yellow", param2 = 0, prob = 254}
		},
	}
	gal.schematics.insert("schem_waterlily_yellow", le_temp_schem)
--





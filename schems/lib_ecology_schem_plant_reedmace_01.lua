



--Reedmace
	local N = gal.N

	--N["R0m00"] = "gal:plant_reedmace_water"

	return {
		size = {x = 1,y = 5,z = 1},
		data = {
			{param2 = 0,name = "gal:plant_reedmace_water",prob = 254,force_place = true},
			N["_____"],
			{param2 = 0,name = "gal:plant_reedmace_bottom",prob = 254},
			{param2 = 0,name = "gal:plant_reedmace_middle",prob = 254},
			{param2 = 0,name = "gal:plant_reedmace_top",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 254},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 254},
			{ypos = 4,prob = 254}
		}
	}

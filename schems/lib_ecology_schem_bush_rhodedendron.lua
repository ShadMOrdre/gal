
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


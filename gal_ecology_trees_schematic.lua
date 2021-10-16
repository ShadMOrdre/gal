
-- Schematics Library

gal.schematics = {}
gal.schematics.ver_maj = 0
gal.schematics.ver_min = 0
gal.schematics.ver_rev = 1

	--nodes = {},
local schem_list = {
	name = "",
	def = {}
}


gal.schematics.insert = function(name, def)
	schem_list[name] = def
end

gal.schematics.select = function(name)
	return schem_list[name]
end



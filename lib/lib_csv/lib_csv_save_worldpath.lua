--
-- save .csv file format
--
gal.lib.csv.save_worldpath = function(pobj, pfilename)
	local file = io.open(gal.path_world.."/"..pfilename..".csv", "w")
	if file then
		file:write(pobj)
		file:close()
	end
end


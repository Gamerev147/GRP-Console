/// @Description
/// @Param
function New(_dname, _w, _h) {
	
	var gWidth = real(_w);
	var gHeight = real(_h);
	
	//Create Database Grid
	var tG = ds_grid_create(gWidth, gHeight);
	
	//Create a map to save the grid to
	var tM = ds_map_create();
	ds_map_add(tM, string(_dname), tG);
	
	//Save the map to a file
	ds_map_secure_save(tM, _dname + ".dat");
	
	//destroy the map
	ds_map_destroy(tM);
	ds_grid_destroy(tG);
	
	ConsoleLog("[" + string(_dname) + "] was created.", 0, obj_RunnerConsole);
	ConsoleLog("Use [Add(val, val, ...)] to add items to the database.", 0, obj_RunnerConsole);

}


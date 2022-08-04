function Add(_dname, _x, _y, _val) {
	
	//check if database exists
	if (file_exists(_dname + ".dat")) {
		//load map
		var lMap = ds_map_secure_load(_dname + ".dat");
		
		//load grid from map
		var lGrid = ds_map_find_value(lMap, string(_dname));
		
		//add values to the grid
		if (lGrid != undefined) {
			ds_grid_add(lGrid, real(_x), real(_y), _val);	
		}
		
		//save the database
		ds_map_add(lMap, string(_dname), lGrid);
		ds_map_secure_save(lMap, _dname + ".dat");
		
		ds_map_destroy(lMap);
		
		ConsoleLog("Contents has been added to the database.", 0, obj_RunnerConsole);
		ConsoleLog(" ", 0, obj_RunnerConsole);
	} else {
		ConsoleLog("Database does not exist.", 0, obj_RunnerConsole);	
	}

}

function background(_fname) {
	
	var fname = string(_fname);
	
	if (fname != "default") {
		if (file_exists(_fname)) {
			obj_Console.Background_Path = fname;
			obj_Console.Background_Image = sprite_add(fname, 0, false, true, 0, 0);
			
			if (global.USER != "Guest") {
				var ufname = ("users/" + global.USER + ".user");
				if (file_exists(ufname)) {
					fast_file_encrypt(ufname, ufname, false);
					ini_open(ufname);
					ini_write_string("style", "background", fname);
					ini_close();
				}
				fast_file_encrypt(ufname, ufname, true);
			}
			
			ConsoleLog("Background has been set.", 0, obj_RunnerConsole);	
		} else {
			ConsoleLog("[c_red]File does not exist.", 0, obj_RunnerConsole);	
		}
	} else {
		obj_Console.Background_Path = "";
		obj_Console.Background_Image = undefined;
		
		if (global.USER != "Guest") {
			var ufname = ("users/" + global.USER + ".user");
			if (file_exists(ufname)) {
				fast_file_encrypt(ufname, ufname, false);
				ini_open(ufname);
				ini_write_string("style", "background", "");
				ini_close();
			}
			fast_file_encrypt(ufname, ufname, true);
		}
		
		ConsoleLog("Background has been set to default.", 0, obj_RunnerConsole);	
	}

}

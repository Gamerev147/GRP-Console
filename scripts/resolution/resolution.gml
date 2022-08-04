function resolution(_w, _h) {

	var UserFile = "";
	if (global.USER != "Guest") { UserFile = ("users/" + global.USER + ".user"); } else { 
		ConsoleLog("Please log in to change the resolution.", 0, RUN_ACTIVE);	
	}
	
	if (_w != "") && (_h != "") || (_w != undefined) && (_h != undefined) {
		var Width = real(_w);
		var Height = real(_h);
		
		window_set_size(Width, Height);
		display_set_gui_size(Width, Height);
		surface_resize(application_surface, Width, Height);
		
		room_width = Width;
		room_height = Height;
		
		//save resolution
		if (file_exists(UserFile)) {
			fast_file_encrypt(UserFile, UserFile, false);
			ini_open(UserFile);
			ini_write_real("system", "res_w", Width);
			ini_write_real("system", "res_h", Height);
			ini_close();
			
			fast_file_encrypt(UserFile, UserFile, true);
		}
		
		ConsoleLog("Resolution has been set to: " + string(Width) + "x" + string(Height), 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	} else {
		ConsoleLog("Current Resolution: " + string(Width) + "x" + string(Height), 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}

}


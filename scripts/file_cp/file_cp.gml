///@description file_cp(fname, new_fname, pass)
function file_cp(_fname, _newfname, _pass) {

	var fname = global.PATH + string(_fname);
	var new_fname = global.PATH + string(_newfname);
	var short_fname = global.CURRENT_PATH + string(_fname);
	var short_nname = global.CURRENT_PATH + string(_newfname);

	var pass = "";
	pass += string(_pass) + "";
		
	var fs = file_bin_open(fname, 0);
	var size = file_bin_size(fs);
	file_bin_close(fs);

	if (return_pass(fname) = false) {

		if (file_exists(string(fname))) {

			file_copy(fname, new_fname);
			ConsoleLog("-" + string(short_fname) + "- -" + string(size) + "B- [c_green]has been copied to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
			ConsoleLog(" ", 0, obj_RunnerConsole);

		} else {
	
			ConsoleLog("-" + string(short_fname) + "- [c_red]does not exist or the file name is incorrect.", 0, obj_RunnerConsole);
			ConsoleLog(" ", 0, obj_RunnerConsole);
	
		}
	
	} else {
	
		ini_open("_filepass_.ini");
		var p = ini_read_string("File_Passwords", string(fname), "");
		ini_close();
	
		if (string(pass) = string(p)) {
		
			if (file_exists(string(fname))) {

				file_copy(fname, new_fname);
				ConsoleLog("-" + string(short_fname) + "- -" + string(size) + "B- [c_green]has been copied to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
				ConsoleLog(" ", 0, obj_RunnerConsole);

			} else {
	
				var iib = instance_create(x, y, obj_PopupWindow);
				iib.title = "-- File Alert --";
				iib.text = "File does not exist or file name is incorrect.";
				iib.animate = true;	
	
			}
		
		} else {
		
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- File Alert --";
			ib.text = "File is password protected. Access Denied. Try entering a different password.";
			ib.animate = true;	
		
		}
	
	}



}

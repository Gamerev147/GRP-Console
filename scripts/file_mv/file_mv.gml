///@description file_mv(current_path, new_path, pass)
function file_mv(_cpath, _npath, _pass) {

	var fname = global.PATH + string(_cpath);
	var new_fname = string(_npath);
	var short_fname = global.CURRENT_PATH + string(_cpath);
	var short_nname = global.CURRENT_PATH + string(_npath);

	var pass = "";
	pass += string(_pass) + "";
		
	var fs = file_bin_open(fname, 0);
	var size = file_bin_size(fs);
	file_bin_close(fs);
	
	if (return_pass(fname) = false) {
	
		if (file_exists(fname)) {
		
			file_copy(fname, new_fname);
			file_delete(fname);
			ConsoleLog("-" + string(short_fname) + "- -" + string(size) + "B- [c_green]has been moved to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
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
		
			if (file_exists(fname)) {
		
				file_copy(fname, new_fname);
				file_delete(fname);
				ConsoleLog("-" + string(short_fname) + "- -" + string(size) + "B- [c_green]has been moved to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
				ConsoleLog(" ", 0, obj_RunnerConsole);
		
			} else {
		
				ConsoleLog("-" + string(short_fname) + "- [c_red]does not exist or the file name is incorrect.", 0, obj_RunnerConsole);	
				ConsoleLog(" ", 0, obj_RunnerConsole);
		
			}
		
		} else {
		
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- File Alert --";
			ib.text = "File is password protected. Access Denied. Try entering a different password.";
			ib.animate = true;	
		
		}
	
	}

}

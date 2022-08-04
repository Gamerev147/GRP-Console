///@description file_rn(current_name, new_name, pass)
function file_rn(_cname, _nname, _pass) {

	var cname = global.PATH + string(_cname);
	var nname = global.PATH + string(_nname);
	var short_cname = global.CURRENT_PATH + string(_cname);
	var short_nname = global.CURRENT_PATH + string(_nname);

	var pass = "";
	pass += string(_pass) + "";

	if (file_exists(string(cname))) {
	
		if (return_pass(cname) = false) {
	
			file_rename(string(cname), string(nname));
			ConsoleLog("File -" + string(short_cname) + "- [c_green]has been renamed to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
			ConsoleLog(" ", 0, obj_RunnerConsole);
	
		} else {
		
			ini_open("_filepass_.ini");
			var p = ini_read_string("File_Passwords", string(cname), "");
			ini_close();
		
			if (string(pass) = string(p)) {
			
				file_rename(string(cname), string(nname));
				ConsoleLog("File -" + string(short_cname) + "- [c_green]has been renamed to [c_white]-" + string(short_nname) + "-", 0, obj_RunnerConsole);
				ConsoleLog(" ", 0, obj_RunnerConsole);
			
			} else {
			
				var ib = instance_create(x, y, obj_PopupWindow);
				ib.title = "-- File Alert --";
				ib.text = "File is password protected. Access Denied. Try entering a different password.";
				ib.animate = true;	
			
			}
		
		}
	
	} else {
	
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;	
	
	}



}

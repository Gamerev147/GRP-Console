///@description file_passdl(fname, pass)
function file_passdl(_fname, _pass) {

	var fname = global.PATH + string(_fname);

	var pass = "";
	pass += string(_pass) + "";

	if (file_exists(fname)) {
	
		if ((string(_fname) != "directory.ini") && (string(_fname) != "imports.dat")) {
			
			if (return_pass(fname) = true) {
				
				ini_open("_filepass_.ini");
				var p = ini_read_string("File_Passwords", string(fname), "");
				
				if (p = pass) {
					ini_key_delete("File_Passwords", string(fname));
					ConsoleLog("Password has been removed from -" + string(fname) + "-.", 0, obj_RunnerConsole);
					ConsoleLog(" ", 0);
				} else {
					var ib = instance_create(x, y, obj_PopupWindow);
					ib.title = "-- File Alert --";
					ib.text = "File is password protected. Access Denied. Try entering a different password.";
					ib.animate = true;	
				}
				
				ini_close();
				
			} else {
				
				ConsoleLog("-" + string(fname) + "- is not password protected.", 0, obj_RunnerConsole);
				ConsoleLog(" ", 0);
				
			}
			
		} else {
			
			var iib = instance_create(x, y, obj_PopupWindow);
			iib.title = "-- File Alert --";
			iib.text = "File does not exist or file name is incorrect.";
			iib.animate = true;	
			
		}
	
	} else {
		
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;	
		
	}



}

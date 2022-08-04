///@description file_pass(fname, pass)
function file_pass(_fname, _pass) {


		var fname = global.PATH + string(_fname);

		var pass = "";
		pass += string(_pass) + "";

		if (file_exists(fname)) {
	
			if ((string(_fname) != "directory.ini") && (string(_fname) != "imports.dat")) {
			
				ini_open(fname);
				ini_write_string("Creation", "pass", string(pass));
				ini_close();
			
				ini_open("_filepass_.ini");
				ini_write_string("File_Passwords", string(fname), string(pass));
				ini_close();
			
				var b = instance_create(x, y, obj_PopupWindow);
				b.title = "-- File Alert --";
				b.text = "-" + string(fname) + "- is now password protected under " + string(global.USER) + ".";
				b.animate = true;	
			
				ConsoleLog("-" + string(fname) + "- is now password-locked.", 0, obj_RunnerConsole);
				ConsoleLog(" ", 0, obj_RunnerConsole);
			
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

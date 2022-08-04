///@description file_dl(fname, pass)
function file_dl(_fname, _pass) {

	var fname = global.PATH + string(_fname);
	var short_fname = global.CURRENT_PATH + string(_fname);

	var pass = "";
	pass += string(_pass) + "";

	if ((file_exists(fname)) && (string(_fname) != string(global.USER) + ".user")) {
		
		if (string(_fname) != "imports.dat") {
			
			if (return_pass(fname) = false) {
					
				var file = file_bin_open(fname, 0);
				var size = file_bin_size(file);
				file_bin_close(file);
					
				file_delete(string(fname));
				ConsoleLog("File -" + string(short_fname) + "- -" + string(size) + "B- [c_green]deleted successfully.", 0, obj_RunnerConsole); 
				//var ib = instance_create(x, y, obj_PopupWindow);
				//ib.title = "-- File Alert --";
				//ib.text = "File -" + string(fname) + "- -" + string(size) + "B- has successfully been deleted.";
				//ib.animate = true;	
			
			} else {
				
				var p = ini_read_string("File_Passwords", string(fname), "");
				
				if (string(pass) = string(p)) {
					
					var fd = file_delete(string(fname));
					if (fd) {
						ConsoleLog("File -" + string(short_fname) + "- [c_green]was successfully deleted!", 0, obj_RunnerConsole);
					} else { ConsoleLog("[c_red]Error deleting file.", 0, obj_RunnerConsole); }
					
				} else {
					var ib = instance_create(x, y, obj_PopupWindow);
					ib.title = "-- Security Alert --";
					ib.text = "File is password protected. \nAccess Denied.";
					ib.animate = true;		
				}
				
			}
			ini_close();
		
		} else {
			
			ConsoleLog("[c_red]File does not exist or is not available.", 0, obj_RunnerConsole);
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- File Alert --";
			ib.text = "File does not exist or is not available.";
			ib.animate = true;
			
		}
		
	} else {
		
		ConsoleLog("[c_red]File does not exist or is not available.", 0, obj_RunnerConsole);
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or is not available.";
		iib.animate = true;
		
	}

	ConsoleLog(" ", 0, obj_RunnerConsole);



}

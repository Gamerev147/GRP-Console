///@description file_op(fname, pass)
//logs the contents of a file
function contents(_fname, _pass="") {

	var fname = global.PATH + string(_fname);

	var pass = "";
	pass += string(_pass) + "";
		
	var fs = file_bin_open(fname, 0);
	var size = file_bin_size(fs);
	file_bin_close(fs);

	if (file_exists(fname)) {
	
		ini_open("_filepass_.ini");
		if (return_pass(fname) = false) {
	
			var file = file_text_open_read(fname);
			ConsoleLog("[c_green]-File size: " + string(size) + " Bytes.-", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
	
			while (!file_text_eof(file)) {
		
				var s = file_text_read_string(file);
				file_text_readln(file);
				ConsoleLog("   " + string(s), 0, RUN_ACTIVE);
		
			}
	
			file_text_close(file);
	
		} else {
		
			var p = ini_read_string("File_Passwords", string(fname), "");
			if (string(pass) = string(p)) {
			
				var file = file_text_open_read(fname);
				ConsoleLog("[c_green]-File size: " + string(size) + " Bytes.-", 0, RUN_ACTIVE);
				ConsoleLog(" ", 0, RUN_ACTIVE);
	
				while (!file_text_eof(file)) {
		
					var s = file_text_read_string(file);
					file_text_readln(file);
					ConsoleLog("   " + string(s), 0, RUN_ACTIVE);
		
				}
	
				file_text_close(file);
			
			} else {
			
				var ib = instance_create(x, y, obj_PopupWindow);
				ib.title = "-- File Alert --";
				ib.text = "File is password protected. Access Denied. Try entering a different password.";
				ib.animate = true;	
			
			}
		
		}
		ini_close();
	
	} else {
	
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;	
	
	}


	ConsoleLog(" ", 0, RUN_ACTIVE);

}

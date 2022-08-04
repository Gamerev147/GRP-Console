///@description ini_edit(fname, pass, sec, key, val)
function ini_edit(_fname, _pass, _sec, _key, _val) {

	if (file_exists("imports.dat")) { ini_open("imports.dat"); }
	var check = ini_read_real("IMPORTS", "FILE", 0);
	ini_close();

	if (check = true) {

	var fname = "";
	fname += string(_fname) + "";

	var pass = "";
	pass += string(_pass) + "";

	var sec = "";
	sec += string(_sec) + "";

	var key = "";
	key += string(_key) + "";

	var val = "";
	val += string(_val) + "";


	if (file_exists(string(fname))) {
	
		ini_open("_filepass_.ini");
		if (return_pass(fname) = true) {
		
			var p = ini_read_string("File_Passwords", string(fname), "");	
			ini_close();
			if (string(pass) = string(p)) {
			
				ini_open(fname);
			
			
			} else {
			
				ConsoleLog("File is password protected.", 0);
				ConsoleLog("Access denied.", 0);
			
			}
		
		} else {
		
			var file = file_text_open_append(fname);
			file_text_write_string(file, string(str));
			file_text_writeln(file);
			file_text_close(file);
			ConsoleLog("Data has been written to [" + string(fname) + "]", 0);
		
		}
	
	} else {
	
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;		
	
	}

	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- System Error --";
		ib.text = "Class has not been imported for use!";
		ib.animate = true;
	
	}

	ConsoleLog(" ", 0);



}

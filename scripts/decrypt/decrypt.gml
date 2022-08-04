///@description decrypt(fname)
function decrypt(_fname, _override = "", _password = "") {

	//If 'true' as 'is_encoded' parameter when encoding file, then use 'false' when decoding or vice versa

	var fname = global.PATH + string(_fname);
	var short_fname = global.CURRENT_PATH + string(_fname);
	var fname_ext = string_copy(_fname, string_last_pos(".", _fname), 5);
	
	if (file_exists(fname) && fname_ext != ".user") {
		
		fast_file_encrypt(string(fname), string(fname), false);
		ConsoleLog("-" + string(short_fname) + "- [c_green]has been decoded successfully.", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
		
	} else if (fname_ext == ".user") {
		if (_override != "--de") {
			ConsoleLog("[c_red]Access to user file restricted.", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		} else {
			fast_file_encrypt(string(fname), string(fname), false);
			
			//check password
			ini_open(fname);
			var checkpass = ini_read_string("data", "Password", "");
			ini_close();
			
			if (checkpass == _password) {
				ConsoleLog("-" + string(short_fname) + "- [c_green]has been decoded successfully.", 0, RUN_ACTIVE);
				ConsoleLog(" ", 0, RUN_ACTIVE);
			} else {
				ConsoleLog("[c_red]Password incorrect. Access restricted.", 0, RUN_ACTIVE);
				ConsoleLog(" ", 0, RUN_ACTIVE);	
				fast_file_encrypt(string(fname), string(fname), true);
				exit;
			}
		}
	} else {
		
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;	
		
	}


}

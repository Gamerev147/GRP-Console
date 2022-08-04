///@description encrypt(fname)
function encrypt(_fname) {

	//If 'true' as 'is_encoded' parameter when encoding file, then use 'false' when decoding or vice versa

	var fname = global.PATH + string(_fname);
	var short_fname = global.CURRENT_PATH + string(_fname);

	if (file_exists(fname)) {
		
		fast_file_encrypt(string(fname), string(fname), true);
		ConsoleLog("-" + string(short_fname) + "- [c_green]has been encoded successfully.", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);

	} else {
		
		var iib = instance_create(x, y, obj_PopupWindow);
		iib.title = "-- File Alert --";
		iib.text = "File does not exist or file name is incorrect.";
		iib.animate = true;	
		
	}
	
}


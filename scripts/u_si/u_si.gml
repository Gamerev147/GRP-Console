///@description u_si(image)
function u_si(_img) {

	if (global.USER != "Guest") {
		var fname = "users/" + string(global.USER) + ".USER";
	} else {
		exit;	
	}
	
	var img = "";
	img += string(_img) + "";

	//Change user picture
	if (file_exists(fname)) {
		decrypt(fname);
		ini_open(fname);

		if (file_exists(img)) {
			ini_write_string("data", "Image", img);
			ConsoleLog("User image set to -" + string(img) + "-", 0);
		} else {
			ConsoleLog("The specified image was not found.", 0);
		}
			
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "User image has been set!";
		ib.animate = true;	
		
		ini_close();
	} else {
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "User account does not exist.";
		ib.animate = true;		
	}

	encrypt(fname);
	ConsoleLog(" ", 0);


}

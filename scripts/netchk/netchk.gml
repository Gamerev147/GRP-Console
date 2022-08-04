///@description n_ch()
function netchk() {

	//Net Check Connection

	if (file_exists("imports.dat")) { ini_open("imports.dat"); }
	var check = ini_read_real("IMPORTS", "NET", 0);
	ini_close();

	if (check = true) {

	if (os_is_network_connected()) {
	
		ConsoleLog("Network is connected.", 0);	
	
	} else {
	
		ConsoleLog("Network is not connected.", 0);	
	
	}

	ConsoleLog(" ", 0);

	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- System Error --";
		ib.text = "Class has not been imported for use!";
		ib.animate = true;
	
	}



}

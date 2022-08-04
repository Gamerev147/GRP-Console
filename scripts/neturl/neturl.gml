///@description n_url(url)
function neturl(argument0) {

	if (file_exists("imports.dat")) { ini_open("imports.dat"); }
	var check = ini_read_real("IMPORTS", "NET", 0);
	ini_close();

	if (check = true) {

	var url = "http://";
	url += string(argument0[0]) + "";

	url_open(url);
	ConsoleLog("URL to client connected successfully!", 0);

	ConsoleLog(" ", 0);

	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- System Error --";
		ib.text = "Class has not been imported for use!";
		ib.animate = true;
	
	}



}

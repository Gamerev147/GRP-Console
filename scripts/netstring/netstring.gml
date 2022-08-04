///@description n_get_s(url)
function netstring(argument0) {

	if (file_exists("imports.dat")) { ini_open("imports.dat"); }
	var check = ini_read_real("IMPORTS", "NET", 0);
	ini_close();

	if (check = true) {

	//Set the URL
	var url = "";
	url += string(argument0[0]) + "";

	if (url = "-i") {
	
		var i = instance_create(0, 0, obj_GetHttp);
		i.argURL = "ipv4bot.whatismyipaddress.com/";
	
	} else {

		var i = instance_create(0, 0, obj_GetHttp);
		i.argURL = string(url);

	}

	ConsoleLog(" ", 0);

	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- System Error --";
		ib.text = "Class has not been imported for use!";
		ib.animate = true;
	
	}



}

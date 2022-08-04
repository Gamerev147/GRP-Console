/// @description 

if (global.__INIT__) {
	a = 1;	
} else {
	a -= 0.04;	
}

if (init) {
	//Resolution
	var uf;
	if (global.USER != "Guest") { uf = ("users/" + global.USER + ".user"); }
	if (global.USER != "Guest") && (file_exists(uf)) {
		fast_file_encrypt(uf, uf, false);
		ini_open(uf);
		var tw = ini_read_real("system", "res_w", room_width);
		var th = ini_read_real("system", "res_h", room_height);
		ini_close();
	
		window_set_size(tw, th);
		display_set_gui_size(tw, th);
		surface_resize(application_surface, tw, th);
		room_width = tw;
		room_height = th;
	
		fast_file_encrypt(uf, uf, true);
	}
	
	init = false;
	
}

if (a <= 0) {
	instance_destroy();	
}

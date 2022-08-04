/// @description __INIT__

instance_deactivate_object(ChromeControl);

//Check for missing files
syscan("--h");

//Load Color Scheme
var ufile = "users/" + string(global.USER) + ".user";
if (file_exists(ufile)) {
	fast_file_encrypt(ufile, ufile, false);
	ini_open(ufile);
	Text_SecondaryColor = ini_read_real("style", "color_t", c_white);
	Background_Color = ini_read_real("style", "color_b", c_black);
	Outline_Color = ini_read_real("style", "color_o", c_white);
	
	if (ini_key_exists("style", "background")) {
		Background_Path = ini_read_string("style", "background", "");
		if (Background_Path != "") {
			Background_Image = sprite_add(Background_Path, 0, false, true, 0, 0);	
		}
	}
	
	ini_close();
	fast_file_encrypt(ufile, ufile, true);
}

window_set_cursor(cr_default);

global.__INIT__ = false;

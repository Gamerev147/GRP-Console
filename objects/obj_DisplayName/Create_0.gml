///@description

x = room_width/2;
y = room_height/2;
alarm[0] = 120;

//Grab Profile Picture
var ufp = "users/" + string(global.USER) + ".user";

if (file_exists(ufp)) {
	fast_file_encrypt(ufp, ufp, false);
	ini_open(ufp);
	global.USER_IMAGE_PATH = ini_read_string("data", "Image", "null");
	ini_close();
	
	fast_file_encrypt(ufp, ufp, true);
	
	alarm[1] = 6;
}

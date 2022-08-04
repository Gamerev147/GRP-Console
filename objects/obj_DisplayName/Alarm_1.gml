/// @description Get Profile Picture

if (global.USER_IMAGE_PATH != "null") {
	if (file_exists(string(global.USER_IMAGE_PATH))) {
		global.USER_IMAGE = sprite_add(global.USER_IMAGE_PATH, 0, false, true, 0, 0);	
	}
}

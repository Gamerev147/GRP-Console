///@description Animate and Function

if (animate = true) {
	
	if (window_width < max_window_width) {
		window_width += 32;	
	}
	
	if (window_height < max_window_height) {
		window_height += 32;	
	}
	
}

if (window_width = max_window_width) {
	animate = false;	
	animate_done = true;
}

input = keyboard_string;

//CHECK FOR COMMAND
if (keyboard_check_released(vk_enter)) {
	
	global.c_userName = string(input);
	keyboard_string = "";
	global.CAN_TYPE = true;
	if (!instance_exists(obj_CreatePassword)) {
		var pp = instance_create_layer(x, y, "alert", obj_CreatePassword);
		pp.title = "Create a password:";
		pp.animate = true;
	}
	instance_destroy();
	
}

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
	
	global.c_userPass = string(input);
	keyboard_string = "";
	global.CAN_TYPE = true;
	if (global.c_userName != "guest") && (global.c_userName != "Guest") {
		if (global.c_userPass != "") {
			u_cr(global.c_userName, global.c_userPass);	
		}
	} else {
		global.USER = "Guest";	
	}
	instance_destroy();
	
}

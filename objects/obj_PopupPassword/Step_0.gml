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
	
	global.e_userPass = string(input);
	keyboard_string = "";
	global.CAN_TYPE = true;
	if (global.e_userName != "guest") && (global.e_userName != "Guest") {
		u_li(global.e_userName, global.e_userPass);	
	} else {
		global.USER = "Guest";	
	}
	instance_destroy();
	
}

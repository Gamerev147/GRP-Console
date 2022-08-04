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
if (keyboard_check_pressed(vk_enter)) {
	
	global.MAX_CL = real(input);
	instance_create(x, y, obj_Server);
	var cip = instance_create(x, y, obj_NetworkClientIP);
	cip.title = "IP to Connect:"
	cip.animate = true;
	instance_destroy();
	//global.CAN_TYPE = true;
	
}

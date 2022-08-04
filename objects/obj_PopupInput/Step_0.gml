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
	
	ds_map_add(VARMAP, string(save_var), string(input));
	alarm[0] = 6;
	keyboard_string = "";
	global.CAN_TYPE = true;
	
}

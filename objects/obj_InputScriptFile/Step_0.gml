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
	
	if (file_exists(input)) {
		ds_map_add(obj_ScriptEditor.file_map, input, input);	
	} else {
		var tf = file_text_open_write(input);
		file_text_close(tf);
		
		ds_map_add(obj_ScriptEditor.file_map, input, input);
	}
	
	keyboard_string = "";
	instance_destroy();
	
}

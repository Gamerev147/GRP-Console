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

//Destroy Popup Window
if (keyboard_check_pressed(vk_enter)) {
	
	if (pointer != 0) && (pointer != undefined) {
		if (script_exists(asset_get_index(pointer))) {
			script_execute(asset_get_index(pointer));	
		} else {
			run(pointer);	
		}
	}
	
	instance_destroy();	
}

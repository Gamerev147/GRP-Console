/// @Description full(exit_full)

function full(_exit) {
	
	var ex = "";
	ex += string(_exit) + "";
	
	if (ex == "exit") {
		
		var width = 1280;
		var height = 720;
		
		room_width = width;
		room_height = height;
		
		surface_resize(application_surface, width, height);
		display_set_gui_size(width, height);
		window_set_fullscreen(false);
		window_set_size(width, height);
		
		with (obj_Console) {
		
			HSize = window_get_width();
			VSize = window_get_height() - 20;
		
		}
		
	} else {
	
		var width = display_get_width();
		var height = display_get_height();
	
		room_width = width;
		room_height = height;
	
		surface_resize(application_surface, width, height);
		display_set_gui_size(width, height);
		window_set_size(width, height);
	
		with (obj_Console) {
		
			HSize = window_get_width();
			VSize = window_get_height() - 20;
		
		}
	
		window_set_fullscreen(true);
	
	}

}

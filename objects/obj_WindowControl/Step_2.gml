/// @description Get Active Window

if (!ds_list_empty(RUNNERS)) {
	RUN_ACTIVE = ds_list_find_value(RUNNERS, 0);	
} else {
	RUN_ACTIVE = noone;	
}

if (!ds_list_empty(WINDOWS)) {
	WIN_ACTIVE = ds_list_find_value(WINDOWS, 0);	
} else {
	WIN_ACTIVE = noone;	
}

//runners
if (mouse_check_button_released(mb_left)) {
	
	//Loop through windows and compare coordinates
	for (var i = ds_list_size(RUNNERS); i >= 0; i -= 1) {
		var cw = ds_list_find_value(RUNNERS, i);
		var return_id = cw;
		
		if (cw != 0) && (cw != undefined) {
			var xx = cw.window_start_x;
			var yy = cw.window_start_y;
			var ww = cw.window_width;
			var hh = cw.window_height;
			
			if (point_in_rectangle(mouse_x, mouse_y, xx, yy, ww, hh)) {
				ds_list_delete(RUNNERS, ds_list_find_index(RUNNERS, cw.id));
				ds_list_insert(RUNNERS, 0, return_id);
			}
		}
	}
	
}

//windows
if (mouse_check_button_pressed(mb_left)) {
	
	//Loop through windows and compare coordinates
	for (var i = ds_list_size(WINDOWS)-1; i > 0; i -= 1) {
		var cw = ds_list_find_value(WINDOWS, i);
		
		if (cw != 0) && (cw != undefined) {
			with (cw) {
				if (point_in_rectangle(mouse_x, mouse_y, cw.window_start_x, cw.window_start_y, cw.window_width, cw.window_height) && cw.__nodock) {
					//if (cw.mouse_in_window) {
						ds_list_delete(WINDOWS, ds_list_find_index(WINDOWS, cw));
						ds_list_insert(WINDOWS, 0, cw);
					//}
				}
			}
		}
	}
	
}


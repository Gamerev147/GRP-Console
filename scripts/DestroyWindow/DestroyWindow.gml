function DestroyWindow(wId) {
	
	if (is_real(wId)) {
		var targetWindow = real(wId);
	} else {
		var targetWindow = ds_map_find_value(VARMAP, string(wId));
	}
	
	if (!is_undefined(targetWindow)) {
		with (targetWindow) {
			ds_map_delete(VARMAP, string(wId));
			instance_destroy();	
		}
		
		show_debug_message("DESTROYED window " + string(targetWindow) + ".");
	}

}

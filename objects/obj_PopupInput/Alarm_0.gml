/// @description 
if (pointer != 0) && (pointer != undefined) {
	if (script_exists(asset_get_index(pointer))) {
		script_execute_ext(asset_get_index(pointer), pointer_args);	
	} else {
		if (file_exists(string(pointer))) {
			run(string(pointer));	
		} else {
			show_debug_message("pointer file doesn't exist.");	
		}
	}
}

instance_destroy();
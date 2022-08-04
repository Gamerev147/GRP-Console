function Import(_class) {

	var class = string(_class);
	
	switch (class) {
		case "#SYSTEM":
			ds_map_add(VARMAP, "__imem__", string(bytes_to_gigabytes(ram_installed())));
			ds_map_add(VARMAP, "__umem__", string(bytes_to_gigabytes(ram_used())));
			ds_map_add(VARMAP, "__amem__", string(bytes_to_gigabytes(ram_available())));
			ds_map_add(VARMAP, "__ihash__", string(global.IDENTIFIER_HASH));
			ds_map_add(VARMAP, "__version__", string(global.VERSION));
			
			show_debug_message("\nSystem information has been added to VARMAP. \n");
		break;
		
		case "#USER":
			ds_map_add(VARMAP, "__user__", string(global.USER));
			ds_map_add(VARMAP, "__user_i__", global.USER_IMAGE_PATH);
			
			show_debug_message("\nUser information has been added to VARMAP. \n");
		break;
		
		case "#TIME":
			ds_map_add(VARMAP, "__hour__", string(current_hour));
			ds_map_add(VARMAP, "__min__", string(current_minute));
			ds_map_add(VARMAP, "__sec__", string(current_second));
			ds_map_add(VARMAP, "__time__", string(current_time));
			
			show_debug_message("\nTime has been added to VARMAP. \n");
		break;
		
		default:
			ds_list_add(RUNTIME_ERRORS, "Import class (" + string(class) + ") unknown.");
			throw_error("Import class (" + string(class) + ") is unknown.", "");
		break;
	}

}

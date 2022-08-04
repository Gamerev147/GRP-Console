function Export(_class) {

	var class = string(_class);
	
	switch (class) {
		case "#SYSTEM":
			ds_map_delete(VARMAP, "__imem__");
			ds_map_delete(VARMAP, "__umem__");
			ds_map_delete(VARMAP, "__amem__");
			ds_map_delete(VARMAP, "__ihash__");
			ds_map_delete(VARMAP, "__version__");
			
			show_debug_message("\nSystem information has been removed from VARMAP. \n");
		break;
		
		case "#USER":
			ds_map_delete(VARMAP, "__user__");
			ds_map_delete(VARMAP, "__user_i__");
			
			show_debug_message("\nUser information has been removed from VARMAP. \n");
		break;
		
		case "#TIME":
			ds_map_delete(VARMAP, "__thour__");
			ds_map_delete(VARMAP, "__tmin__");
			ds_map_delete(VARMAP, "__tsec__");
			ds_map_delete(VARMAP, "__time__");
			
			show_debug_message("\nTime has been removed from VARMAP. \n");
		break;
		
		default:
			ds_list_add(RUNTIME_ERRORS, "Import class (" + string(class) + ") unknown.");
		break;
	}

}

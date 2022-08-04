/// @description execute pointer

var exeScript = asset_get_index(pointer);

if (exeScript != -1) {
	if (script_exists(exeScript)) {
		script_execute_ext(exeScript, pointer_arguments);
		instance_destroy();
	}
} else {
	
	//check if pointer is file
	if (file_exists(exeScript)) {
		run(exeScript);	
	} else {
		
		//no script was found
		ds_list_add(RUNTIME_ERRORS, "[c_white]Wait object (" + string(id) + ") [c_red]Pointer script or file not found (" + string(pointer) + ")");
		
	}
	
}

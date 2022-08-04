function editor_add_file(_fname) {
	
	var fname = string(_fname);
	
	if (instance_exists(obj_ScriptEditor)) {
		var addMap = obj_ScriptEditor.file_map;	
		ds_map_add(addMap, fname, fname);
		show_debug_message("File added to editor.");
	}

}

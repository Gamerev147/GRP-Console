function ConsoleGetMissing(_file_array) {

	var file_array = _file_array;
	
	show_debug_message("Starting missing file download...");
	
	for (var f = 0; f < array_length(file_array); f++) {
		var file = file_array[f];
		var file_name = string_copy(file, string_last_pos("/", file)+1, string_length(file));
		var file_path = string_copy(file, 1, string_last_pos("/", file));
		install("gmrv", string(file_name), string(file_path));
	}
	
	ConsoleLog(" ", 0);
	ConsoleLog("[c_yellow]Process complete.", 0);

}

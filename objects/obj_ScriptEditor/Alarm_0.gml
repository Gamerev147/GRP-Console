/// @description File check

//check if the file exists
if (file_exists(file_name)) {
	//read the file and set its text to the editor's
	var ls = file_text_read_all(file_name);
	if (ls != "") {
		tte_ext_input_set_text(string(ls));
	} else {
		tte_ext_input_set_text(string(file_name));	
	}
	
	//we found an existing file
	file_found = true;
} else {
	tte_ext_input_set_text(".. Type your script here ..");	
	//no file was found
}
	
//get the display name
var char = "/";
var sep = string_last_pos(char, file_name);
if (sep != 0) {
	file_display_name = string_copy(file_name, sep, string_length(file_name));	
}

//add the file to the map
ds_map_add(file_map, file_display_name, file_name);

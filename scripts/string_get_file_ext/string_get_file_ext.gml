function string_get_file_ext(_string) {
	
	var file_string = string(_string);
	
	var file_Identifier = string_pos(".", file_string);
	var file_Ext = string_copy(file_string, file_Identifier+1, 4);
	
	return file_Ext;

}


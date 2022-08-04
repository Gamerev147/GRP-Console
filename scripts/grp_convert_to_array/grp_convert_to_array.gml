function grp_convert_to_array(_fname) {
	
	var convertFile = string(_fname);
	var convertArray = [];
	
	if (file_exists(convertFile)) {
		var cfl = file_text_open_read(convertFile);
		while (!file_text_eof(cfl)) {
			var cfs = file_text_readln(cfl);
			array_push(convertArray, cfs);
		}
		
		file_text_close(cfl);
	} else {
		return -1;	
	}
	
	//array_log_to_console(convertArray);
	return convertArray;

}



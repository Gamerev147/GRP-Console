function file_comp(_fname1, _fname2) {
	
	var fname1 = string(_fname1);
	var fname2 = string(_fname2);
	
	var line1 = [];
	var line2 = [];
	var a1 = 0;
	var a2 = 0;
	
	if (file_exists(fname1)) && (file_exists(fname2)) {
		var f1 = file_text_open_read(fname1);
		var f2 = file_text_open_read(fname2);
		
		//inspect file one
		while (!file_text_eof(f1)) {
			line1[a1] = file_text_read_string(f1);	
			file_text_readln(f1);
			a1 += 1;
		}
		
		while (!file_text_eof(f2)) {
			line2[a2] = file_text_read_string(f2);
			file_text_readln(f2);
			a2 += 1;
		}
		
		//show_debug_message("File 1: " + string(line1));
		//show_debug_message("File 2: " + string(line2));
		
		//compare the arrays
		if (array_equals(line1, line2)) {
			ConsoleLog("Files are identical.", 0, RUN_ACTIVE);	
		} else {
			ConsoleLog("Files are not the same.", 0, RUN_ACTIVE);	
		}
	} else {
		ConsoleLog("[c_red]One or both of the given files does not exist.", 0, RUN_ACTIVE);	
	}

}
function get_function_content(_filename, _funcname, _startln=0) {
	
	//get filename and convert it to array
	var functionFileName = string(_filename);
	var functionName = string(_funcname);
	var functionStart = real(_startln);
	var rawFileArray = grp_convert_to_array(functionFileName);
	var rawFunctionArray = [];
	
	//loop through the rawFileArray
	if (rawFileArray != -1) {
		for (var fa = functionStart; fa < array_length(rawFileArray); fa ++) {
			//get the line of code
			var cfv = rawFileArray[fa];
		
			//check if the line contains ':'
			if (string_char_at(cfv, 1) == ":" || string_char_at(cfv, 1) == "	") {
				//add this line (minus ':' or '		') to the functionArray
				var pushLine = string_delete(cfv, 1, 1);
				array_push(rawFunctionArray, string(pushLine));
			} else { break; }
		}
	}
	
	//write the array to a temp file
	var tempFunctionFile = "temp/" + functionName + ".tgrp";
	var twf = file_text_open_write(tempFunctionFile);
	for (var fl = 0; fl < array_length(rawFunctionArray); fl++) {
		var cvfl = rawFunctionArray[fl];
		file_text_write_string(twf, string(cvfl));
	}
	file_text_close(twf);
	
	return tempFunctionFile;

}


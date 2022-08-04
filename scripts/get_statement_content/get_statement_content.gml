function get_statement_content(_filename, _char, _startln, _execute) {
	
	var statementFile = string(_filename);
	var stateChar = string(_char);
	var statementStart = real(_startln);
	var rawStateArray = grp_convert_to_array(statementFile);
	
	var statementContent = [];
	var statementLen = 0;
	var statementExecute = bool(_execute);
	
	if (rawStateArray != -1) {
		for (var st = statementStart; st < array_length(rawStateArray); st++) {
			var stateLine = rawStateArray[st];
			if (string_char_at(stateLine, 1) == stateChar) || (string_char_at(stateLine, 1) == "	") {
				var pl = string_delete(stateLine, 1, 1);
				array_push(statementContent, pl);	
				statementLen ++;
			} else {
				break;	
			}
		}
	} else {
		show_debug_message("FILE COULD NOT CONVERT TO ARRAY");
		return;
	}
	
	//write the array to a temp file
	var tempStateFile = "temp/" + string(statementStart) + ".tgrp";
	var tsf = file_text_open_write(tempStateFile);
	for (var fs = 0; fs < array_length(statementContent); fs++) {
		var cvfs = statementContent[fs];
		file_text_write_string(tsf, string(cvfs));
	}
	file_text_close(tsf);
	
	//run the temp file
	if (statementExecute) {
		run(tempStateFile);
	}
	
	return statementLen;
	

}
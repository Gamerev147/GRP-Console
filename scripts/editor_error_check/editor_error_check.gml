function editor_error_check() {

	var current_line = tte_ext_input_getln();
	
	if (current_line != "") {
		var Script = "";
		var cWord = "";
		
		for (var i = 0; i < string_length(current_line); i++) {
			var nextCh = string_char_at(current_line, i+1);	
			
			if (nextCh != ">") {
				cWord += nextCh;	
			} else {
				if (Script == "") {
					var found_keyword = ds_list_find_index(KEYWORDS, string(cWord));	
					if (found_keyword == -1) {
						Script = cWord;
						if (script_exists(asset_get_index(Script))) {
							display_script_error = false;
						} else {
							display_script_error = true;	
						}
					}
				}
			}
		}
		
		//check arguments for namespace
		var start_ind = string_pos("^", cWord);
		var end_ind = string_pos_ext("^", cWord, start_ind+1);
					
		if (start_ind != 0) {
			var str_count = end_ind - start_ind;
			var check_word = string_copy(cWord, start_ind+1, str_count-1);
			if (ds_map_exists(VARMAP, string(check_word))) {
				display_namespace_error = false;
			} else {
				display_namespace_error = true;
			}
		}
	}
	
	
	
	
	
	/*
	var script_id = string_pos(">", current_line);
	var active_script = string_copy(current_line, 1, script_id-1);
	
	switch (active_script) {
		case "":
		case " ":
		case "..":
		case "if":
		case "rpt":
		case "var":
		case "ifnot":
			display_script_error = false;
		break;
		
		default:
			if (!script_exists(asset_get_index(active_script))) {
				display_script_error = true;	
			} else {
				display_script_error = false;	
			}
		break;
	}
	*/

}

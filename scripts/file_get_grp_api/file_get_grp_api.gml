function file_get_grp_api(_fname, _hidden=true) {
	
	var api_file = string(_fname);
	var hidden = _hidden;
	
	var title_comments = [];
	var		 _comments = [];
	var fixme_comments = [];
	
	if (file_exists(api_file)) {
		var read_api = file_text_open_read(api_file);
		
		while (!file_text_eof(read_api)) {
			var api_line = file_text_read_string(read_api);
			file_text_readln(read_api);
			var check_title, check_comments, check_fixme
			check_title = string_pos("//@title", api_line);
			check_comments = string_pos("// ", api_line);
			check_fixme = string_pos("//@fix", api_line);
			
			if (check_title == 0) && (check_comments == 0) && (check_fixme == 0) {
				continue;	
			} else {
				var cline = api_line;
				if (check_title > 0) {
					array_push(title_comments, string_copy(cline, 9, string_length(cline)));
				} else if (check_comments > 0) {
					array_push(_comments, string_copy(cline, 3, string_length(cline)));	
				} else if (check_fixme > 0) {
					array_push(fixme_comments, string_copy(cline, 7, string_length(cline)));	
				}
			}
		}
		
		file_text_close(read_api);
		
		if (!hidden) {
			ConsoleLog("--------------------------------------------", 0);
			ConsoleLog("API Documentation: " + string(api_file), 0);
			ConsoleLog(" ", 0);
			ConsoleLog("Title Frames", 0);
			for (var t = 0; t < array_length(title_comments); t++) {
				ConsoleLog(string(title_comments[t]), 0);	
			}
			ConsoleLog(" ", 0);
			ConsoleLog("Notes", 0);
			for (var n = 0; n < array_length(_comments); n++) {
				ConsoleLog(string(_comments[n]), 0);	
			}
			ConsoleLog(" ", 0);
			ConsoleLog("[c_orange]Fix Notes", 0);
			for (var ff = 0; ff < array_length(fixme_comments); ff++) {
				ConsoleLog(string(fixme_comments[ff]), 0);	
			}
			ConsoleLog("--------------------------------------------", 0);
			ConsoleLog(" ", 0);
		}

	}
	

}


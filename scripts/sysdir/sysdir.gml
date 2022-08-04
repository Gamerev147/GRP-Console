///@description sysdir()
function sysdir(_path="", _hidden="") {

	//Find all files in directory and display them
	var spacing = 26;
	var dspacing = 13;
	var spacingStr = "";
	var dspacingStr = "";
	var return_files = [];
	
	var hidden = false;
	if (_hidden == "1") || (_hidden == "true") {
		hidden = true;	
	}
	
	if (_path != "") && (_path != undefined) {
		var path = global.PATH + string(_path);
	} else {
		var path = global.PATH;
	}
	
	if (!hidden) {
		ConsoleLog(" ", 0, obj_RunnerConsole);
		ConsoleLog("[c_green]   File                      Size          Date ", 0, RUN_ACTIVE);
		ConsoleLog("[c_green]   ----                      ----          ---- ", 0, RUN_ACTIVE);
	}
	
	//log directories
	for (var d = file_find_first_ue(path + "*"); d != ""; d = file_find_next_ue()) {
		var spCount = spacing - string_length(d);
		var ttype = string_get_file_ext(d);
		for (var i = 0; i < spCount; i++) {
			spacingStr += " ";	
		}
		if (file_find_attributes_ue() & fa_directory) {
			if (!hidden && d != "." && d != "..") && (ttype != "grp") { 
				ConsoleLog("   >> " + string(d), 0, RUN_ACTIVE); 
			} else if (ttype == "grp" && !hidden) {
				ConsoleLog("   <> " + string(d), 0, RUN_ACTIVE);
			}
		}
		
		spCount = 0;
		spacingStr = "";
	}
	file_find_close_ue();
	
	//log files
	for (var f = file_find_first_ue(path + "*"); f != ""; f = file_find_next_ue()) {
		var spCount = spacing - string_length(f);
		for (var i = 0; i < spCount; i++) {
			spacingStr += " ";	
		}
		if (file_find_attributes_ue() & fa_directory) {
			//if (!hidden) { ConsoleLog("   >> " + string(f), 0, RUN_ACTIVE); }
		} else {
			var creationDate = string(filetime_access(path + "/" + f));
			var fileSize = string(bytes_smart_convert(file_find_size_ue()));
			var dsp_count = dspacing - string_length(fileSize);
			for (var j = 0; j < dsp_count; j++) {
				dspacingStr += " ";	
			}
			if (!hidden) { ConsoleLog("   " + string(f) + spacingStr + fileSize + dspacingStr + string(creationDate), 0, RUN_ACTIVE); }
			array_push(return_files, string(_path) + string(f));
			dsp_count = 0;
			dspacingStr = "";
		}
		
		spCount = 0;
		spacingStr = "";
	}
	file_find_close_ue();
	
	if (!hidden) { ConsoleLog(" ", 0, RUN_ACTIVE); }
	
	return return_files;

}


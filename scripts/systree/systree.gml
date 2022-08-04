///@description sysdir()
function systree() {

	//Find all files in directory and display them
	var inc = 0;
	var path = global.PATH;
	
	ConsoleLog(" ", 0, obj_RunnerConsole);
	
	var f  = file_find_first(path + "*", fa_directory);
	
	while (f != "") {
		if (file_attributes(f, fa_directory)) {
			ConsoleLog("   " + string(f), 0, RUN_ACTIVE);
		} else {
			ConsoleLog("   > " + string(f), 0, RUN_ACTIVE);
			for (var ef = file_find_first_ue(path + f + "/*"); ef != ""; ef = file_find_next_ue()) {
				if !(file_find_attributes_ue() & fa_directory) {
					ConsoleLog("        " + string(ef), 0, RUN_ACTIVE);	
				} else {
					ConsoleLog("        > " + string(ef), 0, RUN_ACTIVE);	
				}
			}
			file_find_close_ue();
		}
		
		f = file_find_next();
		inc += 1;
	}
	
	file_find_close();
	ConsoleLog(" ", 0, RUN_ACTIVE);

}

///syscan()
//scan the console for missing core files

function syscan(_hidden="--f") {
	
	var hidden;
	var home_list = sysdir("", "1");
	var core_list = sysdir("core/", "1");
	var set_list = sysdir("core/set/", "1");
	var editor_list = sysdir("core/editor/", "1");
	var missing_files = [];
	
	switch (string(_hidden)) {
		case "--h":
			hidden = true;
		break;
		case "--f":
			hidden = false;
		break;
		default:
			//ConsoleLog("Unknown attribute argument.", 0, RUN_ACTIVE);
			hidden = false;
		break;
	}
	
	//array_log_to_console(core_list);
	//array_log_to_console(set_list);
	
	//check all lists for the core script
	for (var cs = 0; cs < ds_list_size(CORE_SCRIPTS); cs++) {
		var core_script = ds_list_find_value(CORE_SCRIPTS, cs);
		if (!array_has_value(core_list, core_script)) && (!array_has_value(set_list, core_script)) && (!array_has_value(home_list, core_script)) && (!array_has_value(editor_list, core_script)) {
			//add the name of the file that isn't found in any of the lists
			array_push(missing_files, string(core_script));
		}
	}
	
	//log missing files
	if (!hidden) {
		ConsoleLog(" ", 0, RUN_ACTIVE);
		ConsoleLog("[c_red]Missing or corrupted files: ", 0, RUN_ACTIVE);
		if (array_length(missing_files) > 0) {
			for (var m = 0; m < array_length(missing_files); m++) {
				ConsoleLog("   " + string(missing_files[m]), 0, RUN_ACTIVE);
			}
		
			//prompt to download missing files
			cr_confirmbox("Would you like to reinstall the missing files?", "ConsoleGetMissing", [missing_files]);
		} else {
			ConsoleLog("[c_green]No files are corrupted or missing.", 0, RUN_ACTIVE);	
		}
		
		ConsoleLog(" ", 0, RUN_ACTIVE);
	} else {
		if (array_length(missing_files) > 0) {
			//prompt to download missing files
			cr_confirmbox("Core has detected missing files. \nWould you like to download them now?", "ConsoleGetMissing", [missing_files]);
		}
	}
	
	

}

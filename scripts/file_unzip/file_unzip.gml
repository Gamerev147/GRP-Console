
function file_unzip(_fname, _dest) {
	
	if (_fname != undefined) {
		ConsoleLog("Beginning file extraction...", 0, obj_RunnerConsole);
		var uzf = zip_unzip(_fname, _dest);	
		if (uzf <= 0) {
			ConsoleLog("[c_red]File extraction failed!", 0, obj_RunnerConsole);	
		} else {
			ConsoleLog("[c_green]File extraction successful! [c_aqua](" + string(uzf) + ")", 0, obj_RunnerConsole);	
		}
	}

}

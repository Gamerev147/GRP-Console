///@description execute(pname)
function execute(argument0) {

	var pname = "";
	pname += string(argument0) + "";

	if (file_exists(pname)) {
	
		var path = string(pname);
		ExecuteShell(path, false, false);
		ConsoleLog("Launching program...", 0);
		ConsoleLog(" ", 0);
	
	} else {
	
		ConsoleLog("Program or file was not found.", 0);
		ConsoleLog(" ", 0);
	
	}



}

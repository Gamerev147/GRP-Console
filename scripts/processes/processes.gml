function processes() {

	//Log Object List
	ConsoleLog("[c_green]Active Processes", 0, RUN_ACTIVE);
	for (var i = 0; i < array_length(global.OBJECT_NAMES); i++) {
		var name = global.OBJECT_NAMES[i];
		var idd = global.OBJECT_ID[i];
		ConsoleLog("(" + string(idd) + ") " + string(name), 0, RUN_ACTIVE);
	}
	
	ConsoleLog(" ", 0, RUN_ACTIVE);
	ConsoleLog("[c_green]Performance Index: " + string(fps_real), 0, RUN_ACTIVE);
	ConsoleLog("CPU Usage: " + string(cpu_usage()) + "%", 0);
	ConsoleLog(" ", 0);

}

/// @description Get URL Content

if (async_load[? "id"] == get) {
	if (async_load[? "status"] == 0) {
		var str = async_load[? "result"];
		ConsoleLog(string(str), 0, obj_RunnerConsole);
		instance_destroy();
	} else {
		ConsoleLog("No content found.", 0, obj_RunnerConsole);	
		instance_destroy();
	}
}

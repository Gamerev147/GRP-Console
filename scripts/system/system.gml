function system(_cat = "", _arg="") {
	var Category = _cat;
	var Argument = string(_arg);
	
	if ((Argument != "") && (Category != "")) || (Argument != undefined) && (Category != undefined) {
		switch (Category) {
			case "updt_int":
				global.__sys_update_int = real(Argument);
				ConsoleLog("System refresh update interval has been set.", 0, RUN_ACTIVE);	
				ConsoleLog(" ", 0, obj_RunnerConsole);	
			break;
			case "update_interval":
				global.__sys_update_int = real(Argument);
				ConsoleLog("System refresh update interval has been set.", 0, RUN_ACTIVE);	
				ConsoleLog(" ", 0, obj_RunnerConsole);	
			break;
			
			case "map":
				if (Argument == "resources") {
					var r = 0;
					while (script_exists(r) == 1) {
						var res_name = script_get_name(r);
						ConsoleLog("r |  " + res_name, 0, RUN_ACTIVE);
						r ++;
					}
				}
			break;
			
			case "none":
				ConsoleLog("No category specified.", 0);
			break;
		}
	} else {
		ConsoleLog("Invalid Category or Argument.", 0, RUN_ACTIVE);	
	}
}


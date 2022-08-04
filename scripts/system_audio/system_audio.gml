function system_audio(_onoff) {
	
	var tog = string(_onoff);
	
	switch (tog) {
		case "on":
		case "true":
		case "enable":
			global.SYSTEM_AUDIO = true;
			ConsoleLog("[c_green]System audio enabled.", 0);
		break;
		
		case "off":
		case "false":
		case "disable":
			global.SYSTEM_AUDIO = false;
			ConsoleLog("[c_red]System audio disabled.", 0);
		break;
	}

}

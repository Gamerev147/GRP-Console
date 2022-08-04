function system_perform(_bool) {
	
	var toggle = string(_bool);
	
	switch (toggle) {
		case "1":
		case "true":
		case "on":
			global.SYSTEM_PERFORM = true;
		break;
		
		case "0":
		case "false":
		case "off":
			global.SYSTEM_PERFORM = false;
		break;
		
		default:
			ConsoleLog("[c_red]Unknown set value.", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		break;
	}

}

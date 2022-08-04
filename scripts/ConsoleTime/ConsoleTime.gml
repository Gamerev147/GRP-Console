function ConsoleTime(_type) {
	
	var type = string(_type);
	
	switch (type) {
		case "12":
			global.time_format = "12";
			ConsoleLog("Clock format set to 12-hour.", 0, RUN_ACTIVE);
		break;
		
		case "24":
			global.time_format = "24";
			ConsoleLog("Clock format set to 24-hour.", 0, RUN_ACTIVE);
		break;
		
		default:
			return global.time_format;
		break;
	}

}

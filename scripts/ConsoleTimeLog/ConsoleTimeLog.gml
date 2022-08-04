function ConsoleTimeLog(_bool) {
	
	var boolean = string(_bool);
	
	switch (boolean) {
		case "on":
		case "1":
			global.SYSTEM_TIMELOG = true;
			ConsoleLog("Core time-log enabled.", 0, RUN_ACTIVE);
		break;
		
		case "off":
		case "0":
			global.SYSTEM_TIMELOG = false;
			ConsoleLog("Core time-log diabled.", 0, RUN_ACTIVE);
		break;
		
		default:
			return global.SYSTEM_TIMELOG;
		break;
	}

}

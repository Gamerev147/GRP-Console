
function array_log_to_console(_array) {
	
	var array = _array;
	
	for (var a = 0; a < array_length(array); a++) {
		ConsoleLog(string(array[a]), 0, RUN_ACTIVE);	
	}

}


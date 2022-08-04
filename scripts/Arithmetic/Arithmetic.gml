function Arithmetic(_lineString, _hidden = false) {

	//Arithmetic> 5 + (7/3)

	var rawLine = string(_lineString);
	var solution_compiled = txr_compile(rawLine);
	var solution = txr_exec(solution_compiled);
	
	if (!_hidden) {
		ConsoleLog(rawLine, 0);
		ConsoleLog("=  " + string(solution), 0);
		ConsoleLog(" ", 0);
	}
	
	return real(solution);

}


function throw_error(_error, _line) {
	
	var error = string(_error);
	var line = string(_line);
	ds_list_add(RUNTIME_ERRORS, error + " | Line: " + line);

}
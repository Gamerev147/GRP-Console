function rounded_windows(_bool) {

	var Bool = "";
	Bool += string(_bool) + "";
	
	if (Bool == "true") || (Bool == "1") {
		global.__rounded_windows = true;	
	} else if (Bool == "false") || (Bool == "0") {
		global.__rounded_windows = false;	
	} else {
		show_debug_message("Invalid Boolean Reference.");
		ds_list_add(RUNTIME_ERRORS, "Invalid boolean reference (" + string(Bool) + ")");
	}

}
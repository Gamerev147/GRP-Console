function debug_message(_message) {
	
	var str = string(_message);
	
	if (str != "") {
		ds_list_add(DEBUG_LOG, str);	
	}

}

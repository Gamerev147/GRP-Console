
function string_is_url(str) {
	
	var dPos = string_pos(".", str);
	
	if (dPos != 0) {
		return true;	
	} else {
		return false;	
	}

}
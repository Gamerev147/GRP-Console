function array_has_value(_arr, _val) {

	var search_value = _val;
	for (var i = 0; i < array_length(_arr); i++) {
		if (_arr[i] == search_value) {
			return true;	
		}
	}
	
	return false;

}

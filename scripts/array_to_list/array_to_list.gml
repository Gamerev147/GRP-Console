function array_to_list(_array) {

	var _arr = _array;
	var _len = array_length(_arr);
	var _ret = ds_list_create();
	
	for (var a = 0; a < _len; a++) {
		ds_list_add(_ret, _arr[a])	
	}
	
	return _ret;

}

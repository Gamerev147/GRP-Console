function check_for_variable(_string) {
	
	var checkLine = string(_string);
	
	//split the string to an array
	var checkArray = string_split_qt_test(checkLine, "^");
	var finalArray = string_split_qt_test(checkLine, "^");
	
	show_debug_message("*****     " + string(checkArray));
	
	//check each value of the array and see if in VARMAP
	for (var c = 0; c < array_length_1d(checkArray); c++) {
		var checkValue = checkArray[c];
		
		//check the varmap
		if (ds_map_exists(VARMAP, checkValue)) {
			array_set(finalArray, c, ds_map_find_value(VARMAP, checkValue));	
		}
	}
	
	//push the array to a string and return that string
	var fs = array_to_string(finalArray);
	show_debug_message("*****     " + string(finalArray));
	return fs;

}


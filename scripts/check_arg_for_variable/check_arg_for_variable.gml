function check_arg_for_variable(_string) {
	
	var checkLine = string(_string);
	var finalLine = checkLine;
	
	//split the string to an array
	var checkArray = string_split_qt_space(checkLine, "^");
	
	if (is_array(checkArray)) {
		//if the checkArray is an array, it means there are user-variables in it
		//otherwise, there is no user-variable
		show_debug_message("Split Argument Array: " + string(checkArray));
		
		//loop through the array and see if there is a variable
		for (var ua = 0; ua < array_length(checkArray); ua++) {
			var checkingValue = checkArray[ua];
			
			if (ds_map_exists(VARMAP, checkingValue)) {
				var checkReturn = ds_map_find_value(VARMAP, checkingValue);	
				var replaceWord = "^" + checkingValue + "^";
				finalLine = string_replace_all(finalLine, replaceWord, string(checkReturn));
			}
		}
		
		if (finalLine != "undefined" && finalLine != "") {
			show_debug_message("Final Check Line: " + finalLine);
			return finalLine;
		} else return checkLine;
		
	} else {
		return checkLine;	
	}

}


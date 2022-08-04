function cat(_str1, _str2) {
	
	var string1 = string(_str1);
	var string2 = string(_str2);
	
	if (ds_map_exists(VARMAP, string1)) {
		string1 = ds_map_find_value(VARMAP, string1);	
	}
	
	if (ds_map_exists(VARMAP, string2)) {
		string2 = ds_map_find_value(VARMAP, string2);	
	}
	
	var return_string = string1 + string2;
	
	return return_string;

}


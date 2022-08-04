function array_to_string(_arr) {
	
	var stringArray = _arr;
	var finalString = "";
	
	for (var a = 0; a < array_length(stringArray); a++) {
		var arrValue = stringArray[a];
		if (arrValue != "") {
			finalString += string(arrValue);	
		}
	}
	
	return finalString;

}
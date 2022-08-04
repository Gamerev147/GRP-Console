function ConsoleReadable(_arrayString) {

	var arrayString = string(_arrayString);
	var returnString = string_replace(arrayString, "[", "(");
	returnString = string_replace(returnString, "]", ")");
	
	return returnString;

}


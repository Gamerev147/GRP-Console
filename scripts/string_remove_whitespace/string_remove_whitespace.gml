function string_remove_whitespace(_string) {
	
	var originalString = string(_string);
	var newString = "";
	
	if (originalString != "") {
		for (var s = 0; s < string_length(originalString); s++) {
			var nextCharacter = string_char_at(originalString, s+1);
			if (nextCharacter != " ") {
				newString += nextCharacter;	
			}
		}
	}
	
	return newString;

}


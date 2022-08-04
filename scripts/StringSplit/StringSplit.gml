/// string_split(str, substr)
function StringSplit(_string) {
	
	var input = string(_string);
	var word = "";
	var arr = [];
	
	for (var i = 0; i < string_length(input); i++) {
		var nchar = string_char_at(input, i + 1);
		
		if (nchar != " ") {
			word += nchar;
		} else {
			if (word != " ") {
				array_push(arr, word);	
			}
			word = "";
			continue;
		}
	}
	
	return arr;

}

/// string_split(str, substr)
function StringSplitChar(_string, _char) {
	
	var input = string(_string);
	var word = "";
	var char = string(_char);
	var arr = [];
	
	for (var i = 0; i < string_length(input); i++) {
		var nchar = string_char_at(input, i + 1);
		
		if (nchar != char) {
			word += nchar;
		} else {
			if (word != char) {
				array_push(arr, word);	
			}
			word = "";
			continue;
		}
	}
	
	return arr;

}

/// string_split(str, substr)
function StringSplitCharM(_string, _chars, _checkarr) {
	
	var input = string(_string);
	var word = "";
	var char = _chars;
	var check_array = _checkarr;
	var arr = [];
	
	for (var i = 0; i < string_length(input); i++) {
		var nchar = string_char_at(input, i + 1);
		
		if (!array_has_value(check_array, string(nchar))) {
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

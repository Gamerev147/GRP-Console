function string_split_to_width(str, num, break_char) {
	
	var Str = str;
	
	if (num < 1) { num = 76; }
	var len = string_length(Str);
	
	for (var i=len-((len-1) mod num); i > num; i -= num) {
		Str =string_insert(break_char, Str, i);
	}
	
	return Str;

}

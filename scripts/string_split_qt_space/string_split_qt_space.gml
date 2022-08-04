function string_split_qt_space(_my_str, _quote_char){
	
	var arr = undefined;
	var at = 0;
	var my_str = string(_my_str);
	var sub_str = "";
	var Quote = false;
	var quote_char = string(_quote_char);
	
	for(var i = 0; i < string_length(my_str); i++) {
	   var next_char = string_char_at(my_str,i+1);
 
	   if(next_char == quote_char)  {
	        Quote = !Quote;
	   } else if (Quote) {
	       sub_str += next_char;
	   } else {
	       //ADD TO ARRAY
	       if(sub_str!="") arr[at++] = sub_str;
	       sub_str = "";
	   }
	}
	
	if (sub_str != "") arr[at++] = sub_str;
	
	if (!is_undefined(arr)) {
		return arr;
	}
	
	return -1;

}


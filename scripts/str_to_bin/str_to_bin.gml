function str_to_bin(_string){
	
	var str = _string;
	var output = "";
	
	for(var i = 0; i < string_length(str); i++) {
		
	    if(string_char_at(str, i + 1) == "0") {
	        output += "0";
	    } else{
	        output += "1";
	    }
		
	}
	
	return real(output);
	
}

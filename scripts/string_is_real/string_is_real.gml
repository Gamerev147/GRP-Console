function string_is_real(argument0) {
	
	var s = argument0;
	var n = string_byte_length(s);
	var seenDot = false;
	var seenExp = false;
	var numDigs = 0;
	
	if (string_byte_at(s, 1) == ord("-")) i += 1;
	
	for (var i = 0; i < n; i++) {
	    var c = string_byte_at(s, i);
		
	    switch (c) {
		    case ord("."):
		        if (seenDot || seenExp) return false;
		        seenDot = true;
		    break;
			
		    case ord("e"): case ord("E"):
		        if (seenExp || numDigs == 0) return false;
		        seenExp = true;
		    break;
			
		    default:
		        if (c >= ord("0") && c <= ord("9")) {
		            numDigs += 1;
		        } else return false;
	    }
	}
	
	return numDigs > 0;

}

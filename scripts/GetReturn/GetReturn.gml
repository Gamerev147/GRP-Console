function GetReturn(argument0, argument1) {
	//GetAttribute Helper

	if (argument0 = -1) {
	    return "Object Not Found";
	}

	with (argument0) {
	
		switch (argument1) {
           
				case "id":
					return id;
				break;
		   
	            case "x":
	                return  x;
	            break;
			
	            case "y":
	                 return y;
	            break;
				
				case "title":
					return title;
				break;
				
				case "elements":
					var s = "(";
					for (var g = 0; g < ds_list_size(elements); g++) {
						var v = ds_list_find_value(elements, g);
						s += string(v) + ",";
					}
					s += ")";
					return s;
				break;
				
				case "width":
					return window_width;
				break;
				
				case "height":
					return window_height;
				break;

	            //no match
	            default:
	                return "[c_red]Attribute Not Found";
	            break;
			
		}
	
	}



}

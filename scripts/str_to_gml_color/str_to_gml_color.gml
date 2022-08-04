function str_to_gml_color(_string) {
	
	var col = string(_string);
	var rcol = c_white;
	
	switch (col) {
		case "white":
			rcol = c_white;
		break;
		case "black":
			rcol = c_black;
		break;
		case "red":
			rcol = c_red;
		break;
		case "blue":
			rcol = c_blue;
		break;
		case "yellow":
			rcol = c_yellow;
		break;
		case "green":
			rcol = c_green;
		break;
		case "purple":
			rcol = c_purple;
		break;
		case "orange":
			rcol = c_orange;
		break;
		case "gray":
			rcol = c_dkgray;
		break;
		case "aqua":
			rcol = c_aqua;
		break;
		default:
			rcol = c_white;
		break;
	}
	
	return rcol;

}
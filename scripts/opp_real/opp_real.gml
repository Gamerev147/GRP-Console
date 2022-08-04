function opp_real(_scr, _arr) {
	
	var userVariableString = string(_scr);
	var argumentArray = _arr;
	
	show_debug_message("Looking for " + userVariableString + "...");
	
	if (ds_map_exists(VARMAP, userVariableString)) {
		var tmpval = ds_map_find_value(VARMAP, userVariableString);
		switch (argumentArray[0]) {
			case "++":
				var tmp = real(tmpval)+1;
				ds_map_replace(VARMAP, userVariableString, tmp);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp));
			break;
			case "+=":
				var tmp1 = real(tmpval)+real(argumentArray[1]);
				ds_map_replace(VARMAP, userVariableString, tmp1);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp1));
			break;
			case "--":
				var tmp2 = real(tmpval)-1;
				ds_map_replace(VARMAP, userVariableString, tmp2);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp2));
			break;
			case "-=":
				var tmp3 = real(tmpval)-real(argumentArray[1]);
				ds_map_replace(VARMAP, userVariableString, tmp3);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp3));
			break;
			case "/=":
				var tmp4 = real(tmpval) / real(argumentArray[1]);
				ds_map_replace(VARMAP, userVariableString, tmp4);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp4));
			break;
			case "*=":
				var tmp5 = real(tmpval) * real(argumentArray[1]);
				ds_map_replace(VARMAP, userVariableString, tmp5);
				show_debug_message("\n   *** " + string(tmpval) + " ---> " + string(tmp5));
			break;
			default:
				throw_error("Unknown operand (" + string(argumentArray[0]) + ")", "");
			break;
		}
		return;
	} else {
		throw_error("Variable (" + userVariableString + ") does not exist in namespace.", "");
		exit;
	}

}

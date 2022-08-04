//clears a variable from the VARMAP
function ClearVar(Var) {
	
	var DS_Var = string(Var);
	
	if (ds_map_exists(VARMAP, DS_Var)) {
		ds_map_delete(VARMAP, DS_Var);	
		
		if (file_exists("temp/" + DS_Var + ".tgrp")) {
			file_delete("temp/" + DS_Var + ".tgrp");	
		}
		
		show_debug_message(string(DS_Var) + " WIPED.");
		return true;
	} else {
		show_debug_message("variable isn't stored.");
		ds_list_add(RUNTIME_ERRORS, "Variable (" + string(DS_Var) + ") is not defined.");
	}
	
	return false;

}

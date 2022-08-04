
function VarExists(_vname) {
	
	if (ds_map_exists(VARMAP, string(_vname))) {
		return true;	
	} else {
		return false;	
	}

}

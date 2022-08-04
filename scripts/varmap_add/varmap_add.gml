function varmap_add(_key, _val) {
	
	var add_key = _key;
	var add_value = _val;
	
	if (ds_map_exists(VARMAP, add_key)) {
		ds_map_replace(VARMAP, add_key, add_value);	
	} else {
		ds_map_add(VARMAP, add_key, add_value);	
	}

}


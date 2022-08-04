
function wiki_content_get(argument0, argument1, argument2) {
	
	if (!is_undefined(argument0)) {
		if (!is_undefined(argument1)) {
			if (!is_undefined(argument2)) {
				return ds_map_find_value(argument0[? argument1], argument2);
			}
		}
	}

}

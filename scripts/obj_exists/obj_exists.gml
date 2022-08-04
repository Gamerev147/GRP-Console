function obj_exists(_entity) {

	var target_object = string(_entity);
	
	if (instance_exists(asset_get_index(target_object))) {
		return true;	
	} else if (!is_undefined(ds_map_find_value(VARMAP, target_object))) {
		return true;	
	}
	
	return false;

}

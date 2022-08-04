/// @description 

if (_type == "input") && (_input_selected) {
	//_input = keyboard_string;	
	if (keyboard_check_released(vk_enter)) {
		if (!ds_map_exists(VARMAP, string(_input_var))) {
			ds_map_add(VARMAP, string(_input_var), _input);
			show_debug_message("input added to VARMAP");
			_input_selected = false;
		} else {
			ds_map_replace(VARMAP, string(_input_var), _input);	
			show_debug_message("replaced input in VARMAP");
		}
	}
}

x = _x;
y = _y;









function set_att(_obj, _att, _val) {
	//set_att(object, attribute, value)
	/*
	    Set an object Attribute
	        -> SetAttribute object(name or id) x 420   output: move object to x-420

	*/

	var Obj,Attribute,Value;
	if (_obj != "--") {
		Obj = asset_get_index(_obj);	
	} else {
		Obj = string(_obj);	
	}

	Attribute = string(_att);
	Value = _val; 


	if (is_real(Obj)) {
	    if (variable_instance_exists(Obj, Attribute)) {
			if (is_real(string(Value))) {
				var tval = real(Value);	
			} else {
				var tval = string(Value);	
			}
			variable_instance_set(Obj, Attribute, tval);
			show_debug_message("-- Global variable (" + Attribute + ") set to (" + tval + ")");
		} else {
			ConsoleLog("[c_red]Object attribute not found.", 0, RUN_ACTIVE);	
		}
	} else if (Obj == "--") {
		if (variable_global_exists(Attribute)) {
			variable_global_set(Attribute, Value);	
		} else {
			ConsoleLog("[c_red]Attribute not found.", 0, RUN_ACTIVE);	
		}
	} else {
	    with(obj_Console) {
	        ConsoleLog("[c_red]Object Not Found", 0, RUN_ACTIVE);
	    }
	}

	ConsoleLog(" ", 0, RUN_ACTIVE);



}


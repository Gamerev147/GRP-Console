function Win_AddDropOption(Did, Option, Pointer, Arg0="", Arg1="", Arg2="") {
	
	var dropid = Did;
	var option = string(Option);
	var pointer = string(Pointer);
	
	var _Arguments = [];
	array_push(_Arguments, pointer);
	array_push(_Arguments, Arg0, Arg1, Arg2);
	show_debug_message("\n" + string(_Arguments) + "\n");
	
	if (dropid != 0) && (dropid != undefined) {
		with (dropid) {
			ds_map_add(_drop_options, option, _Arguments);
			//show_debug_message("'" + option + "' was added to drop options.");
		}
	}

}

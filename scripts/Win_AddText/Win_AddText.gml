
function Win_AddText(wId, X, Y, Str) {

	var wid;
	
	if (is_string(wId)) {
		wid = ds_map_find_value(WINDOWS, string(wId))	
	} else {
		wid = real(wId);	
	}
	
	var xx = real(X);
	var yy = real(Y);
	var text = string(Str);
	
	if (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "text";
		te._parent = wid;
		te._text = text;
		te._x = xx;
		te._y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			//show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}

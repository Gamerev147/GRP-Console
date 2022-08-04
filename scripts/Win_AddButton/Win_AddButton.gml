
function Win_AddButton(wId, X, Y, W, H, Str, Pointer, Arg0="", Arg1="", Arg2="", Arg3="") {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ww = real(W);
	var hh = real(H);
	var text = string(Str);
	var action = string(Pointer);
	var args = [];
	array_push(args, Arg0, Arg1, Arg2, Arg3);
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "button";
		te._parent = wid;
		te._button = text;
		te._button_action = action;
		te._button_arguments = args;
		te._button_width = ww;
		te._button_height = hh;
		te._x = xx;
		te._y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			//show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}


function Win_AddInput(wId, X, Y, W, H, Var) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ww = real(W);
	var hh = real(H);
	var _var = string(Var);
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "input";
		te._parent = wid;
		te._input_var = _var;
		te._input_width = ww;
		te._input_height = hh;
		te._x = xx;
		te._y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}

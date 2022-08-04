
function Win_AddDropMenu(wId, X, Y, W, H, Title, Var) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ww = real(W);
	var hh = real(H);
	var title = string(Title);
	var idd = string(Var);
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "dropdown";
		te._parent = wid;
		te._drop_title = title;
		te._drop_width = ww;
		te._drop_height = hh;
		te._x = xx;
		te._y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			show_debug_message(string(te) + " pushed to " + string(wid));
		}
		
		ds_map_add(VARMAP, idd, te);
		//show_debug_message("Dropdown " + string(te) + " added to VARMAP.");
	}

}

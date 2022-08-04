
function CreateWindow(Title, wVar, W=600, H=400) {

	var wtitle = string(Title);
	var wid = string(wVar);
	var ww = real(W);
	var hh = real(H);
	
	if (!ds_map_exists(VARMAP, wid)) {
	
		//Create Window
		var nw = instance_create_layer(random(120), random(100), "ui_layer", obj_Window);
		nw.title = wtitle;
		nw.min_window_width = ww;
		nw.min_window_height = hh;
	
		ds_map_add(VARMAP, wid, nw);
		show_debug_message(string(nw) + " WINDOW was added and stored.");
		return nw;
	
	} else {
		show_debug_message(wid + " already stored in VARMAP.");
		ds_list_add(RUNTIME_ERRORS, (wid + " already stored in namespace."));
	}

}


function Win_AddIcon(wId, X, Y, Name, Img, Scr, Arg0="", Arg1="", Arg2="", FlagPoint="") {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var nam = string(Name);
	var img = string(Img);
	var flagpoint = string(FlagPoint);
	
	var scr = string(Scr);
	var scr_args = [];
	scr_args[0] = Arg0;
	scr_args[1] = Arg1;
	scr_args[2] = Arg2;
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "icon";
		te._parent = wid;
		te._icon_name = nam;
		te._icon_image_path = img;
		te._icon_pointer = scr;
		te._icon_arguments = scr_args;
		te._icon_directory = flagpoint;
		te._x = xx;
		te._y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}

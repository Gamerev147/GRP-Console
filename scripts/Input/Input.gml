
function Input(Title, Var, Pointer, Arg0="", Arg1="", Arg2="", Arg3="") {

	var args = [];
	array_push(args, Arg0, Arg1, Arg2, Arg3);

	var ib = instance_create_layer(room_width/2, room_height/2, layer, obj_PopupInput);
	ib.title = Title;
	ib.animate = true;
	ib.save_var = string(Var);
	
	if (Pointer != "") && (Pointer != 0) {
		if (Pointer != undefined) {
			ib.pointer = string(Pointer);	
			ib.pointer_args = args;
		}
	}

}

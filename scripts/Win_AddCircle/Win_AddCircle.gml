
function Win_AddCircle(wId, X, Y, Rad, Col, Out) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var rad = real(Rad);
	var Color = str_to_gml_color(string(Col));
	var outline = real(Out);
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "circle";
		te._parent = wid;
		te._cir_color = Color;
		te._cir_rad = rad;
		te._cir_fill = outline;
		te._cir_x = xx;
		te._cir_y = yy;
		
		with (wid) {
			ds_list_add(elements, te);
			show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}

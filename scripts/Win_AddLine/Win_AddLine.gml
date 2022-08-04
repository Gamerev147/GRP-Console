
function Win_AddLine(wId, X, Y, EX, EY, Col) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ex = real(EX);
	var ey = real(EY);
	var Color = str_to_gml_color(string(Col));
	
	var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
	te._type = "line";
	te._parent = wid;
	te._line_color = Color;
	te._line_sx = xx;
	te._line_sy = yy;
	te._line_ex = ex;
	te._line_ey = ey;
		
	with (wid) {
		ds_list_add(elements, te);
		show_debug_message(string(te) + " pushed to " + string(wid));
	}

}

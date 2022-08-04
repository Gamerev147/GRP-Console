
function Win_AddRectangle(wId, X, Y, EX, EY, Col, Out) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ex = real(EX);
	var ey = real(EY);
	var Color = str_to_gml_color(string(Col));
	var outline = real(Out);
	
	if (wid != 0) && (wid != undefined) {
		var te = instance_create_layer(xx, yy, layer, obj_WindowElement);
		te._type = "rectangle";
		te._parent = wid;
		te._rec_color = Color;
		te._rec_fill = outline;
		te._rec_sx = xx;
		te._rec_sy = yy;
		te._rec_ex = ex;
		te._rec_ey = ey;
		
		with (wid) {
			ds_list_add(elements, te);
			show_debug_message(string(te) + " pushed to " + string(wid));
		}
	}

}

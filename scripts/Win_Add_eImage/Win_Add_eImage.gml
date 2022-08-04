
function Win_Add_eImage(wId, X, Y, Img) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var image = string(Img);
	
	if (wid != 0) && (wid != undefined) {
		var ie = instance_create_layer(xx, yy, layer, obj_WindowElement);
		ie._type = "embedded_image";
		ie._parent = wid;
		ie._image_path = image;
		ie._x = xx;
		ie._y = yy;
		
		with (wid) {
			ds_list_add(elements, ie);	
			show_debug_message(string(ie) + " pushed to " + string(wid));
		}
	}

}

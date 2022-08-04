
function Win_AddImage(wId, X, Y, W, H, Img) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ww = real(W);
	var hh = real(H);
	var image = string(Img);
	
	var ie = instance_create_layer(xx, yy, layer, obj_WindowElement);
	ie._type = "image";
	ie._parent = wid;
	ie._image_path = image;
	ie._image_width = ww;
	ie._image_height = hh;
	ie._x = xx;
	ie._y = yy;
		
	with (wid) {
		ds_list_add(elements, ie);	
		show_debug_message(string(ie) + " pushed to " + string(wid));
	}

}

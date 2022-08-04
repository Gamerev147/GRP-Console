
function Win_AddVideo(wId, X, Y, W, H, Vid) {

	var wid = wId;
	var xx = real(X);
	var yy = real(Y);
	var ww = real(W);
	var hh = real(H);
	var vid = string(Vid);
	
	var ie = instance_create_layer(xx, yy, layer, obj_WindowElement);
	ie._type = "video";
	ie._parent = wid;
	ie._video_path = vid;
	ie._video_width = ww;
	ie._video_height = hh;
	ie._x = xx;
	ie._y = yy;
		
	with (wid) {
		ds_list_add(elements, ie);	
		show_debug_message(string(ie._type) + " pushed to " + string(wid));
	}

}


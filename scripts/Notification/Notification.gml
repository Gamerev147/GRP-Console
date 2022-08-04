function Notification(_title, _text) {

	var Title = string(_title);
	var Tex = string(_text);
	
	var n = instance_create_layer(display_get_gui_width()-208, notsy, layer, obj_Notification);
	n.title = Title;
	n.text = Tex;
	
	ds_list_add(nots, n);

}

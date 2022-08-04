
function Alert(Title, Message, Pointer="") {
	var ib = instance_create_layer(room_width/2, room_height/2, layer, obj_PopupWindow);
	ib.title = Title;
	ib.text = Message;
	ib.animate = true;
	
	if (Pointer != "") && (Pointer != undefined) {
		ib.pointer = Pointer;	
	}
}

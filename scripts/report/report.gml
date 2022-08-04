function report() {
	
	global.bug_report = true;
	instance_create_layer(room_width/2-300, room_height/2-200, "ui_layer", obj_ReportBug);

}
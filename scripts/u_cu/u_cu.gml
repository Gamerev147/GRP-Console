///@description u_cu()
function u_cu() {

	//Check to see the current user
	if (global.USER != "") {
	
		ConsoleLog("Current user: " + string(global.USER), 0);
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "The currently logged in user is [" + string(global.USER) + "]";
		ib.animate = true;	
	
	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "No user is currently logged in.";
		ib.animate = true;		
	
	}

	ConsoleLog(" ", 0);



}

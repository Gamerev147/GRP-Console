///@description u_lo(name)
function u_lo() {

	//Log out of user account
	if (global.USER != "") {
	
		global.USER = "";
		global.CURRENT_PATH = "";
		room_goto(rm_Login);
	
	} else {
	
		ConsoleLog("No user logged in.", 0);
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "There is currently no active user account. Please log in to continue.";
		ib.animate = true;	
	
	}

	ConsoleLog(" ", 0);



}

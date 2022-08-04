///@description u_dl(name, pass)
function u_dl(_user, _pass) {

	var name = "";
	name += string(_user) + "";

	var fname = "users/" + string(name) + ".USER";

	var pass = "";
	pass += string(_pass) + "";

	//Delete the User
	if (file_exists(fname) && (global.USER != string(name))) {
	
		decrypt(fname);
	
		ini_open(fname);
		var i_pass = ini_read_string(name, "Password", "");
		ini_close();
	
		if (string(i_pass) = string(pass)) {
		
			file_delete(fname);
			file_delete(name + "_directory.ini");
			ConsoleLog("User deleted.", 0);
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- User Alert --";
			ib.text = "User [" + string(name) + "] and associated files have been deleted.";
			ib.animate = true;	
		
		} else {
		
			fast_file_encrypt(fname, fname, true);
			ConsoleLog("Access Denied.", 0);
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- User Alert --";
			ib.text = "Cannot delete user. Password is incorrect!";
			ib.animate = true;	
		
		}
	
	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "User account does not exists or is currently logged in.";
		ib.animate = true;		
	
	}

	ConsoleLog(" ", 0);



}

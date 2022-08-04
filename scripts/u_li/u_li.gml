 ///@description u_li(user, pass)
function u_li(_user, _pass) {

	var name = "";
	name += string(_user) + "";

	var fname = "users/" + string(name) + ".user";

	var pass = "";
	pass += string(_pass) + "";

	fast_file_encrypt(string(fname), string(fname), false);

	//Login to the User Account
	if (file_exists(fname)) {
	
		ini_open(fname);
		var i_pass = ini_read_string("data", "Password", "");
		ini_close();
	
		//fast_file_key_crypt(string(fname), string(fname), true, "efsITMnW");
	
		if (string(i_pass) = string(pass)) {
		
			global.USER = name;
			ConsoleLog("Login Successful!", 0);
			ConsoleLog("Current user set to: " + string(name), 0);
			fast_file_encrypt(string(fname), string(fname), true);
		
		} else {
		
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- User Alert --";
			ib.text = "Access Denied. Password is incorrect.";
			ib.animate = true;		
		
		}
	
	} else {
	
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- User Alert --";
		ib.text = "User account does not exist!";
		ib.animate = true;		
	
	}

	ConsoleLog(" ", 0);



}

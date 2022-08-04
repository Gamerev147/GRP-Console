///@description u_cr(name, pass)
function u_cr(_name, _pass) {

	var name = "";
	name += string(_name) + "";

	var fname = string(name) + ".user";

	var pass = "";
	pass += string(_pass) + "";

	//Create User Account
	if (_name != "") && (_pass != "") {
			if (!file_exists("users/" + string(fname))) {
	
				var date = string(current_month) + "/" + string(current_day) + "/" + string(current_year);
			if (_pass != "...") {
	
				ini_open("users/" + fname);
				ini_write_string("data", "Creation", string(date));
				ini_write_string("data", "Password", string(pass));
				ini_close();
		
				ConsoleLog("User " + string(name) + " was successfully created successfully!", 0);
				fast_file_encrypt(string("users/" + fname), string("users/" + fname), true);
			
			} else {
				pass = random_password(10);
				ini_open("users/" + fname);
				ini_write_string("data", "Creation", string(date));
				ini_write_string("data", "Password", string(pass));
				ini_close();
		
				ConsoleLog("User " + string(name) + " was successfully created with the following password:", 0);
				ConsoleLog("Password: " + pass, 0);
				fast_file_encrypt(string("users/" + fname), string("users/" + fname), true);
			}
	
		} else {
	
			var ib = instance_create(x, y, obj_PopupWindow);
			ib.title = "-- User Alert --";
			ib.text = "User has already been created.";
			ib.animate = true;		
	
		}
	} else {
		ConsoleLog("Please input a username and password.", 0);	
	}

	ConsoleLog(" ", 0);



}

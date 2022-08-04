///@description u_pa_cg(name, current_pass, new_pass)
function u_pa_cg(_user, _cpass, _npass) {
	
	var name = "";
	name += string(_user) + "";

	var fname = "users/" + string(name) + ".user";

	var pass = "";
	pass += string(_cpass) + "";

	var newPass = "";
	newPass += string(_npass) + "";

	//fast_file_key_crypt(string(fname), string(fname), false, "efsITMnW");

	if (file_exists(string(fname))) {
	
		decrypt(fname);
		ini_open(fname);
	
		var currentPass = ini_read_string("data", "Password", "");
	
		if (pass = currentPass) {
			ini_write_string("data", "Password", string(newPass));
			ConsoleLog("New password has been set!", 0);
		} else {
			ConsoleLog("[c_red]Current password is incorrect. Can not change password.", 0);	
		}
	
		ini_close();
	
		encrypt(fname);
	
	} else {
		ConsoleLog("[c_red]User does not exist. Can not change password.", 0);
	}

	ConsoleLog(" ", 0);



}

function u_rn(_cuser, _nuser, _pass) {
	
	var current_user = string(_cuser);
	var new_user = string(_nuser);
	var pass = string(_pass);
	
	var fname = "users/" + string(current_user) + ".USER";
	var nfname = "users/" + string(new_user) + ".USER";
	
	if (file_exists(fname) && (_nuser != undefined)) {
		decrypt(fname);
		ini_open(fname);
		var u_pass = ini_read_string("data", "Password", "");
		ini_close();
		encrypt(fname);
		
		if (u_pass == pass) {
			file_rn(fname, nfname, pass);
			global.USER = new_user;
			
			ConsoleLog("[c_green]User account -" + current_user + "- has been renamed to -" + string(new_user) + "-", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		} else {
			ConsoleLog("[c_red]Password to the user account is incorrect.", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		}
	} else {
		ConsoleLog("User account does not exist or the new name is invalid.", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}

}

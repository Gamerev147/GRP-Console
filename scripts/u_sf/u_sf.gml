function u_sf(_pass, _phrase, _auth) {

	var password = string(_pass);
	var phrase = string(_phrase);
	var auth = string(_auth);
	
	if (global.USER != "Guest") {
		var uf = "users/" + string(global.USER) + ".USER";
		if (file_exists(uf)) {
			decrypt(uf);
			ini_open(uf);
			var fpass = ini_read_string("data", "Password", "");
			
			if (password == fpass) {
				ini_write_string("data", "Phrase", phrase);
				ini_write_string("data", "Auth", auth);
				ConsoleLog("[c_green]Two-factor authentication phrase has been set.", 0, RUN_ACTIVE);
				ConsoleLog(" ", 0, RUN_ACTIVE);
			} else {
				ConsoleLog("[c_red]Password is incorrect.", 0, RUN_ACTIVE);
				ConsoleLog(" ", 0, RUN_ACTIVE);	
			}
			
			ini_close();
			encrypt(uf);
		}
	} else {
		ConsoleLog("Please log in to apply this feature.", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);	
	}

}

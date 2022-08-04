
function remove(_fname, _pass) {

	var fname = "";
	fname += string(_fname) + "";
	
	var pass = "";
	pass += string(_pass) + "";
	
	if (fname != "") {
		if (pass != "") {
			cr_confirmbox("Are you sure you wish to delete?", "file_dl", [fname, pass])	
		} else {
			cr_confirmbox("Are you sure you wish to delete?", "file_dl", [fname]);
		}
	}

}

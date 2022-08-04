///@description dir_rn(dname, d_newname)
function dir_rn(_dname, _dnewname) {

	var dname = global.PATH + string(_dname);

	var d_newname = "";
	d_newname += string(_dnewname) + "";

	var old_path = string(dname);
	var new_path = string(global.PATH + d_newname)

	if (directory_exists(dname)) {
	
		directory_rename_ue(old_path, new_path);
		ConsoleLog("Directory -" + string(dname) + "- [c_green]has been renamed to -[c_white]" + string(d_newname) + "-.", 0);
		ConsoleLog(" ", 0);
	
	} else {
	
		ConsoleLog("Directory -" + string(dname) + "- [c_red]does not exist.", 0);
		ConsoleLog(" ", 0);
	
	}



}

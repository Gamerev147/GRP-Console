///@description dir_dl(dname)
function dir_dl(_dname) {

	var dname = global.PATH + string(_dname);

	if (directory_exists(string(dname))) {
	
		directory_destroy(string(dname));
		ConsoleLog("Directory -" + string(dname) + "- [c_green]has been deleted successfully!", 0);
		ConsoleLog(" ", 0);
	
	} else {
	
		ConsoleLog("Directory -" + string(dname) + "- [c_red]does not exist.", 0);
		ConsoleLog("[c_red]Please check the directory name and try again.", 0);
		ConsoleLog(" ", 0);
	
	}



}

function del(fname) {
	
	if (file_exists(global.PATH + fname)) {
		file_delete(global.PATH + fname);
		ConsoleLog(string(fname) + " [c_green]was successfully deleted!", 0, RUN_ACTIVE);
	} else if (file_exists(fname)) {
		file_delete(fname);
		ConsoleLog(string(fname) + " [c_green]was successfully deleted!", 0, RUN_ACTIVE);
	} else if (directory_exists(global.PATH + fname)) {
		directory_destroy(global.PATH + fname);
		ConsoleLog(string(fname) + " [c_green]was successfully deleted!", 0, RUN_ACTIVE);
	} else if (directory_exists(fname)) {
		directory_destroy(fname);
		ConsoleLog(string(fname) + " [c_green]was successfully deleted!", 0, RUN_ACTIVE);
	} else {
		ConsoleLog(string(fname) + " could not be removed. [c_red]File or directory not found.", 0, RUN_ACTIVE);
	}
	
	ConsoleLog(" ", 0, RUN_ACTIVE);

}


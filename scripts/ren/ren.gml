function ren(_fname, _nfname) {

	var currentFile = string(_fname);
	var newFile = string(_nfname);
	
	if (file_exists(currentFile)) {
		file_rename(currentFile, newFile);
		return true;
	} else {
		ConsoleLog("(" + currentFile + ") does not exist.", 0);
		ConsoleLog(" ", 0);
		return false;
	}

}

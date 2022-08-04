///@description file_ch(fname)
function file_ch(_fname) {


	var fname = global.PATH + string(_fname);

	if (file_exists(string(fname))) {
		
		var file = file_bin_open(fname, 0);
		var size = file_bin_size(file);
		file_bin_close(file);
	
		//ConsoleLog("File [" + string(fname) + "] exists and was created by [" + string(name) + "]", 0);
		var ib = instance_create(x, y, obj_PopupWindow);
		ib.title = "-- File Alert --";
		ib.text = "File (" + string(fname) + ") -" + string(size) + "B-  exists.";
		ib.animate = true;
		
		return true;
	
	} else {
	
		ConsoleLog("File not in directory.", 0, obj_RunnerConsole);	
		var b = instance_create(x, y, obj_PopupWindow);
		b.title = "-- File Alert --";
		b.text = "File does not currently exist in file directory.";
		b.animate = true;
		
		return false;
	
	}

	ConsoleLog(" ", 0, obj_RunnerConsole);




}

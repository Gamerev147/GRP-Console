///@description file_cr(fname, att)
function file_cr(_fname) {

	var fname = global.PATH + string(_fname);
	var short_fname = global.CURRENT_PATH + string(_fname);

	var file_check = (!file_exists(fname));
	//var date = string(current_month) + "/" + string(current_day) + "/" + string(current_year);


	if (file_check) {
		var nf = file_text_open_write(fname);
		file_text_write_string(nf, "");
		file_text_close(nf);
			
		ConsoleLog("File -" + string(short_fname) + "- [c_green]created successfully!", 0, obj_RunnerConsole);
		return fname;
			
		//var ib = instance_create(x, y, obj_PopupWindow);
		//ib.title = "-- Notification --";
		//ib.text = "File -" + string(fname) + "- has been created successfully!";
		//ib.animate = true;
	} else {
		ConsoleLog("[c_red]File already exists.", 0, obj_RunnerConsole);	
		cr_confirmbox("Would you like to view this file?", "open", [fname]);
	}



}

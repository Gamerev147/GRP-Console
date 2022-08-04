///@description Paths

update_runner = noone;

localpath = "version.ini";
webpath = "https://gmrvproductions.000webhostapp.com/version.ini";
webtemp = "temp/version.ini";
notespath = "https://gmrvproductions.000webhostapp.com/notes.txt";
notestemp = "temp/notes.txt";
noteslocal = "notes.txt";

//Get the files
http_get_file(webpath, webtemp);
http_get_file(notespath, notestemp);
http_get_file(notespath, noteslocal);

latestversion = "";
notes = "";

updatecheck = false;

updatefile_web = "";
updatefile_package = "";

//Create a local version file for the CURRENT VERSION
if (!file_exists(localpath)) {
	ini_open(localpath);
	ini_write_string("version", "number", string(global.VERSION));
	ini_close();
}


function check_updt_files() {
	//version
	if (file_exists(localpath)) {
		ini_open(localpath);
		global.VERSION = ini_read_string("version", "number", "2.1.14");
		ini_close();
	}
	
	//web version
	if (file_exists(webtemp)) {
		ini_open(webtemp);
		latestversion = ini_read_string("version", "number", "1.0.0");
		updatefile_web = ini_read_string("version", "link", "");
		updatefile_package = ini_read_string("version", "package", "");
		ini_close();
	}
	
	if (file_exists(noteslocal)) {
		var nf = file_text_open_read(noteslocal);
		notes = file_text_read_string(nf);
		file_text_close(nf);
	}
	
	//compare
	if (file_exists(localpath) && file_exists(webtemp)) {
		if (global.VERSION != latestversion) {
			if (updatecheck != true) {
				updatecheck = true;
				ConsoleLog("Done.", 0, RUN_ACTIVE);
				if (file_exists(noteslocal)) { contents(noteslocal); }
				cr_confirmbox("Update (" + string(latestversion) + ") is available! Download now?", "update_download", [updatefile_web, string(updatefile_package)]);
				runner_close(update_runner);
			}
		} else {
			ConsoleLog("Done.", 0, RUN_ACTIVE);
			Alert("Notification", "System is up to date.");
			runner_close(update_runner);
			instance_destroy();
		}
	}
}

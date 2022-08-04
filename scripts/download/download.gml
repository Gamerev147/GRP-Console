// download a file from a url
function download(url, Name="", Dest="") {
	
	if (string_is_url(url)) {
		var URL = string(url);
	} else if (string(url) = "gmrv") {
		var URL_usertag = string(Name);
		var URL = "https://gmrvproductions.000webhostapp.com/" + URL_usertag;
		ConsoleLog("Downloading from https://gmrvproductions.000webhostapp.com/", 0, RUN_ACTIVE);
		ConsoleLog("Looking for (" + string(URL_usertag) + ") ...", 0, RUN_ACTIVE);
	} else if (string(url) = "system") {
		var URL_usertag = string(Name);
		var URL = "https://gmrvproductions.000webhostapp.com/core/" + URL_usertag;
		ConsoleLog("Downloading from https://gmrvproductions.000webhostapp.com/core/", 0, RUN_ACTIVE);
		ConsoleLog("[c_yellow]Looking for (" + string(URL_usertag) + ") ...", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0);
	} else if (string(url) = "core") {
		var URL = "https://gmrvproductions.000webhostapp.com/core/";
		ConsoleLog("[c_yellow]Downloading core...", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
		
		if (obj_Console.downloaded = -2) {
			obj_Console.downloadUrl = URL;	
			obj_Console.downloadFileName = "core";
			obj_Console.downloadDest = game_save_id;
			obj_Console.downloaded = 0;
			
			obj_Console.downloadFile = http_get_file(obj_Console.downloadUrl, obj_Console.downloadDest);
			
			ConsoleLog("Initializing download...", 0, RUN_ACTIVE);
		}
		return;
	} else {
		ConsoleLog("[c_red]Invalid URL. Please try again.", 0, RUN_ACTIVE);	
	}
	
	
	if (instance_exists(obj_Console) && (!is_undefined(Name))) {
		if (obj_Console.downloaded = -2) {
			obj_Console.downloadUrl = URL;	
			obj_Console.downloadFileName = string(Name);
			obj_Console.downloadDest = string(Dest) + "\\" + string(Name);
			obj_Console.downloaded = 0;
			
			obj_Console.downloadFile = http_get_file(obj_Console.downloadUrl, string(Dest)+ "\\" + string(Name));
			
			ConsoleLog("Initializing download...", 0, RUN_ACTIVE);
		}
	} else {
		ConsoleLog("[c_red]Invalid argument(s).", 0, RUN_ACTIVE);	
	}


}

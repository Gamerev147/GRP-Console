// download a file from a url
function update_download(url, Name) {
	
	if (instance_exists(obj_Console) && (!is_undefined(Name))) {
		if (obj_Console.downloaded = -2) {
			obj_Console.downloadUrl = string(url);	
			obj_Console.downloadFileName = string(Name);
			obj_Console.downloadDest = string(Name);
			obj_Console.downloaded = 0;
			global.SYSTEM_UPDATE = true;
			obj_Console.downloadFile = http_get_file(obj_Console.downloadUrl, string(Name));
			
			ConsoleLog("Beginning file download...", 0);
		}
	} else {
		ConsoleLog("Invalid arguments!", 0);	
	}


}

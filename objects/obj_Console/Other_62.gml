/// @description Handle Update Downloads

if (async_load[? "id"] == downloadFile) {
	
	if (async_load[? "status"] == 1) { //Currently Downloading
		
		var size = async_load[? "contentLength"];
		var progress = async_load[? "sizeDownloaded"];
		ConsoleLog("Downloading... (" + string(progress) + "/" + string(bytes_to_megabytes(size)) + ")", 0, RUN_ACTIVE);
		
	} else if (async_load[? "status"] == 0) { //Successful download
		
		if (global.SYSTEM_UPDATE = false) {
			downloaded = 1;	
			ConsoleLog("[c_green]File has been downloaded successfully!", 0, RUN_ACTIVE);
			cr_confirmbox("Would you like to open the file?", "open", [string(downloadDest)]);
		} else {
			downloaded = 1;
			ConsoleLog("[c_green]Download complete.", 0, RUN_ACTIVE);
			alarm[3] = 20;
			global.VERSION = string(obj_Update.latestversion);
			with (obj_Update) { instance_destroy(); }
			global.SYSTEM_UPDATE = false;
		}
		
	} else { //Error
		
		downloaded = -1;	
		ConsoleLog("[c_red]Error downloading file. Please try again.", 0, RUN_ACTIVE);
		
	}
	
}

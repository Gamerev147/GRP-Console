/// @description Download

if (async_load[? "id"] == downloadFile) {
	if (async_load[? "status"] == 1) { //Currently Downloading
		var size = async_load[? "contentLength"];
		var progress = async_load[? "sizeDownloaded"];
		ConsoleLog("Downloading... (" + string(progress) + "/" + string(size) + ")", 0, RUN_ACTIVE);
	} else if (async_load[? "status"] == 0) { //Successful download
		downloaded = 1;	
		ConsoleLog(downloadFileName + "... [c_green]Complete.", 0, RUN_ACTIVE);
		//cr_confirmbox("Would you like to open the file?", "open", [string(downloadDest)]);
		instance_destroy();
	} else { //Error
		downloaded = -1;	
		ConsoleLog("[c_red]Error downloading file. Please try again.", 0, RUN_ACTIVE);
		instance_destroy();
	}
}


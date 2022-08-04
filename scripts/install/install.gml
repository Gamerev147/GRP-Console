function install(_url, _fname, _path=game_save_id) {
	
	var downUrl = string(_url);
	var downFile = string(_fname);
	var downPath = string(_path);
	
	if (_url == "gmrv") {
		downUrl = "https://gmrvproductions.000webhostapp.com/core/" + downFile;
	} else if (_url == "public") {
		downUrl = "https://gmrvproductions.000webhostapp.com/pub/" + downFile;
	}
	
	ConsoleLog("Getting " + downUrl + "...", 0, RUN_ACTIVE);
	
	var tempDownload = instance_create(x, y, obj_Download);
	tempDownload.downloadUrl = downUrl;
	tempDownload.downloadFileName = downFile;
	tempDownload.downloadDest = downPath + "\\" + downFile;
	tempDownload.downloadFile = http_get_file(downUrl, tempDownload.downloadDest);
		
	ConsoleLog("Starting download...", 0, RUN_ACTIVE);

}


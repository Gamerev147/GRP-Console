function bytes_smart_convert(_bytes) {
	
	var fbytes = real(_bytes);
	var sconversion = 0;
	var prefix = " B";
	
	if (fbytes >= 1073741824) { //GB
		sconversion = fbytes / 1073741824;	
		prefix = " GB";
	} else if (fbytes >= 1048576) { //MB
		sconversion = fbytes / 1048576;	
		prefix = " MB";
	} else if (fbytes >= 1024) {
		sconversion = fbytes / 1024;	
		prefix = " KB";
	} else if (fbytes > 1) {
		sconversion = fbytes;	
		prefix = " B";
	} else {
		sconversion = 0;	
	}
	
	return string(sconversion) + prefix;

}


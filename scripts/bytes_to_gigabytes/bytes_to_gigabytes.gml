function bytes_to_gigabytes(_bytes) {

	var bytes = real(_bytes);
	
	var gb = bytes/(1024*1024*1024);
	
	return gb;

}

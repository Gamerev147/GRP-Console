/// @Description file_text_read_all(fname)
/// @Param fname

function file_text_read_nlines(_fname) {

	var file = file_text_open_read(_fname);
	if (file < 0) return undefined;
	
	var delim = "\n";
	var str = "";
	var lines = 0;
	
	while(!file_text_eof(file)) {
		
		str += file_text_read_string(file);
		str += delim;
		lines += 1;
		file_text_readln(file);
		
	}
	
	file_text_close(file);
	return lines;

}

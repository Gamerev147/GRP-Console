/// @Description file_text_read_all(fname)
/// @Param fname

function file_text_read_all(_fname) {

	var file = file_text_open_read(_fname);
	if (file < 0) return undefined;
	
	var delim = "\n";
	var str = "";
	
	while(!file_text_eof(file)) {
		
		str += file_text_read_string(file);
		str += delim;
		file_text_readln(file);
		
	}
	
	file_text_close(file);
	return str;

}

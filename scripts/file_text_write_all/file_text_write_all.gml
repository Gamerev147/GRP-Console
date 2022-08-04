/// @Description file_text_write_all(fname, str)
/// @Param fname
/// @Param str

function file_text_write_all(_fname, _str) {

	var file = file_text_open_write(_fname);
	file_text_write_string(file, string(_str));
	file_text_close(file);
	
	return true;

}

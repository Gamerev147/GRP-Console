///@description return_pass(fname)
function return_pass(argument0) {

	var fname = argument0;

	ini_open("_filepass_.ini");

	if (ini_key_exists("File_Passwords", string(fname))) {
	
		return true;
	
	} else {
	
		return false;
	
	}

	ini_close();

}

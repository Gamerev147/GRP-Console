/// @Description
/// @Param
function new_sysdir(){

	var i = 0;
	var fileName = file_find_first(game_save_id + "*.", fa_directory);

	while (fileName != "") {
	    ConsoleLog(fileName, 0);
	    fileName = file_find_next();
	    i += 1;
	}

}

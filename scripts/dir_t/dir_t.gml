///@description dir_t([w] [p] [t] [g])
function dir_t(_type) {

	var dir_type = "";
	dir_type += string(_type) + "";

	//returns the working directory path

	switch (dir_type) {
	
		case "w":
			var working_path = string(working_directory);
			ConsoleLog("Current working directory: " + string(working_path), 0);
			ConsoleLog(" ", 0);
		break;
	
		case "p":
			var program_path = string(program_directory);
			ConsoleLog("Current program directory: " + string(program_path), 0);
			ConsoleLog(" ", 0);
		break;
	
		case "t":
			var temp_path = string(temp_directory);
			ConsoleLog("Current temporary directory: " + string(temp_path), 0);
			ConsoleLog(" ", 0);
		break;
	
		case "g":
			var true_path = string(game_save_id);
			ConsoleLog("Current directory path: " + string(true_path), 0);
			ConsoleLog(" ", 0);
		break;
	
		case "":
			ConsoleLog("Please enter a directory type: [w] [p] [t]", 0);
			ConsoleLog(" ", 0);
		break;
	
	}



}

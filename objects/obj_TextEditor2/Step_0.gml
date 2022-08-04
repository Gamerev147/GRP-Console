///@description Edit Text

if (!file_check) {
	if (file_exists(file_name)) {
		var ls = file_text_read_all(file_name);
		if (ls != "") {
			tte_ext_input_set_text(string(ls));
		} else {
			var t_file_ext = string_get_file_ext(file_name);
			if (t_file_ext == "grp") {
				//ADD A STRING_GET_FILE_EXTENSION() script TO CHECK THE EXTENSION
				tte_ext_input_set_text("// main script header file // \n// type your code here // ");
			} else {
				tte_ext_input_set_text(string(file_name));	
			}
		}
		file_found = true;
		file_check = true;
	}
}

global.CAN_TYPE = false;
tte_ext_input_step();

if keyboard_check(vk_control) && keyboard_check(ord("S")) {
	save_text_input(file_name);
}

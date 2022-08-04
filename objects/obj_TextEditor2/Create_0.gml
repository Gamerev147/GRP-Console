///@description Text Editor Init

keyboard_string = "";
global.CAN_TYPE = false;

file_found = false;
file_check = false;
file_name = "untitled.txt";

tte_ext_input_create(room_width-64, room_height-64, true);

function save_text_file(_fname) {
	var s = tte_ext_input_get_text();
	if (file_found) {
		file_delete(file_name);
		file_text_write_all(file_name, s)
		ConsoleLog("File (" + string(file_name) + ") was saved successfully!", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
		instance_destroy();
	} else {
		save_text_input(file_name);
		ConsoleLog("File (" + string(file_name) + ") was created successfully!", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
		instance_destroy();
	}
}

function save_text_input(_fname) {
	tte_ext_input_save_tofile(_fname);	
	instance_destroy();
}

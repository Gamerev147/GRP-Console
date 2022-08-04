///@description Text Editor Init

keyboard_string = "";
global.CAN_TYPE = false;
global.custom_edit = true;
global.script_editor_input = "";
display_script_error = false;
display_namespace_error = false;

file_map = ds_map_create();
file_found = false;
file_check = false;
file_name = "";
file_display_name = "";

//data structure for "easy-window" menu
easy_window_toggle = false;
easy_window = ds_map_create();
ds_map_add(easy_window, "Create Window", "CreateWindow>untitled>window1>600>400");
ds_map_add(easy_window, "Button", "Win_AddButton>window1>x>y>width>height>button name>file or script>optional arguments");
ds_map_add(easy_window, "Text", "Win_AddText>window1>x>y>your text");
ds_map_add(easy_window, "Image", "Win_AddImage>window1>x>y>width>height>path to image file");
ds_map_add(easy_window, "Input", "Win_AddInput>window1>x>y>width>height>inputVariable");

//data structure for "easy-element" menu
easy_element_toggle = false;
easy_element = ds_map_create();
ds_map_add(easy_element, "Log Text", "Log> >your text here");
ds_map_add(easy_element, "Variable", "var>your variable name>value");
ds_map_add(easy_element, "Clear", "ClearVar>your variable name");

//loading
alarm[0] = room_speed;
tte_ext_input_create(room_width-64, room_height-64, true);
tte_ext_input_set_text("Loading...");
tte_ext_input_set_multiline(true);
tte_ext_input_set_on_changed(editor_error_check);

function save_text_input(_fname) {
	tte_ext_input_save_tofile(_fname);
}

function save_text_file(_fname) {
	var s = tte_ext_input_get_text();
	if (file_found) {
		file_delete(file_name);
		if (file_text_write_all(file_name, s)) {
			ConsoleLog("File (" + string(file_name) + ") was saved successfully!", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		}
	} else {
		if file_text_write_all(file_name, s) {
			ConsoleLog("File (" + string(file_name) + ") was created successfully!", 0, RUN_ACTIVE);
			ConsoleLog(" ", 0, RUN_ACTIVE);
		}	
	}
}

function load_text_file(_fname) {
	if (file_exists(_fname)) {
		//read the file and set its text to the editor's
		var lts = file_text_read_all(_fname);
		if (!is_undefined(lts)) {
			tte_ext_input_set_text(string(lts));
			show_debug_message("Input set to file contents.");
		} else {
			tte_ext_input_set_text(string(_fname));
			show_debug_message("Input set to file name. No content found.");
		}	
	}
}

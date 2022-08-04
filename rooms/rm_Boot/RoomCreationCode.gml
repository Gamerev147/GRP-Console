///Load Settings

global.USER = "";
global.USER_IMAGE_PATH = "null";
global.USER_IMAGE = -1;
global.PATH = game_save_id;
global.CURRENT_PATH = "";

global.SYSTEM_TIMELOG = false;
global.SYSTEM_AUDIO = true;
global.SYSTEM_PERFORM = false;

global.wikip = "";
global.custom_edit = false;
global.bug_report = false;

if (file_exists("temp/version.ini")) { file_delete("temp/version.ini"); }
if (file_exists("temp/notes.txt")) { file_delete("temp/notes.txt"); }

if (file_exists("version.ini")) {
	ini_open("version.ini");
	global.IDENTIFIER_HASH = ini_read_string("identifier", "hash", "xxxx");
	global.VERSION = ini_read_string("version", "number", "2.1.14");	
	ini_close();
} else {
	global.VERSION = "2.1.14";	
	
	//Generate a user-profile hash identifier
	var dict = ["a", "b", "c", "d", "e", "f", "x", "y", "z", "k", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
	var temp_hash = "";
	for (var s = 0; s < 12; s++) {
		temp_hash += dict[random(array_length(dict))];	
	}
	global.IDENTIFIER_HASH = string(temp_hash);
	
	//Save the hash
	ini_open("version.ini");
	ini_write_string("version", "number", global.VERSION);
	ini_write_string("identifier", "hash", global.IDENTIFIER_HASH);
	ini_close();
}

txr_init();

scribble_init("fonts", "fntConsole", false);
scribble_add_font("fntConsole");
scribble_add_font("fnt_Label");
scribble_add_font("fnt_Label_2");
scribble_add_font("fntRabbit");
global.__INIT__ = true;

//Move to next room
room_goto_next();

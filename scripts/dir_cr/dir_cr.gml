///@description dir_cr(dname)
function dir_cr(_dname) {

	var dname = "";
	dname += string(_dname) + "";

	var dname_return = global.PATH + string(dname);
	//var dname_path = game_save_id + string(dname_return);
	var date = string(string(current_month) + "." + string(current_day) + "." + string(current_year));
	var time = string(string(current_hour) + ":" + string(current_minute));

	//Save the name and path to the directory file
	ini_open("directory.ini");
	ini_write_string(string(dname_return), "path", string(dname_return));
	ini_write_string(string(dname_return), "date", string(date));
	ini_write_string(string(dname_return), "time", string(time));
	ini_close();

	directory_create(string(dname_return));

	ConsoleLog("Directory -" + string(dname_return) + "- [c_green]has been created.", 0, obj_RunnerConsole);
	ConsoleLog(" ", 0);



}

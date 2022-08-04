///@description Check for Update

var result, evid;
evid = async_load[? "id"];

switch (evid)  {

    case update_url:
        result = async_load[? "result"];
        file = file_text_open_write("update.ini");
        file_text_write_string(file, result);
        file_text_close(file);
    break;

}

ini_open("update.ini");
core = ini_read_string("version", "core", "");
frame = ini_read_string("version", "frame", "");
uall = ini_read_string("version", "all", "");
ini_close();

if (core == "0") {
	ConsoleLog("A Core update is available!", 0);
}

if (frame == "0") {
	ConsoleLog("A Frame update is available!", 0);
}

if (uall == "0") {
	ConsoleLog("A total system update is available!", 0);
}

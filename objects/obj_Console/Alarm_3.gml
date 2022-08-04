/// @description Unzip Update
file_unzip(string(downloadDest), game_save_id + "core/");
file_delete(string(downloadDest));
ConsoleLog(" ", 0, obj_RunnerConsole);

//Save Version
ini_open("version.ini");
ini_write_string("version", "number", string(global.VERSION));
ini_close();

//Reset File Downnload
global.SYSTEM_UPDATE = false;
downloadUrl = "";
downloadFile = 0;
downloadFileName = "";
downloadDest = game_save_id;
downloaded = -2;

ConsoleLog("Update Complete!", 0, obj_RunnerConsole);
ConsoleLog("System version is now [" + string(global.VERSION) + "]", 0, obj_RunnerConsole);
ConsoleLog(" ", 0, obj_RunnerConsole);

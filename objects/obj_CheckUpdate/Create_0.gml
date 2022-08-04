///@description Get Update URL

if (file_exists("update.ini")) {
    file_delete("update.ini");
}

my_url = "";
update_url = 0;
alarm[0] = 20;
ConsoleLog("Checking for updates...", 0);

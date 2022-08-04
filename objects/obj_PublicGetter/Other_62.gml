/// @description Load Result

var results = async_load[? "result"];

if (results != -1) {
	ConsoleLog("   Files available in /pub :", 0);
	ConsoleLog(" ", 0);
	
	var log_results_array = StringSplitChar(results, "\n");
	array_log_to_console(log_results_array);
	
	ConsoleLog(" ", 0);
}

instance_destroy();


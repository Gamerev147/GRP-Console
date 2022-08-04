/// @description Load Result

var results = async_load[? "result"];

if (results != -1) {
	ConsoleLog("[c_green]Success! [c_white]Bug report submitted.", 0);
	ConsoleLog(" ", 0);
} else {
	ConsoleLog("[c_red]Error uploading report.", 0);	
}


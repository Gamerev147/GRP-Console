/// @description ConsoleTogle();
function ConsoleTogle() {

	if (!instance_exists(obj_Console)) { exit; }

	with (obj_Console) {
	
	    Focus = !Focus;
	
	}



}


function goto(_dname) {

	var dname = global.PATH + string(_dname);
	
	if (directory_exists(dname)) {
		global.PATH = string(dname);
		global.CURRENT_PATH = string(_dname);
		obj_Console.Text_DefText = string(global.CURRENT_PATH) + ">. "; 
		
		if (instance_exists(RUN_ACTIVE)) {
			RUN_ACTIVE.Text_DefText = 	string(global.CURRENT_PATH) + ">. "; 
		}
		
		ConsoleLog("Target path set to [c_green]--" + string(global.PATH) + "--", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	} else if (string(_dname) == "--root" || (string(_dname) == "--r")) {
		global.PATH = game_save_id;
		global.CURRENT_PATH = "";
		obj_Console.Text_DefText = string(global.CURRENT_PATH) + ">. "; 
		
		if (instance_exists(RUN_ACTIVE)) {
			RUN_ACTIVE.Text_DefText = 	string(global.CURRENT_PATH) + ">. ";
		}
		
		ConsoleLog("Target path set to --" + string(global.PATH) + "--", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	} else if (string(_dname) == "--back") || (string(_dname) == "--") {
		var tp = string(global.CURRENT_PATH);
		var ww = "";
		var pp = "";
		var pts;
		pts[0] = "";
		var cco = 0;
		
		for (var i = string_length(tp); i < string_length(tp); i++) {
			var char = string_char_at(tp, i+1);
			if (char != "/") {
				ww += char;	
			} else {
				if (pp = "") {
					pp = ww;
					ww = "";
					continue;
				} else {
					pts[cco] = ww;
					cco += 1;
					ww = "";
				}
			}
		}
		
		ConsoleLog(pts, 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	} else {
		ConsoleLog("[c_red]Directory doesn't exist!", 0, RUN_ACTIVE);	
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}

}

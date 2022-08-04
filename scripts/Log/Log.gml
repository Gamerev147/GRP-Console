/// @description Log(Print)
/// @param Print

function Log(Runner="", argument0, nline="") {

	var user_runner;
	var newline = nline;
	if (Runner != "") && (Runner != undefined) && (Runner != " ") {
		if (string_is_real(Runner)) {
			user_runner = real(Runner);
		} else if (Runner == "active_runner") { //user can type "active_runner" to log to the currently active runner
			if (RUN_ACTIVE != noone) {
				user_runner = RUN_ACTIVE;	
			} else {
				user_runner = obj_Console;	
			}
		} else {
			user_runner = obj_Console;
			ds_list_add(RUNTIME_ERRORS, "Given runner is not an ID.");	
		}
		show_debug_message("outputting to a runner...");
	} else {
		user_runner = obj_Console;	
		show_debug_message("outputting to core...");
	}

	with (user_runner) {
	    //Scroll the arrays for the console
	    for(var i = array_length_1d(Text_) - 1 ; i >= 0; i --) {
	        Text_[i + 1] = Text_[i];
	    }
	
		//add a time-stamp if the timelog is enabled
		if (global.SYSTEM_TIMELOG) {
			var tl = "(" + string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + ") ";
			Text_[0] = tl + string(argument0);
		} else {
			Text_[0] = string(argument0);
		}
		
		if (newline == "newl") {
			ConsoleLog(" ", 0, user_runner);	
		}
		
		//check if the instance we are logging to is a runner or not
		if (ds_list_find_value(RUNNERS, ds_list_find_index(RUNNERS, id))) {
			Text_CurrentLine = Text_DefText;	
		} else {
			Text_CurrentLine = "";
		}
	}
	
	audio_play_sound(snd_Readout, 1, false);

}



/// @description ConsoleLog(Print,SaveInMemory)
/// @param Print
/// @param SaveInMemory
function ConsoleLog(argument0, argument1, idd=undefined) {

	var _idd = noone;

	if (!is_undefined(idd)) {
		if (instance_exists(idd)) {
			_idd = idd;
		} else {
			_idd = obj_Console;	
		}
	} else {
		_idd = obj_Console;
	}
	
	var my_obj_name = object_get_name(_idd)

	with (_idd) {
	
		redraw_surface = true;
	
	    if (argument1) {
	        Text_Last = 0;
		
	        for(var i = array_length_1d(Text_LastLine)-1; i >= 0; i --) {
	            Text_LastLine[i + 1] = Text_LastLine[i];
	        }
		
	        Text_LastLine[0] = Text_CurrentLine;
	    }
	
	    //Scroll the arrays for the console
	    for(var i = array_length_1d(Text_) - 1 ; i >= 0; i --) {
	        Text_[i + 1] = Text_[i];
	    }
	
		if (global.SYSTEM_TIMELOG && argument0 != "" && argument0 != " ") {
			var tl = "(" + string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + ") ";
			Text_[0] = tl + string(argument0);
		} else {
			Text_[0] = string(argument0);
		}
		
		if (my_obj_name == "obj_Console") {
			Text_CurrentLine = "";
			lCursorPos = 1;
		} else if (my_obj_name == "obj_RunnerConsole") {
			Text_CurrentLine = Text_DefText;
		}
	
	}

	audio_play_sound(snd_Readout, 1, false);

}

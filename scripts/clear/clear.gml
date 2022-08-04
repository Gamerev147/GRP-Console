/// @description clear()  
function clear(Runner) {
	/*
	    clear Memory
	*/
	
	var _idd = noone;

	if (!is_undefined(Runner)) {
		if (instance_exists(RUN_ACTIVE)) {
			_idd = RUN_ACTIVE;
		} else {
			_idd = obj_Console;	
		}
	} else {
		if (instance_exists(RUN_ACTIVE)) {
			_idd = RUN_ACTIVE;	
		} else {
			if (instance_exists(obj_Console)) { _idd = obj_Console; }
		}
	}
	
	with (_idd) {

		Text_ = -1
		Text_[0]    = Text_DefText
		Text_LastLine = -1
		Text_LastLine[0]       = Text_[0]
	
	}

	//ConsoleLog(" ", 0);

	var ib = instance_create(x, y, obj_PopupWindow);
	ib.text = "Command history has been cleared!";
	ib.title = "-- System Alert --";
	ib.animate = true;



}

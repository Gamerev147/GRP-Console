function Wait(_duration, _pointer, _arg0="", _arg1="", _arg2="", _arg3="") {
	
	var wo = instance_create(0, 0, obj_Wait);
	var Duration, Pointer, pArgs;
	
	pArgs = [];
	pArgs[0] = _arg0;
	pArgs[1] = _arg1;
	pArgs[2] = _arg2;
	pArgs[3] = _arg3;
	
	Pointer = string(_pointer);
	if (ConsoleReal(_duration)) {
		Duration = real(_duration);	
	}
	
	wo.pointer = Pointer;
	wo.pointer_arguments = pArgs;
	
	if (Duration != undefined) {
		wo.duration = Duration;	
	}

}

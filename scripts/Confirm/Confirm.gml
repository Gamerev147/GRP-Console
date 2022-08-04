
function Confirm(_question, _script, _arg0, _arg1, _arg2) {

	var cb = instance_create_layer(x, y, "alert", obj_PopupConfirm);
	cb.text = string(_question);
	cb.myScript = string(_script);
	cb.myArgs[0] = _arg0;
	cb.myArgs[1] = _arg1;
	cb.myArgs[2] = _arg2;
	//ConsoleLog(string(cb.myArgs), 0, obj_RunnerConsole);
	cb.animate = true;

}

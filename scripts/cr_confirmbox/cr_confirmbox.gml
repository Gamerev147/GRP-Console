///@ Description cr_confirmbox(question, script, arguments)
///@ Param Question
///@ Param Script
///@ Param Arguments
function cr_confirmbox(_question, _script, _args) {

	var cb = instance_create_layer(x, y, "alert", obj_PopupConfirm);
	cb.text = string(_question);
	cb.myScript = string(_script);
	cb.myArgs = _args;
	cb.animate = true;

}

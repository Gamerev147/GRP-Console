// create another console in a new window
function runner() {
	var ac = instance_create_layer(random(64), random(64), "ui_layer", obj_RunnerConsole);
	ac.animate = true;
	
	RUN_ACTIVE = ac;
	return ac;
}

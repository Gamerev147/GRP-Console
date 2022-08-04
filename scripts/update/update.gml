///@description update(type)
function update() {

	var ur = runner();

	var udt = instance_create_layer(x, y, layer, obj_Update);
	udt.update_runner = ur;
	
	ConsoleLog("Starting check for update...", 0, RUN_ACTIVE);

}

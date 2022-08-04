///@description shutdown()
function close() {

	if (RUN_ACTIVE == noone) {
		game_end();
	} else {
		with (RUN_ACTIVE) {
			instance_destroy();	
		}
	}

}

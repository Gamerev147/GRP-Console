//close a runner
function runner_close(_id) {
	var idd = real(_id);
	
	if (instance_exists(idd)) {
		with (idd) {
			instance_destroy();	
		}
	}

}

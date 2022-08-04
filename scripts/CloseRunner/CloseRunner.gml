
function CloseRunner(_var) {

	var close_runner_id = real(_val);
	
	if (close_runner_id != undefined) || (close_runner_id != 0) {
		with (close_runner_id) { instance_destroy(); }	
	} else {
		show_debug_message("runner doesn't exist.")	;
		ds_list_add(RUNTIME_ERRORS, "Runner (" + string(close_runner_id) + ") does not exist.");
	}

}

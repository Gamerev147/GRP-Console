/// @param error_text
/// @param action
/// @param stack
function txr_exec_exit(argument0, argument1, argument2) {
	ds_stack_destroy(argument2);
	return txr_throw(argument0, argument1[1]);


}

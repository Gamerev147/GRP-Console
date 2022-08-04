/// @arg obj
function struct_create(argument0) {

	// This script will instantiate an object given, then immediately deactivate it and return its id
	var s = instance_create_depth(0,0,0,argument0);
	instance_deactivate_object(s);
	return s;


}

/// @arg x int32
/// @arg y int32
/// @arg z int32
function CH(argument0, argument1, argument2) {
	var _x = argument0, _y = argument1, _z = argument2;
	return int32(((_x) & (_y)) ^ (~(_x) & (_z)));


}

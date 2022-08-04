/// @arg x int32
function EP1(argument0) {
	var _x = argument0;
	return int32(ROTRIGHT(_x, 6) ^ ROTRIGHT(_x, 11) ^ ROTRIGHT(_x, 25));


}

/// @arg x int32
function EP0(argument0) {
	var _x = argument0;
	return int32(ROTRIGHT(_x, 2) ^ ROTRIGHT(_x, 13) ^ ROTRIGHT(_x, 22));


}

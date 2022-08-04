/// @arg x int32
function SIG0(argument0) {
	var _x = argument0;
	return int32(ROTRIGHT(_x, 7) ^ ROTRIGHT(_x, 18) ^ (_x >> 3));


}

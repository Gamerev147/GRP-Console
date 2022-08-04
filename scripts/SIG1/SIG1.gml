/// @arg x int32
function SIG1(argument0) {
	var _x = argument0;
	return int32(ROTRIGHT(_x, 17) ^ ROTRIGHT(_x, 19) ^ (_x >> 10));


}

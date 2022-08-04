/// @arg a int32
/// @arg b byte
function ROTRIGHT(argument0, argument1) {
	var a = int32(argument0), b = argument1;
	return int32(int32((a) >> (b)) | int32((a) << (32 - (b))));


}

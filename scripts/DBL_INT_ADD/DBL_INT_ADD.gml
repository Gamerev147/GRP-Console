/// @arg a
/// @arg b
/// @arg c
function DBL_INT_ADD(argument0, argument1, argument2) {
	var a = argument0, b = argument1, c = argument2;
	if (a > 0xffffffff - c) b++;
	a += c;

	var ret = -1; // This fixes the reference arguments from the source code
	ret[1] = b;
	ret[0] = a;
	return ret;


}

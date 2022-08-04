/// @param int32
/// Returns a hex string
function int_to_hex() {
	var v = argument[0];
	var q = 0;
	var r = 0;
	var str = "";
	do
	{
		q = v div 16;
		r = v % 16;
		v = q;
		str = hex_lookup(r)+str;
	} until (q == 0);
	return str;


}

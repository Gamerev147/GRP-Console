/// @param int32
function hex_lookup() {
	// Returns the hex value for a given decimal digit 0-15 = 0-f
	var v = argument[0];
	if (v < 10) return string(v);
	else return chr(97+(v-10));


}

/// @arg buffer
/// @arg offset (in bytes)
/// @arg size	(in bytes)
function buffer_sha256(argument0, argument1, argument2) {

	//NOTE: buffer_string adds an extra byte (0) to the end of the string, so hashes will differ from expectation. Use buffer_text to avoid that problem if necessary!

	var buffer = argument0, offset = argument1, size = argument2;

	if (!buffer_exists(buffer))
	{
		var callstack = debug_get_callstack();
		show_error("####### ERROR #######\n\n"+callstack+"\n\nTrying to access non-existant buffer.",false); //You can remove this if you want a silent fail that returns a zero'd-out hash
		return string_repeat("0",64);
	}

	var ctx = new_ctx();
	ctx.data = array_create(64,0);
	ctx.bitlen = array_create(2,0);
	ctx.state = array_create(8,0);
	hash = array_create(32,0);
	hashstr = "";

	//Replacing Encoding.Default.GetBytes(data)
	var getbytes = -1;
	for(var i = 0; i < size-offset; i++)
	{
		getbytes[i] = buffer_peek(buffer,offset+i,buffer_u8);
	}

	sha256init(ctx);
	sha256update(ctx,getbytes,size-offset);
	sha256final(ctx,hash);

	for(var i = 0; i < 32; i++)
	{
		var h = int_to_hex(hash[i]);
		if (string_length(h) < 2) h = "0"+h;
		hashstr = hashstr + h;
	}

	getbytes = -1;
	struct_delete(ctx);

	return hashstr;


}

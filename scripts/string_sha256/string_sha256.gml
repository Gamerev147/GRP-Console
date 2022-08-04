/// @arg string
function string_sha256(argument0) {
	var data = argument0;

	var ctx = new_ctx();
	ctx.data = array_create(64,0);
	ctx.bitlen = array_create(2,0);
	ctx.state = array_create(8,0);
	hash = array_create(32,0);
	hashstr = "";

	//Replacing Encoding.Default.GetBytes(data)
	var getbytes = -1;
	for(var i = 0; i < string_length(data); i++)
	{
		getbytes[i] = string_byte_at(data,i+1);
	}

	sha256init(ctx);
	sha256update(ctx,getbytes,string_length(data));
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

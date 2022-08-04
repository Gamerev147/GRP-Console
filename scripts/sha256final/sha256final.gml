/// @arg ctx
/// @arg hash bytearray
function sha256final(argument0, argument1) {
	var ctx = argument0, hash = argument1;
	var i = ctx.datalen;

	if (ctx.datalen < 56)
	{
		ctx.data[i++] = 0x80;

		while (i < 56)
		{
			ctx.data[i++] = 0x00;
		}
	}
	else
	{
		ctx.data[i++] = 0x80;

		while (i < 64)
		{
			ctx.data[i++] = 0x00;
		}

		sha256transform(ctx,ctx.data);
		for(var i = 0; i < 56; i++)
		{
			ctx.data[i] = 0;
		}
	}

	var r = DBL_INT_ADD(ctx.bitlen[0],ctx.bitlen[1],ctx.datalen * 8);
	ctx.bitlen[0] = r[0];
	ctx.bitlen[1] = r[1];
	r = -1;

	ctx.data[63] = ctx.bitlen[0];
	ctx.data[62] = ctx.bitlen[0] >> 8;
	ctx.data[61] = ctx.bitlen[0] >> 16;
	ctx.data[60] = ctx.bitlen[0] >> 24;
	ctx.data[59] = ctx.bitlen[1];
	ctx.data[58] = ctx.bitlen[1] >> 8;
	ctx.data[57] = ctx.bitlen[1] >> 16;
	ctx.data[56] = ctx.bitlen[1] >> 24;
	sha256transform(ctx,ctx.data);

	for (i = 0; i < 4; ++i)
	{
		hash[@ i]		= (ctx.state[0] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 4]	= (ctx.state[1] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 8]	= (ctx.state[2] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 12]	= (ctx.state[3] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 16]	= (ctx.state[4] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 20]	= (ctx.state[5] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 24]	= (ctx.state[6] >> (24 - i * 8)) & 0x000000ff;
		hash[@ i + 28]	= (ctx.state[7] >> (24 - i * 8)) & 0x000000ff;
	}


}

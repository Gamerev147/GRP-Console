/// @arg ctx
/// @arg databytes
/// @arg length
function sha256update(argument0, argument1, argument2) {
	var ctx = argument0;
	var data = argument1;
	var len = argument2;

	for(var i = 0; i < len; i++)
	{
		ctx.data[ctx.datalen] = data[i];
		ctx.datalen++;
	
		if (ctx.datalen == 64)
		{
			sha256transform(ctx,ctx.data);
			var r = DBL_INT_ADD(ctx.bitlen[0], ctx.bitlen[1], 512);
			ctx.bitlen[0] = r[0];
			ctx.bitlen[1] = r[1];
			ctx.datalen = 0;
		}
	}


}

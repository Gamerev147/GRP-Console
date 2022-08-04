/// @arg ctx
/// @arg databytes
function sha256transform(argument0, argument1) {
	var ctx = argument0;
	var data = argument1;

	var k = [
		0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
		0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
		0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
		0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
		0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
		0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
		0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
		0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
	];

	var a, b, c, d, e, f, g, h, i, j = 0, t1, t2;
	var m = array_create(64,0);

	for(i = 0; i < 16; ++i)
	{
		j = i*4; //Replacing the multi-variable syntax of the for-loop
		m[i] = int32(int32(data[j] << 24) | int32(data[j + 1] << 16) | int32(data[j + 2] << 8) | int32(data[j + 3]));
	}

	for (; i < 64; ++i)
	{
		m[i] = int32(SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) + m[i - 16]);
	}

	a = ctx.state[0];
	b = ctx.state[1];
	c = ctx.state[2];
	d = ctx.state[3];
	e = ctx.state[4];
	f = ctx.state[5];
	g = ctx.state[6];
	h = ctx.state[7];

	for(i = 0; i < 64; ++i)
	{
		t1 = int32(h + EP1(e) + CH(e, f, g) + k[i] + m[i]);
		t2 = int32(EP0(a) + MAJ(a, b, c));
		h = g;
		g = f;
		f = e;
		e = int32(d + t1);
		d = c;
		c = b;
		b = a;
		a = int32(t1 + t2);
	}

	ctx.state[0] = int32(ctx.state[0]+a);
	ctx.state[1] = int32(ctx.state[1]+b);
	ctx.state[2] = int32(ctx.state[2]+c);
	ctx.state[3] = int32(ctx.state[3]+d);
	ctx.state[4] = int32(ctx.state[4]+e);
	ctx.state[5] = int32(ctx.state[5]+f);
	ctx.state[6] = int32(ctx.state[6]+g);
	ctx.state[7] = int32(ctx.state[7]+h);


}

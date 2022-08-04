//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float r = col.r;
	col.r = col.b;
	col.b = r;
	gl_FragColor = col;
}

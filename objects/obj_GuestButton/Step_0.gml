/// @description Hover

var _hov = get_hover();
hover = lerp(hover, _hov, 0.1);

if (fo) {
	alph -= 0.1;	
	
	if (alph <= 0) {
		instance_destroy();	
	}
}


function decrease_color_rgb(_color, _amt=0.3) {

	var col = merge_color(_color, c_black, real(_amt));
	return col;

}

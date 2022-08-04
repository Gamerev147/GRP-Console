
function cr_checkbox(_x, _y, _title) {
	
	draw_set_color(c_white);
	draw_rectangle(real(_x), real(_y), real(_x) + 10, real(_y) + 10, true);
	
	draw_text(real(_x)+18, real(_y), string(_title));

}

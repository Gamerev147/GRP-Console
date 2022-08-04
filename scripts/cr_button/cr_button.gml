
function cr_button(_x, _y, _w, _h, _str, _bc, _hc, _tc) {
	
	var xx = _x;
	var yy = _y;
	var width = _w/2;
	var height = _h/2;
	var text = _str;
	var back_color = _bc;
	var hover_color = _hc;
	var text_color = _tc;
	
	var bl = xx - width;
	var br = xx + width;
	var bt = yy - height;
	var bb = yy + height;
	
	var oColor = draw_get_color();
	var hov = point_in_rectangle(mouse_x, mouse_y, bl, bt, br, bb);
	
	if (hov) {
		draw_set_color(hover_color);
		draw_rectangle(bl, bt, br, bb, false);
		
		draw_set_color(text_color);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(xx, yy, string(text));
	} else {
		draw_set_color(back_color);
		draw_rectangle(bl, bt, br, bb, false);
		
		draw_set_color(text_color);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(xx, yy, string(text));
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(oColor);
	return (hov && mouse_check_button_released(mb_left));

}

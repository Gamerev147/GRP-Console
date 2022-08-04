/// @description Draw Loading Screen

	
var oCol = draw_get_color();
var oAlp = draw_get_alpha();
var oFon = draw_get_font();
	
//background
draw_set_alpha(a);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
//text
draw_set_color(c_white);
draw_set_font(fntLogin);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Loading");
	
//reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(oAlp);
draw_set_color(oCol);
draw_set_font(oFon);
	

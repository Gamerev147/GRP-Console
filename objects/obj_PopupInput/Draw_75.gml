///@description Draw Window

if ((animate = true) || (animate_done = true)) {

	draw_set_alpha(0.95);
	draw_set_color(c_dkgray);
	draw_rectangle(window_start_x, window_start_y, window_start_x + window_width, window_start_y + window_height, false);
	
	draw_set_alpha(1);
	draw_set_color(obj_Console.Outline_Color);
	draw_rectangle(window_start_x, window_start_y, window_start_x + window_width, window_start_y + window_height, true);
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var titlex = window_start_x + (max_window_width/2);
	var titley = window_start_y + 32;

	draw_text(titlex, titley, string(title));
	
	draw_rectangle(window_start_x + 48, window_start_y + 84, (window_start_x+max_window_width)-32, window_start_y + 116, true);
	draw_set_halign(fa_left);
	draw_text(window_start_x + 52, window_start_y + 100, string(input) + "|");
	
	draw_set_halign(fa_center);
	draw_text(titlex, titley+120, "Press ENTER to confirm.");

}

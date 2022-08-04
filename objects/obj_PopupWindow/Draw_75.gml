///@description

if ((animate = true) || (animate_done = true)) {
	
	if (global.TAB == "WEB") && (instance_exists(ChromeControl)) {
		surface_set_target(ChromeControl.surf);
	}

	draw_set_color(c_dkgray);
	draw_set_alpha(0.9);
	draw_roundrect(window_start_x, window_start_y, window_start_x + window_width, window_start_y + window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_start_x + window_width, window_start_y + window_height, true);
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var titlex = window_start_x + (max_window_width/2);
	var titley = window_start_y + 32;

	draw_set_font(fnt_Label_2);
	draw_set_color(c_green);
	draw_text(titlex, titley, string(title));
	draw_text(titlex, titley + 132, "-- Press ENTER to continue --");
	
	draw_set_font(fnt_Label);
	draw_set_halign(fa_left);
	draw_set_color(c_ltgray);
	draw_text_ext(window_start_x + 16, titley + 32, string(text), -1, window_width-16);
	
	if (global.TAB == "WEB") && (instance_exists(ChromeControl)) {
		surface_reset_target();
	}

}

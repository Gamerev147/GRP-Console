///@description

if ((animate = true) || (animate_done = true)) {

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

	draw_set_color(c_green);
	draw_text(titlex, titley, string(title));
	
	draw_set_halign(fa_left);
	draw_set_color(c_ltgray);
	draw_text(window_start_x + 16, titley + 32, string(text));
	
	//Yes Button
	draw_set_valign(fa_top);
	
	var yesHover = point_in_rectangle(mouse_x, mouse_y, window_start_x+32, titley+64, window_start_x+96, titley+88);
	if (yesHover) {
		draw_set_color(c_white);	
		if (mouse_check_button_released(mb_left) && myScript != undefined) {
			var ExScript = asset_get_index(myScript);
			if (script_exists(ExScript)) {
				script_execute_ext(ExScript, myArgs);
				instance_destroy();
			}
		}
	} else { draw_set_color(c_ltgray); }
	
	draw_roundrect(window_start_x+32, titley+64, window_start_x+96, titley+88, false);
	draw_set_color(c_black);
	draw_text(window_start_x+36, titley+68, "Yes");
	
	//No Button
	var noHover = point_in_rectangle(mouse_x, mouse_y, max_window_width-96, titley+64, max_window_width-32, titley+88);
	if (noHover) {
		draw_set_color(c_white);
		if (mouse_check_button_released(mb_left)) {
			instance_destroy();
		}
	} else { draw_set_color(c_ltgray); }
	
	draw_roundrect(max_window_width-96, titley+64, max_window_width-32, titley+88, false);
	draw_set_color(c_black);
	draw_text(max_window_width-92, titley+68, "No");

}

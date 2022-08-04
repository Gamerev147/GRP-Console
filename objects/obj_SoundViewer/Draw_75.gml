///@description

if ((animate = true) || (animate_done = true)) {

	draw_set_color(c_dkgray);
	draw_set_alpha(0.95);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var titlex = (window_start_x + window_width)/2;
	var titley = window_start_y + 16;

	draw_set_color(c_green);
	draw_text(titlex, titley, string(title));
	
	//Progression Bar
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	if (snd != undefined) {
		var barLength = (sndPosition/sndLength)*100;
		draw_text(window_width-64, titley+44, string(sndLength) + "s");
		draw_healthbar(window_start_x+96, titley+48, window_width-96, titley+52, barLength, c_dkgray, c_white, c_white, 0, true, true);
		draw_text(window_start_x+48, titley+44, "- " + string(sndPosition) + "s");
	}
	
	//Pause and Play Buttons
	var play_button = cr_button(window_start_x+96, titley+96, 96, 18, "Play", c_gray, c_ltgray, c_white);
	if (play_button) {
		if (audio_is_paused(playSnd)) { 
			audio_resume_sound(playSnd); 
		}
	}
	var pause_button = cr_button(window_start_x+224, titley+96, 96, 18, "Pause", c_gray, c_ltgray, c_white);
	if (pause_button) { audio_pause_sound(playSnd); }
	var stop_button = cr_button(window_start_x+352, titley+96, 96, 18, "Stop", c_gray, c_ltgray, c_white);
	if (stop_button) {
		if (audio_is_playing(playSnd)) {
			audio_sound_set_track_position(playSnd, 0);
			audio_pause_sound(playSnd);
		}
	}
	
	//Resize Anchor
	draw_set_color(c_white);
	draw_rectangle(window_width-5, window_height-5, window_width+5, window_height+5, false);
	if (point_in_rectangle(mouse_x, mouse_y, window_width-50, window_height-50, window_width+50, window_height+50)) {
		if (mouse_check_button(mb_left)) {
			if (window_width >= min_window_width) {
				if (window_height >= min_window_height) {
					window_width = mouse_x;
					window_height = mouse_y;
				} else { window_height = min_window_height; }
			} else { window_width = min_window_width; }
		}
	}
	
	//Movement Anchor
	draw_text(window_width, window_height+16, "(" + string(window_width) + "," + string(window_height) + ")");
	draw_rectangle(window_start_x-5, window_start_y-5, window_start_x+5, window_start_y+5, true);
	if (device_mouse_check_button(0, mb_left)) {
		if (point_in_rectangle(mouse_x, mouse_y, window_start_x-50, window_start_y-50, window_start_x+50, window_start_y+50)) {
			window_start_x = mouse_x;
			window_start_y = mouse_y;
			window_width = window_start_x+current_width;
			window_height = window_start_y+current_height;
		}
	}
	
	//Close Button
	if (point_in_rectangle(mouse_x, mouse_y, window_width-5, window_start_y-5, window_width+5, window_start_y+5)) {
		draw_rectangle(window_width-5, window_start_y-5, window_width+5, window_start_y+5, false);
		if (mouse_check_button_released(mb_left)) {
			audio_destroy_stream(snd);
			instance_destroy();
		}
	} else {
		draw_rectangle(window_width-5, window_start_y-5, window_width+5, window_start_y+5, true);	
	}

}

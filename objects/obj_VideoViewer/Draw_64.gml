///@description

if (global.__rounded_windows) {
	draw_sprite_stretched_ext(spr_WindowRound, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 1);
} else {
	draw_sprite_stretched_ext(spr_Window, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 1);
}
	
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var titlex = (window_start_x + window_width)/2;
var titley = window_start_y + 16;

draw_set_color(c_dkgray);
draw_text(titlex, titley, string(title));
	
//Draw Video
/*
var video_data = video_draw();
var video_status = video_data[0];
if (video_status == 0) {
	video_surface = video_data[1];
	draw_surface_stretched(video_surface, window_start_x+32, window_start_y+48, current_width-64, current_height-96);
}
*/

//Playback buttons
if (point_in_rectangle(mouse_x, mouse_y, window_start_x+32, current_height-24, window_start_x+120, current_height-4)) {
	draw_set_color(c_white);
	draw_rectangle(window_start_x+32, current_height-24, window_start_x+120, current_height-4, false);
	draw_set_color(c_dkgray);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_font(fnt_Label);
	draw_text(window_start_x+36, current_height-14, "Play / Pause");
	
	if (mouse_check_button_pressed(mb_left)) {
		var _status = video_get_status();
		if (_status == video_status_playing) {
			video_pause();	
		} else if (_status == video_status_paused) {
			video_resume();	
		}
	}
} else {
	draw_set_color(c_white);
	draw_rectangle(window_start_x+32, current_height-24, window_start_x+120, current_height-4, true);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_font(fnt_Label);
	draw_text(window_start_x+36, current_height-14, "Play / Pause");
}

//Resize Anchor
draw_set_color(c_dkgray);
draw_circle(window_width, window_height, 5, false);
if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 6)) {
	if (mouse_check_button(mb_left) && (!window_drag)) {
		window_resize = true;
	}
}

if (window_resize) {
	window_width = mouse_x;
	window_height = mouse_y;
	current_width = window_width - window_start_x;
	current_height = window_height - window_start_y;
					
	current_width = clamp(current_width, min_window_width, max_window_width);
	current_height = clamp(current_height, min_window_height, max_window_height);
	window_width = clamp(window_width, x+min_window_width, x + max_window_width);
	window_height = clamp(window_height, y+min_window_height, y + max_window_height);	
}
	
//Movement Anchor
//draw_circle(window_start_x, window_start_y, 5, false);
if (point_in_rectangle(mouse_x, mouse_y, window_start_x, window_start_y, window_width, window_start_y+22)) {
	if (mouse_check_button(mb_left) && (!window_drag)) {
		pmouse_x = window_start_x - mouse_x;
		pmouse_y = window_start_y - mouse_y;
		window_drag = true;
	}
}

if (window_drag) {
	window_start_x = mouse_x + pmouse_x;
	window_start_y = mouse_y + pmouse_y;
	window_width = window_start_x + current_width;
	window_height = window_start_y + current_height;	
}

if (mouse_check_button_released(mb_left)) {
	window_drag = false;	
	window_resize = false;
}
	
//Close Button
if (point_in_circle(mouse_x, mouse_y, window_width, window_start_y, 6)) {
	draw_circle(window_width, window_start_y, 5, false);
	if (mouse_check_button_released(mb_left)) {
		video_close();
		instance_destroy();
	}
} else {
	draw_circle(window_width, window_start_y, 5, true);	
}

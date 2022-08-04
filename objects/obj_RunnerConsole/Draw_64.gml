/// @description Draw Console Window
/*
//Window Background
if (global.activeRunner == id) && (global.selectedWindow == id) {
	draw_set_color(c_dkgray);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
	draw_roundrect(window_start_x-1, window_start_y-1, window_width+1, window_height+1, true);
	TextAlpha = 1;
} else {
	draw_set_color(c_dkgray);
	draw_set_alpha(0.7);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(0.7);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);	
	TextAlpha = 0.1;
}

//Text Lines
draw_set_color(c_white);
draw_set_font(fntConsole);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_alpha(TextAlpha);
var TextLines = array_length(Text_);

for (var i = 0 ; i < TextLines; i ++) {
	if (i <= round(window_height/35)) {
		var VSLineSize;
		var LineString = string_split_to_width(Text_[i], window_width-8, "#");
		VSLineSize = string_height_ext(string_hash_to_newline(LineString), -1, window_width-8);
		draw_text_ext(window_start_x+4, window_height - (i*VSLineSize) - 24, string_hash_to_newline(LineString), -1, window_width-8);
	}
}

//Command Line Rectangle
var VLineSize;
VLineSize = string_height_ext(string_hash_to_newline(Text_CurrentLine), -1, window_width);
draw_set_color(c_white);
//draw_rectangle(window_start_x, window_height, window_width, window_height - 26, true);

//Draw Command Line Text
draw_set_valign(fa_top);
draw_text_ext(window_start_x+4, window_height-VLineSize-4, Text_CurrentLine + lCursor, -1, window_width);


//Resize Anchor
draw_set_color(c_white);
draw_circle(window_width, window_height, 5, false);
if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 50)) {
	if (mouse_check_button(mb_left)) {
		window_width = mouse_x;
		window_height = mouse_y;
		current_width = window_width - window_start_x;
		current_height = window_height - window_start_y;
		window_width = clamp(window_width, min_window_width, 1280);
		window_height = clamp(window_height, min_window_height, 720);
	}
}
	
//Movement Anchor
draw_circle(window_start_x, window_start_y, 5, false);
if (mouse_check_button(mb_left) && (global.selectedWindow == id)) {
	if (point_in_circle(mouse_x, mouse_y, window_start_x, window_start_y, 50)) {
		window_start_x = floor(device_mouse_x_to_gui(0));
		window_start_y = floor(device_mouse_y_to_gui(0));
		window_width = window_start_x + current_width;
		window_height = window_start_y + current_height;
	}
}

//Closing
/*
if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(mouse_x, mouse_y, window_start_x, window_start_y, window_width, window_height)) {
		global.activeRunner = id;	
		global.selectedWindow = id;
	} else {
		global.activeRunner = noone;
		global.selectedWindow = noone;
	}
}
	

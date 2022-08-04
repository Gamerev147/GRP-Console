///@description

if (WIN_ACTIVE = id) {
	draw_set_color(c_dkgray);
	draw_set_alpha(0.95);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
} else {
	draw_set_color(c_dkgray);
	draw_set_alpha(0.75);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(7);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);	
}
	
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var titlex = (window_start_x + window_width)/2;
var titley = window_start_y + 16;

draw_set_color(c_green);
draw_text(titlex, titley, string(title));
	
//Draw Image
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (image != undefined) && (image != -1) {
	draw_sprite_stretched(image, 0, window_start_x+16, titley+8, current_width-16, current_height-16);
} else {
	draw_set_color(c_white);
	draw_text(window_start_x+16, titley+16, "Image not found. (" + string(image) + ")");	
}
	
//Resize Anchor
draw_set_color(obj_Console.Outline_Color);
draw_circle(window_width, window_height, 5, false);
if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 40)) {
	if (mouse_check_button(mb_left)) {
		if (window_width >= min_window_width) {
			if (window_height >= min_window_height) {
				window_width = mouse_x;
				window_height = mouse_y;
				current_width = window_width - window_start_x;
				current_height = window_height - window_start_y;
			} else { window_height = min_window_height; }
		} else { window_width = min_window_width; }
	}
}
	
//Movement Anchor
draw_circle(window_start_x, window_start_y, 5, false);
if (device_mouse_check_button(0, mb_left)) {
	if (point_in_circle(mouse_x, mouse_y, window_start_x, window_start_y, 40)) {
		x = floor(device_mouse_x_to_gui(0));
		y = floor(device_mouse_y_to_gui(0));
		window_width = window_start_x + current_width;
		window_height = window_start_y + current_height;
	}
}
	
//Close Button
if (point_in_circle(mouse_x, mouse_y, window_width, window_start_y, 6)) {
	draw_circle(window_width, window_start_y, 5, false);
	if (mouse_check_button_released(mb_left)) {
		sprite_delete(image);
		instance_destroy();
	}
} else {
	draw_circle(window_width, window_start_y, 5, true);	
}

/// @description 

tte_ext_input_draw();

//cancel button
if (point_in_rectangle(mouse_x, mouse_y, x+32, y+height-64, x+132, y+height-32)) {
	draw_set_color(c_white);
	draw_rectangle(x+32, y+height-64, x+132, y+height-32, false);	
	draw_set_color(c_dkgray);
	draw_text(x+36, y+height-60, "Cancel");
			
	if (mouse_check_button_released(mb_left)) {
		instance_destroy();	
	}
} else {
	draw_set_color(c_white);
	draw_rectangle(x+32, y+height-64, x+132, y+height-32, true);	
	draw_text(x+36, y+height-60, "Cancel");
}
		
//submit button
if (point_in_rectangle(mouse_x, mouse_y, x+164, y+height-64, x+264, y+height-32)) {
	draw_set_color(c_white);
	draw_rectangle(x+164, y+height-64, x+264, y+height-32, false);
	draw_set_color(c_dkgray);
	draw_text(x+168, y+height-60, "Submit");
			
	if (mouse_check_button_released(mb_left)) {
		tte_ext_input_save_tofile(bug_fname);
		alarm[0] = 10;
	}
} else {
	draw_set_color(c_white);
	draw_rectangle(x+164, y+height-64, x+264, y+height-32, true);
	draw_text(x+168, y+height-60, "Submit");
}


///@description Draw Text Editor

tte_ext_input_draw();

draw_set_alpha(1);
if (focus) {
    draw_set_color(obj_Console.Outline_Color);
    draw_rectangle( x, y, x+width, y+height, true );
}

//Save and Exit
if (point_in_circle(mouse_x, mouse_y, x+width, y, 5)) {
	draw_circle(x+width, y, 5, false);
	draw_set_font(fnt_Label);
	draw_text(x+width, y-16, "Save & Exit");
	if (mouse_check_button_pressed(mb_left)) {
		save_text_input(file_name);
	}
} else {
	draw_circle(x+width, y, 5, true);	
}


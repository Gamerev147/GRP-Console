/// @description Guest button

draw_set_alpha(alph);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_Label);

if (point_in_rectangle(mouse_x, mouse_y, x-50, y-10, x+50, y+10)) {
	draw_set_alpha(hover);
	draw_set_color(c_white);
	draw_rectangle(x-50, y-10, x+50, y+10, false);
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	draw_text(x, y, text);
	
	if (mouse_check_button_released(mb_left)) {
		fo = true;
		
		global.USER = "Guest";
		obj_LoginUsername.closing = true;
		obj_LoginUsername.image_speed = 0.9;
	
		var i = instance_create(0, 0, obj_Fade);
		i.target = "next";
	
		audio_play_sound(snd_Login, 1, false);
	}
} else {
	draw_set_color(c_white);
	draw_rectangle(x-50, y-10, x+50, y+10, true);
	draw_text(x, y, text);
}

draw_set_alpha(1);


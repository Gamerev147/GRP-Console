///@description Draw Name

draw_self();

if (global.USER_IMAGE != -1) {
	draw_sprite_stretched(global.USER_IMAGE, 0, room_width/2-60, room_height/2-60, 120, 120);	
} else {
	draw_set_font(fnt_Label_2);
	draw_set_color(c_white);
	draw_text(room_width/2, room_height/2, "No Image");
}

draw_set_font(fntLogin);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_green);
draw_text(room_width/2, room_height/2 + 96, "Access Granted");

draw_set_color(c_red);
draw_text(room_width/2, room_height/2 + 148, "Welcome back " + string(global.USER));

///@description Draw HUD

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_set_font(fntLogin);

draw_text(room_width/2, room_height/2, "Password");

draw_set_font(fnt_Password);
draw_sprite(spr_Login_Outside, image_index, room_width/2, room_height/2 + 52);
draw_sprite(spr_Login_Inside, image_index, room_width/2, room_height/2 + 52);
//draw_set_font(fntLoginText);
draw_text(x, y, string(input) + cursor);

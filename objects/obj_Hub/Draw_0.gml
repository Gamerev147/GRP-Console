/// @description Draw Hub Center

draw_self();

draw_set_color(obj_Console.Outline_Color);
draw_circle(room_width/2, room_height/2, 150, true);
draw_circle(x, y, 100, true);

draw_set_color(c_black);
draw_set_font(fnt_Label);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var tstr = "";
if (am) { tstr = "AM"; } else { tstr = "PM"; }
draw_text(x, y-8, string(hour) + ":" + string(minute) + " " + string(tstr));

if (show_date) {
	draw_text(x, y+16, string(global.date));
}

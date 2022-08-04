/// @description Init Drop Menu
depth = -999;

//Menu Items
drop_add_event(7, spr_settings, "Settings", noone, true);
drop_add_event(6, spr_file, "File Browser", noone, false);
drop_add_event(5, spr_add, "Add Runner", noone, false);
drop_add_event(4, noone, "Ali", noone, false);
drop_add_event(3, noone, "Network", noone, false);
drop_add_event(2, noone, "Browser", noone, false);
if (global.USER == "Guest") {
	drop_add_event(1, noone, "Create Account", noone, true);
} else {
	drop_add_event(1, noone, "Log Out", noone, true);	
}
drop_add_event(0, noone, "Core", noone, false);

//Styling
font =				fnt_Label_2;
back_color =		c_white;
border_color =		obj_Console.Outline_Color;
select_color =		c_white;
icon_color =		c_dkgray;
sep_color =			c_black;
text_color =		obj_Console.Text_SecondaryColor;

back_alpha = 0.1;
text_alpha = 0.8;
outline_alpha = 0.8;

max_width = 208;
item_padding = 6;
select_padding = 2;


//Built in variables, do not change
num = array_length_1d(option_text);

x_offset = 0;
y_offset = 0;
selected = noone;

item_height = font_get_size(font)+item_padding*2;
icon_width = item_height-item_padding*2;

//calculate offsets to keep box on screen
total_height = item_height*num;

if(x < __view_get( e__VW.XView, 0 ))
{
    x_offset = __view_get( e__VW.XView, 0 )-x+1;
}
else if(x + max_width > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WPort, 0 ))
{
    x_offset = (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ))-(x+max_width)+1;
}

if(y < __view_get( e__VW.YView, 0 ))
{
    y_offset = __view_get( e__VW.YView, 0 )-y+1;
}
else if(y + total_height > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HPort, 0 ))
{
    y_offset = -total_height;
}

x1 = x+x_offset;
x2 = x+max_width+x_offset;
ty1 = y+y_offset;
ty2 = y+total_height+y_offset;
total_icon_size = (icon_width+item_padding*2);

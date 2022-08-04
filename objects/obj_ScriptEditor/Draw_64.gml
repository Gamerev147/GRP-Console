///@description Draw Text Editor

tte_ext_input_draw();

draw_set_alpha(1);
if (focus) {
    draw_set_color(obj_Console.Outline_Color);
    draw_rectangle( x, y, x+width, y+height, true );
}


///@description Variables

global.CAN_TYPE = false;

window_width = 0;
window_height = 0;

max_window_width = 620;
max_window_height = 180;

window_start_x = display_get_gui_width()/2 - max_window_width/2;
window_start_y = display_get_gui_height()/2 - max_window_height/2;

animate = false;
animate_done = false;

keyboard_string = "";
input = "";
title = "Create a new username:";

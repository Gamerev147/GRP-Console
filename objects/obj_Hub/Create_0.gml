/// @description Init

show_date = false;

hour = current_hour;
minute = current_minute;
am = false;

scale = 1;
alpha = 1;
spd = 0.2;

//circular movement
cx = display_get_gui_width()/2;
cy = display_get_gui_height()/2;
r = 20;
theta = 0;
theta_speed = room_speed/600;

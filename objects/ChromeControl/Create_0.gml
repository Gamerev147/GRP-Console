/// @description Init Chromium

width = display_get_gui_width()-456;
height = display_get_gui_height()-32;

surf = undefined;
surf_raw = undefined;
surf_update = false;

buff = buffer_create(width*height*4, buffer_fixed, 1);

chromium_setup_bgtransparent();
chromium_create_test(width, height, room_speed, buffer_get_address(buff));
chromium_set_url("www.google.com/");

loaded = false;
lmb = false;
mmb = false;
rmb = false;

gui_url = "";
gui_can_back = false;
gui_can_forward = false;
gui_bg_fade = 0;

last_key = 0;


//tabs
currentTab = 0;

globalvar browserTabs, bdocky;
browserTabs = ds_list_create();
bdocky = 220;

alarm[1] = global.__sys_update_int;

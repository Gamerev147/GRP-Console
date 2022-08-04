///@description

// initialize vars
global._mouse_x = 0;
global._mouse_y = 0;
global.animation_speed = 0; // speed for animations
global.mouse_in_game_window = false; // is the mouse in the game window?
global.start_depth = -5000; // the start depth for the windows
global.inactive_instances = ds_list_create(); // stores inactive instances
global.window_order = ds_list_create(); // controls the order of the windows
global.mouse_in_window_map = ds_map_create(); // stores all windows which are hovered by the mouse
global.theme = ds_map_create(); // map which stores colours for the interface
//draw_set_colour(ds_map_find_value(global.theme, "font"));
global.text_height = string_height(string_hash_to_newline("Test")); // stores the height of the font

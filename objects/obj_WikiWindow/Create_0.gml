///@description Variables

window_start_x = x;
window_start_y = y;
window_width = 0;
window_height = 0;

min_window_width = 640;
min_window_height = 480;
max_window_width = 860;
max_window_height = 620;

animate = true;
animate_done = false;

title = "";
search_query = "";

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;

current_width = max_window_width;
current_height = max_window_height;

//Init Data Variables
wiki_init();

search=-1
result=-1 
limit=5 
firsttitle=""

content_get=-1 
cont=-1
content_key="opening_text"

pageimage=-1 
pageimage_get=-1 

sprite_get=-1
sprite=-1

alarm[0] = global.__sys_update_int;

audio_play_sound(snd_Notification, 1, false);

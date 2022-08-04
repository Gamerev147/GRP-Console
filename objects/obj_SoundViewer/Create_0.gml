/// @description Init Window

window_start_x = x;
window_start_y = y;
window_width = 0;
window_height = 0;

min_window_width = 540;
min_window_height = 240;
max_window_width = 640;
max_window_height = 240;

animate = false;
animate_done = false;

title = "";
snd = undefined;
playSnd = undefined;
sndPath = "";
sndLength = 0;
sndPosition = 0;
alarm[0] = 20;

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;

current_width = max_window_width;
current_height = max_window_height;

audio_play_sound(snd_Notification, 1, false);

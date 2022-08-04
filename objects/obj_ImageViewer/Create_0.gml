///@description Viewer Variables

window_start_x = x;
window_start_y = y;
window_drag = false;

min_window_width = 600;
min_window_height = 400;
max_window_width = 1280;
max_window_height = 720;

window_width = x + min_window_width;
window_height = y + min_window_height;

title = "";
image = undefined;
imagePath = "";
alarm[0] = 20;

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;

current_width = max_window_width;
current_height = max_window_height;

audio_play_sound(snd_Notification, 1, false);

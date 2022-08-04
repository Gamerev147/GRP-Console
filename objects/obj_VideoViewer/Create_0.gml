///@description Viewer Variables

window_start_x = x;
window_start_y = y;
window_drag = false;
window_resize = false;

min_window_width = 1280;
min_window_height = 720;
max_window_width = 1920;
max_window_height = 1080;

window_width = min_window_width;
window_height = min_window_height;

pmouse_x = 0;
pmouse_y = 0;

title = "Video Player: ";
video = undefined;
videoPath = "";
video_surface = undefined;
alarm[0] = 12;

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;

current_width = window_width - window_start_x;
current_height = window_height - window_start_y;
alarm[1] = 2;

audio_play_sound(snd_Notification, 1, false);

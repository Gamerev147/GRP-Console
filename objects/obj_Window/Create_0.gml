///@description Window Variables

//ID Tagging
ds_list_insert(WINDOWS, 0, id);
__nodock = true;

window_start_x = x;
window_start_y = y;
window_drag = false;

min_window_width = 600;
min_window_height = 400;
max_window_width = 1600;
max_window_height = 900;

window_width = min_window_width;
window_height = min_window_height;

pmouse_x = 0;
pmouse_y = 0;
mouse_in_window = false;

title = "";
text = "";
elements = ds_list_create();

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;
window_resize = false;

current_width = window_width - window_start_x;
current_height = window_height - window_start_y;

animate = true;
animate_done = false;

//Open Sound
if (global.SYSTEM_AUDIO) {
	var ns = audio_play_sound(snd_Notification, 1, false);
	audio_sound_gain(ns, 2, 0);
}

alarm[0] = 1;


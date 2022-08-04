/// @description Init

//ID Tagging
ds_list_add(RUNNERS, id);
__nodock = true;

//Window Sizing
window_start_x = x;
window_start_y = y;

min_window_width = 540;
min_window_height = 380;
max_window_width = 1200;
max_window_height = 700;

window_width = x + min_window_width;
window_height = y + min_window_height;

resize_anchor_x = max_window_width;
resize_anchor_y = max_window_height;

current_width = window_width - window_start_x;
current_height = window_height - window_start_y;

//Animation
animate = false;
animate_done = false;

window_resize = false;
window_drag = false;

//Title and Text
title = string(id);
text = "";

//Console Init
Text_ = "";
Text_[0] = "";
Text_DefText = obj_Console.Text_DefText;
Text_CurrentLine = "";
Text_LastLine[0] = Text_[0];
Text_Last = 0;
EraseTime = -1;
lCursor = "|";
lDelay = 15;
alarm[0] = lDelay;

//Style
TextAlpha = 1;
redraw_surface = false;

//KeyConfig
KFocus = vk_pageup;
KLast = vk_up;
KNext = vk_down;
KEnter = vk_enter;
KErase = vk_backspace;

RunnerLog("Runner ID: " + string(id), 0);
RunnerLog("[slant]Type 'close' to exit this runner.[/slant]", 0);

//Sound
if (global.SYSTEM_AUDIO) {
	audio_play_sound(snd_Notification, 1, false);
}

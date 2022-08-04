/// @description Hover

if (!instance_exists(obj_TextEditor2) && (!instance_exists(obj_VideoViewer))) {
	if (WIN_ACTIVE != noone) {
		if (!point_in_rectangle(mouse_x, mouse_y, WIN_ACTIVE.window_start_x, WIN_ACTIVE.window_start_y, WIN_ACTIVE.window_width, WIN_ACTIVE.window_height)) {
			if (scale != 0) { scale = 1.2; }
			show_date = true;
			if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Hub, 1, false); }
		}
	} else {
		if (scale != 0) { scale = 1.2; }
		show_date = true;
		if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Hub, 1, false); }
	}
}

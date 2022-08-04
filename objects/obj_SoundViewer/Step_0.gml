///@description Animate and Function

if (animate = true) {
	
	if (window_width < max_window_width) {
		window_width += 40;	
	}
	
	if (window_height < max_window_height) {
		window_height += 40;	
	}
	
}

if (window_width = max_window_width) {
	animate = false;	
	animate_done = true;
}

//Sound Position
if (playSnd != undefined) {
	sndPosition = audio_sound_get_track_position(playSnd);	
}

x = window_start_x;
y = window_start_y;

/// @description Chrome Step

// update cursor
var xx = mouse_x-x;
var yy = mouse_y-y;

//status
loaded = chromium_get_isloaded();
gui_url = chromium_get_url();
gui_can_back = chromium_get_can_back();
gui_can_forward = chromium_get_can_forward();

// send keystrokes (in a really hacky way, don't do this)
if(keyboard_key != last_key) {
	if(last_key != 0) {
	    chromium_event_keyboard(last_key, 0, false); // last key keyup
	}
	if(keyboard_key != 0) {
		chromium_event_keyboard(keyboard_key, scr_chromium_get_modifiers(), true);
		
		if(keyboard_key != vk_shift and keyboard_key != vk_control and keyboard_key != vk_alt) {
			chromium_event_keychar(ord(keyboard_lastchar));
		}
	}
	last_key = keyboard_key;
}

// cursor inside browser surface
if(point_in_rectangle(mouse_x, mouse_y, x, y, x+width, y+height)) {
	var mouse_event = false;
	
	// move mouse
	chromium_event_mousemove(xx, yy);
	
	// mouse press events
	if(mouse_check_button_pressed(mb_left)) {
		lmb = true;
		chromium_event_mousebutton(xx, yy, 0, true);
	}
	else if(mouse_check_button_released(mb_left)) {
		lmb = false;
		chromium_event_mousebutton(xx, yy, 0, false);
	}
	
	if(mouse_check_button_pressed(mb_middle)) {
		mmb = true;
		chromium_event_mousebutton(xx, yy, 1, true);
	}
	else if(mouse_check_button_released(mb_middle)) {
		mmb = false;
		chromium_event_mousebutton(xx, yy, 1, false);
	}
	
	if(mouse_check_button_pressed(mb_right)) {
		rmb = true;
		chromium_event_mousebutton(xx, yy, 2, true);
	}
	else if(mouse_check_button_released(mb_right)) {
		rmb = false;
		chromium_event_mousebutton(xx, yy, 2, false);
	}
	
	// TODO: keyboard stuff here
	
	// mouse wheel
	if(mouse_wheel_up()) {
		chromium_event_mousewheel(0, 100);	
	}
	else if(mouse_wheel_down()) {
		chromium_event_mousewheel(0, -100);
	}
	
	// recieve cursor
	window_set_cursor(scr_chromium_convert_cursor(chromium_get_cursor()));
	
}
else {
	window_set_cursor(cr_default);	
	
	// mouse release events that happen outside the window
	if(not mouse_check_button(mb_left) and lmb) {
		lmb = false;
		chromium_event_mousebutton(xx, yy, 0, false);
	}
	if(not mouse_check_button(mb_middle) and mmb) {
		mmb = false;
		chromium_event_mousebutton(xx, yy, 1, false);
	}
	if(not mouse_check_button(mb_right) and rmb) {
		rmb = false;
		chromium_event_mousebutton(xx, yy, 2, false);
	}
}

surf_update = chromium_step();

//manage requests
if (chromium_check_source()) {
	var str = chromium_get_source();
	var file_name = "index" + string(current_minute);
	
	var f = file_text_open_write(file_name);
	file_text_write_string(f, str);
	file_text_close(f);
	
	ConsoleLog(string(file_name) + "  created.", 0);
	ConsoleLog("Page source returned to file.", 0);
	ConsoleLog(" ", 0);
}



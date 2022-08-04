///@description Animate and Function

if (animate = true) {
	
	if (window_width < max_window_width) {
		window_width += 32;	
	}
	
	if (window_height < max_window_height) {
		window_height += 32;	
	}
	
}

if (window_width = max_window_width) {
	animate = false;	
	animate_done = true;
}

input = keyboard_string;

//CHECK FOR COMMAND
if (keyboard_check_pressed(vk_enter)) {
	
	buffer_seek(obj_Client.buffer, buffer_seek_start, 0);
	buffer_write(obj_Client.buffer, buffer_u8, CHAT);
	buffer_write(obj_Client.buffer, buffer_string, global.USER);
	buffer_write(obj_Client.buffer, buffer_string, input);

	network_send_packet(obj_Client.socket, obj_Client.buffer, buffer_tell(obj_Client.buffer));
	
	instance_destroy();
	global.CAN_TYPE = true;
	
}

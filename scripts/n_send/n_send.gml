///@description n_send(file)
function n_send(_fname) {

	if (file_exists(_fname)) {
		var file_string = file_text_read_all(_fname);
		
		if (instance_exists(obj_Server) || instance_exists(obj_Client)) {
			
			buffer_seek(obj_Client.buffer, buffer_seek_start, 0);
			buffer_write(obj_Client.buffer, buffer_u8, CHAT);
			buffer_write(obj_Client.buffer, buffer_string, global.USER);
			buffer_write(obj_Client.buffer, buffer_string, file_string);
			network_send_packet(obj_Client.socket, obj_Client.buffer, buffer_tell(obj_Client.buffer));
			audio_play_sound(snd_Readout, 1, false);
			
		}
		
	} else {
		ConsoleLog("No file named [" + string(_fname) + "] was found.", 0);
		audio_play_sound(snd_LoginFail, 1, false);
	}

}

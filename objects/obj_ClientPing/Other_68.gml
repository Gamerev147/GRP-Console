///@description Receive Data

var event_id = async_load[? "id"];

if (event_id == client) {
	
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	
	if (cmd == PING) {
		
		tt = buffer_read(buff, buffer_u32);
		
	}
	
}


//instance_destroy();

///@description Connection Handling

var event_id = async_load[? "id"];

if (event_id == server) {
	
	//Someone is connecting or disconnecting
	var type = async_load[? "type"];
	var sock = async_load[? "socket"];
	
	switch (type) {
		
		case network_type_connect:
			ds_list_add(sockets, sock);
		break;
		
		case network_type_disconnect:
			var index = ds_list_find_index(sockets, sock);
			ds_list_delete(sockets, index);
		break;
		
	}
	
	
} else {
	
	//Get data from other clients	
	var sock = async_load[? "id"];
	var buff = async_load[? "buffer"];
	
	var cmd = buffer_read(buff, buffer_u8);
	
	if (cmd == PING) {
		
		var ti = buffer_read(buff, buffer_u32);
		Time = ti;
		
		for (var i = 0; i < ds_list_size(sockets); i ++;) {
			
			var so = ds_list_find_value(sockets, i);
			buffer_seek(Buffer, buffer_seek_start, 0);
			buffer_write(Buffer, buffer_u8, PING);
			buffer_write(Buffer, buffer_u32, Time);
			
			network_send_packet(so, Buffer, buffer_tell(Buffer));
			
		}
		
	}
	
}

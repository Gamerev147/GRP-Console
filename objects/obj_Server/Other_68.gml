///@description Connection Handling

var event_id = async_load[? "id"];

if (event_id == server) {
	
	//Someone is connecting or disconnecting
	var type = async_load[? "type"];
	var sock = async_load[? "socket"];
	
	switch (type) {
		
		case network_type_connect:
			ds_list_add(sockets, sock);
			ds_map_add(clients, sock, noone);
			NetLog("Client joined the server.");
		break;
		
		case network_type_disconnect:
			var index = ds_list_find_index(sockets, sock);
			ds_list_delete(sockets, index);
			ds_map_delete(clients, sock);
			NetLog("A client has disconnected.");
		break;
		
	}
	
} else if (event_id == global.socket) {
	
	//Ignore	
	
} else {
	
	//Get data from other clients	
	var sock = async_load[? "id"];
	var buff = async_load[? "buffer"];
	
	var cmd = buffer_read(buff, buffer_u8);
	
	if (cmd == CHAT) {
		
		var na = buffer_read(buff, buffer_string);
		var ms = buffer_read(buff, buffer_string);
		
		for (var i = 0; i < ds_list_size(sockets); i ++;) {
			
			var so = ds_list_find_value(sockets, i);
			buffer_seek(stringBuffer, buffer_seek_start, 0);
			buffer_write(stringBuffer, buffer_u8, CHAT);
			buffer_write(stringBuffer, buffer_string, na);
			buffer_write(stringBuffer, buffer_string, ms);
			
			network_send_packet(so, stringBuffer, buffer_tell(stringBuffer));
			
		}
		
	}
	
}

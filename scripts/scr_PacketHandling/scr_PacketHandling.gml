///@description scr_PacketHandling()
function scr_PacketHandling() {

	//Read incoming data

	var pack_received = async_load[? "buffer"];
	buffer_seek(pack_received, buffer_seek_start, 0);

	var PACK_ID = buffer_read(pack_received, buffer_u8);

	switch (PACK_ID) {
	
		case 5:
	
			message = buffer_read(pack_received, buffer_string);
			NetLog(string(message));
			NetLog(" ");
		
			//Send Data to other Clients
			var buff = buffer_create(128, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_string, message);
		
			for (var i = 0; i < ds_list_size(clientList); i ++;) {
			
				network_send_packet(ds_list_find_value(clientList, i), buff, buffer_tell(buff));	
			
			}
		
		break;
		
	}



}

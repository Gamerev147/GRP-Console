///@description Receive Data

var event_id = async_load[? "id"];

if (event_id == socket) {
	
	var buff = async_load[? "buffer"];
	var cmd = buffer_read(buff, buffer_u8);
	
	if (cmd == CHAT) {
		
		var nam = buffer_read(buff, buffer_string);
		var mes = buffer_read(buff, buffer_string);
		
		ds_list_add(senders, nam);
		ds_list_add(messages, mes);
		
	}
	
}

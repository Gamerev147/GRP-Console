///@description n_dis_all()
function n_dis_all() {

	//Display all users connected to the server

	for (var i = 0; i < ds_list_size(obj_Client.senders); i ++) {
	
		name = ds_list_find_value(obj_Client.senders, i);
		ConsoleLog(string(name), 0);
	
	}



}

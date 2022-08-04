///@description n_dn_sever()
function n_dn_server() {

	//Disconnect from server

	if (instance_exists(obj_Client)) {
	
		network_destroy(obj_Client.socket);
		ConsoleLog("You have been disconnected from the server.", 0);
		ConsoleLog(" ", 0);
	
	} else {
	
		ConsoleLog("No active network connections to disconnect.", 0);
		ConsoleLog(" ", 0);
	
	}



}

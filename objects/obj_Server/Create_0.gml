///@description Create Server

port = global.SERVER_PORT;
max_cl = global.MAX_CL;

stringBuffer = buffer_create(256, buffer_fixed, 1);
server = network_create_server(network_socket_tcp, port, max_cl);

clients = ds_map_create();
sockets = ds_list_create();

//Check if server created
if (server < 0) {
	
	global.TAB = "MAIN";
	ConsoleLog("Error creating server.", 0);
	ConsoleLog(" ", 0);
	
	buffer_delete(stringBuffer);
	ds_map_destroy(clients);
	ds_list_destroy(sockets);
	
	instance_destroy();
	
} else {
	
	if (global.TAB != "NET") { global.TAB = "NET"; }
	
	NetLog("Server created!");
	NetLog(" ");
	
}

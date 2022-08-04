///@description Create Client

ip = global.CLIENT_IP;
port = global.CLIENT_PORT;

socket = network_create_socket(network_socket_tcp);
buffer = buffer_create(128, buffer_grow, 1);
connect = network_connect(socket, ip, port);

senders = ds_list_create();
messages = ds_list_create();

global.socket = socket;

if (socket < 0) {
	
	global.TAB = "MAIN";
	ConsoleLog("Error creating client connection.", 0);
	ConsoleLog(" ", 0);
	instance_destroy();
	
} else {
	
	if (global.TAB != "NET") { global.TAB = "NET"; }
	NetLog("Client created successfully!");
	NetLog(" ");
	
}

if (connect < 0) {
	
	global.TAB = "MAIN";
	ConsoleLog("Error connecting to server.", 0);
	ConsoleLog(" ", 0);
	instance_destroy();
	
} else {
	
	if (global.TAB != "NET") { global.TAB = "NET"; }
	
	var ib = instance_create(x, y, obj_PopupWindow);
	ib.text = "Command mode has been set to: " + string(global.TAB);
	ib.title = "-- System Alert --";
	ib.animate = true;
	
	NetLog("Connection to server established successfully!");
	NetLog(" ");
	
}

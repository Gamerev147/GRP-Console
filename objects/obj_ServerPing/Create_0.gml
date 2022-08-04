///@description Create Server

server = network_create_server(network_socket_tcp, 6510, 3);

Buffer = buffer_create(256, buffer_fixed, 1);

sockets = ds_list_create();

Time = 0;

//ConsoleLog("Getting network speed...", 0);
instance_create(x, y, obj_ClientPing);

///@description Create Client

client = network_create_socket(network_socket_tcp);
network_connect(client, "127.0.0.1", 6510);

buff = buffer_create(256, buffer_grow, 1);

tt = 0;

alarm[1] = 4;

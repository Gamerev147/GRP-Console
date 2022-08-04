///@description Disconnect

ConsoleLog("Client has been disconnected from server entry.", 0);
ConsoleLog(" ", 0);

network_destroy(socket);

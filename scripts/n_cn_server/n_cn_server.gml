///@description n_cn_server(ip, port)
function n_cn_server() {

	//instance_create(0, 0, obj_Client);
	var ci = instance_create(0, 0, obj_NetworkClientIP);
	ci.title = "Enter IP";
	ci.animate = true;
	ConsoleLog("Client creating...", 0);
	ConsoleLog(" ", 0);



}

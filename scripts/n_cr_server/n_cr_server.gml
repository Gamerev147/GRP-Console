///@description n_cr_server(port, max_cl, cl_port, cl_ip)
function n_cr_server() {

	//instance_create(0, 0, obj_Server);
	//instance_create(0, 0, obj_Client);
	ConsoleLog("Server creation started...", 0);
	ConsoleLog(" ", 0);

	var sp = instance_create(0, 0, obj_NetworkServerPort);
	sp.title = "Server Port";
	sp.animate = true;

}

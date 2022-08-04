
function CreateRunner(VarName) {

	var ur = runner();
	ds_map_add(VARMAP, string(VarName), ur);
	show_debug_message(string(ur) + " added to the VARMAP");

}

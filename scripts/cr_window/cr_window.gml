
function cr_window(_title) {

	var win = instance_create_layer(64, 64, "ui_layer", obj_Window);
	win.title = string(_title);
	win.text = "This is a test window.";
	


/*
	ef_init(100, 2080);
	var form = ef_add_form(0, 0, 480, 240, string(_title), true, -1, true);
	ef_add_text(form, 16, 16, "This is a test window.");
	
	ef_center(form);
	ef_show(form);
*/

}

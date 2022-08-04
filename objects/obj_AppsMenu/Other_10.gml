/// @description Event Action

switch (selected) {
	
	case 0:
		if (obj_Console.show_console != true) {
			obj_Console.show_console = true;	
		}
		obj_Console.Text_DefText = global.CURRENT_PATH + ">. ";
		obj_Console.Text_CurrentLine = "";
		instance_deactivate_object(ChromeControl);
				
		global.TAB = "MAIN";
	break;
	
	case 1:
		if (global.USER == "Guest") {
			var uc = instance_create_layer(0, 0, "ui_layer", obj_CreateUsername);
			uc.animate = true;
		} else {
			u_lo();	
		}
	break;
	
	case 2:
		obj_Console.show_console = false;
		global.TAB = "WEB";
		instance_activate_object(ChromeControl);
	break;
	
	case 3:
		obj_Console.show_console = false;
		instance_deactivate_object(ChromeControl);
		global.TAB = "NET";
		
		if (!instance_exists(obj_Client)) {
			NetLog("[c_red]No connection is active. No data will be transmitted.");	
		}
	break;
	
	case 4:
		instance_deactivate_object(ChromeControl);
		obj_Console.show_console = false;
		global.TAB = "ALI";
	break;
	
	case 5:
		runner();
	break;
	
	case 6:
		obj_SystemControl.alarm[2] = 10;
	break;
	
	case 7:
		obj_Console.alarm[10] = 10;
	break;
	
}

instance_destroy();

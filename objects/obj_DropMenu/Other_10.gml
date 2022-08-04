/// @description Event Action

switch (selected) {
	
	case 0:
		if (!instance_exists(obj_Settings) && (!instance_exists(obj_ef_control))) {
			instance_create_layer(0, 0, "ui_layer", obj_Settings);	
		} else if (instance_exists(obj_ef_control)) {
			instance_create_layer(0, 0, "ui_layer", obj_Settings);	
		}
	break;
	
	case 1:
		global.TAB = "SET";
	break;
	
	case 2:
		instance_destroy(); 
	break;
	
}

instance_destroy();

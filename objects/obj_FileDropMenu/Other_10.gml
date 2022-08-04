/// @description Event Action

switch (selected) {
	
	case 0:
		//file encryption
		
	break;
	
	case 1:
		//rename
		ds_map_add(VARMAP, "__current_rename", myfile_path);
		show_debug_message(myfile_path + "  was added to VARMAP.");
		obj_SystemControl.alarm[3] = 10;
	break;
	
	case 2:
		//delete
		del(myfile_path);
		obj_SystemControl.alarm[2] = 10;
	break;
	
	case 3:
		//edit
		open(myfile_path);
	break;
	
}

alarm[0] = 2;


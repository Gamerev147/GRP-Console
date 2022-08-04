///@description Get All Objects

global.OBJECT_NAMES = "";
global.OBJECT_ID = "";
global.OBJ_IND = 0;

with (all) {
	
	global.OBJECT_NAMES[global.OBJ_IND] = object_get_name(object_index);
	global.OBJECT_ID[global.OBJ_IND] = id;
	global.OBJ_IND += 1;
	
}

alarm[0] = global.__sys_update_int;

/// @description 

if (ds_map_exists(VARMAP, global.TextStringVar)) {
	ds_map_replace(VARMAP, global.TextStringVar, global.TextString);	
} else {
	ds_map_add(VARMAP, global.TextStringVar, global.TextString);	
}

obj_Console.Text_CurrentLine = "";
global.TextStringOnly = false;
instance_destroy();


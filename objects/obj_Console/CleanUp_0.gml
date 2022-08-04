/// @description 
if (Background_Image != undefined) {
	sprite_delete(Background_Image);
}

ds_map_destroy(AIDIC);
ds_map_destroy(AIRESP);
ds_map_destroy(VARMAP);
ds_map_destroy(global.database);
ds_list_destroy(RUNNERS);
ds_list_destroy(WINDOWS);
ds_list_destroy(RUNTIME_ERRORS);

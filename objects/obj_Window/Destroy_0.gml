/// @description Wipe Elements and Window

for (var d = 0; d < ds_list_size(elements); d++) {
	var de = ds_list_find_value(elements, d);
	with (de) {
		instance_destroy();	
	}
}

ds_list_delete(WINDOWS, ds_list_find_index(WINDOWS, id));
show_debug_message(string(id) + "removed from WINDOWS");
//ds_list_destroy(elements);

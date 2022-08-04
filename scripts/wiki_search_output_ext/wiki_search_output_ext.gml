
function wiki_search_output_ext() {

	var map = json_decode(argument[0]), result = ds_list_create();

	var globl = map[? "default"];

	for (var i = 0; i < ds_list_size(globl[| 1]); i++) {
	    var cmap = ds_map_create();
	    for(var j = 1; j < argument_count; j++)
	        if (globl[| j] != undefined) {
	            cmap[? argument[j]] = ds_list_find_value(globl[| j], i);
			}
	    ds_list_add(result, cmap);
	    ds_list_mark_as_map(result, i);
	}
	ds_map_destroy(map)

	return result;

}
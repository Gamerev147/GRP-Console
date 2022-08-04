function wiki_pageimage_decode(json) {

	var map = json_decode(json), normalized = map[? "normalized"];

	if (map[? "warnings"] != undefined) {
	    return -1;
	}

	var result = map[? "query"], output = ds_map_create();
	result = result[? "pages"]

	var cmap_key = ds_map_find_first(result), size = ds_map_size(result);

	for(var i=0; i<size; i++) {
	    var cmap = result[? cmap_key], nmap = ds_map_create();
    
	    ds_map_add_map(output, cmap[? "title"], nmap)
	    if (normalized != undefined) {
		    for(var j=0; j<ds_list_size(normalized); j++) {
		        if (ds_map_find_value(normalized[| j], "to") = cmap[? "title"]) {
		            ds_map_add_map(output, ds_map_find_value(normalized[| j], "from"), nmap)
		            break
		        }
			}
		}
    
	    nmap[? "pageid"] = cmap[? "pageid"]
    
	    var current_data = cmap[? "thumbnail"];
	    if (current_data != undefined) {
	        nmap[? "source"] = current_data[? "source"];
	        nmap[? "width"] = current_data[? "width"];
	        nmap[? "height"] = current_data[? "height"];  
	    }
    
	    var current_data=cmap[? "original"];
	    if (current_data != undefined) {
	        nmap[? "source"] = current_data[? "source"];
	        nmap[? "width"] = current_data[? "width"];
	        nmap[? "height"] = current_data[? "height"]   ;     
	    }
    
	    if (cmap[? "pageimage"] != undefined) {
	        nmap[? "pageimage"] = cmap[? "pageimage"];
	        nmap[? "status"] = 1;
	    } else {   
	        nmap[? "pageimage"] = "";
	        nmap[? "status"] = 0;
	    }
        
	    cmap_key = ds_map_find_next(result, cmap_key);
	}

	ds_map_destroy(map);
	return output;

}

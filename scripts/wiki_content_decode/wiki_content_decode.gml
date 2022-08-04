
function wiki_content_decode(json) {
	
	var map=json_decode(json), normalized=map[? "normalized"];

	if map[? "warnings"] != undefined
	    return -1

	var result=map[? "query"], output=ds_map_create();
	result=result[? "pages"]

	var cmap_key=ds_map_find_first(result), size=ds_map_size(result);

	for(var i=0; i<size; i++) {
	    var cmap=result[? cmap_key], nmap=ds_map_create();
    
	    ds_map_add_map(output, cmap[? "title"], nmap)
    
	    if normalized!=undefined
	    for(var j=0; j<ds_list_size(normalized); j++)
	        if ds_map_find_value(normalized[| j], "to")=cmap[? "title"]
	        {
	            ds_map_add_map(output, ds_map_find_value(normalized[| j], "from"), nmap)
	            break;
	        }
        
	    nmap[? "pageid"]=cmap[? "pageid"]
	    nmap[? "title"]=cmap[? "title"]
	    var cmap_s=ds_map_find_value(ds_list_find_value(cmap[? "cirrusdoc"], 0), "source");
	    nmap[? "opening_text"]=cmap_s[? "opening_text"]
	    nmap[? "auxiliary_text"]=cmap_s[? "auxiliary_text"]
	    nmap[? "language"]=cmap_s[? "language"]
	    nmap[? "text"]=cmap_s[? "text"]
    
	    cmap_key=ds_map_find_next(result, cmap_key)
	}

	ds_map_destroy(map)
	return output;

}

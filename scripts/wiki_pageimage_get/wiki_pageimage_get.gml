function wiki_pageimage_get(pimg, pgt, key) {
	return ds_map_find_value(pimg[? pgt], key);
}
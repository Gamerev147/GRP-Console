
function wiki_search(str, lim) {
	
	return wiki_get("action=opensearch&limit=" + string(lim) + "&search=" + string(str));

}

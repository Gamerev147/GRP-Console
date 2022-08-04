function wiki_pageimage() {
	return wiki_get("action=query&prop=pageimages&titles=" + argument0 + "&piprop=original|name");
}
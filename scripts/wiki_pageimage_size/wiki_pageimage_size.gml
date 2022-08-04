function wiki_pageimage_size(str, lim) {
	return wiki_get("action=query&prop=pageimages&titles=" + str + "&piprop=thumbnail|name&pithumbsize=" + string(lim));
}
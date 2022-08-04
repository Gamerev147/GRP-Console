
function wiki_get(args) {

	return http_get(global.wikip + "?" + args + "&format=json");

}
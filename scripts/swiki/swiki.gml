function swiki(_search) {

	var wiki = instance_create_layer(100, 100, "ui_layer", obj_WikiWindow);
	wiki.search_query = string(_search);

}

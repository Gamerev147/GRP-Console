function upload(_filepath) {
	
	var filePath = string(_filepath);
	
	var ufo = instance_create(x, y, obj_Upload);
	ufo.upload_file = filePath;

}


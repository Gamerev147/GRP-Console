
function open(_fname, _mode="") {
	
	if (string(_mode) != "-core" && string(_mode) != "-c") {
		var fname = global.PATH + string(_fname);
	} else {
		var fname = string(_fname);	
	}
	
	var FileExt = "";
	var shortName = string(_fname);
	
	if (_fname != "") {
		var ExtPos = string_pos(".", fname);
		FileExt = string_copy(fname, ExtPos+1, 4);
	}
	
	switch (FileExt) {
	
		case "":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
	
		case "txt":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "grp":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "ini":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "user":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "dat":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "json":
			var te = instance_create_layer(32, 32, "ui_layer", obj_TextEditor2);
			te.file_name = string(fname);
		break;
		case "png":
			varmap_add("__e_image__", string(fname));
			show_debug_message("__e_image__  *  " + string(fname));
			run("core/image_viewer.grp");
		break;
		case "jpg":
			varmap_add("__e_image__", string(fname));
			run("core/image_viewer.grp");
		break;
		case "gif":
			varmap_add("__e_image__", string(fname));
			run("core/image_viewer.grp");
		break;
		case "wav":
			ConsoleLog("File type currently unsupported.", 0, obj_RunnerConsole);
		break;
		case "mp3":
			ConsoleLog("File type currently unsupported.", 0, obj_RunnerConsole);
		break;
		case "ogg":
			var sv = instance_create_layer(96, 96, "ui_layer", obj_SoundViewer);
			sv.title = string(fname);
			sv.sndPath = fname;
			sv.animate = true;
		break;
		case "mp4":
		/*
			var vv = instance_create_layer(random(64), random(64), "ui_layer", obj_VideoViewer);
			vv.title = vv.title + shortName;
			vv.videoPath = string(fname);
			*/
			
			varmap_add("__e_video__", string(fname));
			run("core/video_viewer.grp");
		break;
	
	}
	
}

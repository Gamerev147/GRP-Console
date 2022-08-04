function fbrowse(_path="") {
	
	if (_path != "") && (_path != undefined) {
		var path = string(_path);
	} else {
		var path = global.PATH;
	}
	
	var winid = irandom(500);
	win = CreateWindow(string(path), string(winid), 720, 600);
	
	var sx = 32;
	var sy = 32;
	
	for (var f = file_find_first_ue(path + "*"); f != ""; f = file_find_next_ue()) {
		if (file_find_attributes_ue() & fa_directory) {
			show_debug_message(string(path));
			var is_script = string_get_file_ext(f);
			if (f != ".." && f != ".") && (is_script != "grp") {
				Win_AddIcon(win, sx, sy, string(f), "core/directory_icon.png", "fbrowse", (path + string(f) + "/"), "", "", "--h");
			} else if (is_script == "grp") {
				var icon_run_path = path + string(f) + "/" + string(f);
				show_debug_message("ICON PATH " + icon_run_path);
				Win_AddIcon(win, sx, sy, string(f), "core/script_icon.png", "run", path+string(f)+"/"+string(f));
			}
		} else {
			//var creationDate = string(filetime_access(path + "/" + f));
			//var fileSize = (string(file_find_size_ue()) + " B");
			var file_ext_pos = string_last_pos(".", f);
			var file_ext = string_copy(f, file_ext_pos, 4);
			if (file_ext == ".grp") {
				Win_AddIcon(win, sx, sy, string(f), "core/script_icon.png", "run", path+string(f));
			} else if (file_ext == ".png" || file_ext == ".jpg") {
				Win_AddIcon(win, sx, sy, string(f), "core/image_icon.png", "open", path+string(f), "-core");
			} else {
				Win_AddIcon(win, sx, sy, string(f), "core/document_icon.png", "open", path+string(f), "-core");
			}
		}
		
		if (f != ".." && f != ".") {
			if (sx <= (win.current_width)-76) {
				sx += 76;
			} else {
				sy += 96;
				sx = 36;
			}
		}
	}
	
	file_find_close_ue();
	
	ClearVar(win);

}


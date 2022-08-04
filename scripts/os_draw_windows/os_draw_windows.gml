function os_draw_windows() {
	
	//WINDOWS
	for (var i = ds_list_size(WINDOWS)-1; i >= 0; i --) {
		var window_idd = ds_list_find_value(WINDOWS, i);
	
		if (window_idd != 0) && (window_idd != undefined) {
			if (window_idd.__nodock = true) {
			with (window_idd) {
				if (WIN_ACTIVE == id) {
					if (global.__rounded_windows) {		//rounded windows
						/*
						draw_set_alpha(0.95);
						draw_set_color(decrease_color_rgb(obj_Console.Outline_Color));
						draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
						draw_set_alpha(1);
						draw_set_color(obj_Console.Outline_Color);
						draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
						draw_roundrect(window_start_x-1, window_start_y-1, window_width+1, window_height+1, true);
						*/
						draw_sprite_stretched_ext(spr_WindowRound, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 1);
					} else {	//square windows
						/*
						draw_set_alpha(0.95);
						draw_set_color(decrease_color_rgb(obj_Console.Outline_Color));
						draw_rectangle(window_start_x, window_start_y, window_width, window_height, false);
						draw_set_alpha(1);
						draw_set_color(obj_Console.Outline_Color);
						draw_sprite_stretched_ext(sprBorder, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.8);
						draw_sprite_stretched_ext(sprBorder, 0, window_start_x-1, window_start_y-1, current_width+1, current_height+1, obj_Console.Outline_Color, 0.8);
						*/
						draw_sprite_stretched_ext(spr_Window, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 1);
					}
				} else {
					if (global.__rounded_windows) {		//rounded windows
						/*
						draw_set_alpha(0.6);
						draw_set_color(merge_color(make_color_rgb(27, 27, 27), obj_Console.Outline_Color, 0.5));
						draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
						draw_set_alpha(0.8);
						draw_set_color(obj_Console.Outline_Color);
						draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
						draw_roundrect(window_start_x-1, window_start_y-1, window_width+1, window_height+1, true);
						*/
						draw_sprite_stretched_ext(spr_WindowRound, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.5);
					} else {	//square windows
						/*
						draw_set_alpha(0.6);
						draw_set_color(merge_color(make_color_rgb(27, 27, 27), obj_Console.Outline_Color, 0.5));
						draw_rectangle(window_start_x, window_start_y, window_width, window_height, false);
						draw_set_alpha(0.8);
						draw_set_color(obj_Console.Outline_Color);
						draw_sprite_stretched_ext(sprBorder, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.8);
						draw_sprite_stretched_ext(sprBorder, 0, window_start_x-1, window_start_y-1, current_width+1, current_height+1, obj_Console.Outline_Color, 0.8);
						*/
						draw_sprite_stretched_ext(spr_Window, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.5);
					}
				}
	
				draw_set_valign(fa_middle);
				draw_set_halign(fa_center);
				var titlex = (window_start_x + window_width)/2;
				var titley = window_start_y + 12;

				draw_set_alpha(1);
				draw_set_color(c_dkgray);
				draw_set_font(fnt_Label_2);
				draw_text(titlex, titley, string(title));
	
				draw_set_halign(fa_left);
				draw_set_color(c_ltgray);
				draw_set_font(fnt_Label);
				draw_text_ext(window_start_x + 16, titley + 32, string_hash_to_newline(text), -1, window_width-16);
			
				//Draw Elements
				for (var k = 0; k < ds_list_size(elements); k++) {
					var element_id = ds_list_find_value(elements, k);
				
					with (element_id) {
						switch (_type) {
							case "text":
								scribble_draw(_parent.x + _x, _parent.y + _y, _text);	
							break;
							case "image":
								if (_image != undefined) && (_image != -1) {
									draw_sprite_stretched(_image, 0, _parent.x + _x, _parent.y + _y, _image_width, _image_height);	
								}
							break;
							case "video":
								if (_video != -1) {
									var _video_data = video_draw();
									var _video_status = _video_data[0];
									if (_video_status == 0) {
										var _video_surf = _video_data[1];
										draw_surface_stretched(_video_surf, _parent.x + _x, _parent.y + _y, _video_width, _video_height);
									}
								}
							break;
							case "embedded_video":
								if (_video != -1) {
									var _video_data = video_draw();
									var _video_status = _video_data[0];
									if (_video_status == 0) {
										var _video_surf = _video_data[1];
										draw_surface_stretched(_video_surf, _parent.x+_x, _parent.y+_y, _parent.current_width-64, _parent.current_height-64);
									}	
								}
							break;
							case "embedded_image":
								if (_image != undefined) && (_image != -1) {
									draw_sprite_stretched(_image, 0, _parent.x+_x, _parent.y+_y, _parent.current_width-64, _parent.current_height-64);	
								}
							break;
							case "icon":
								if (_icon_image != undefined) && (_icon_image != -1) {
									draw_sprite_stretched(_icon_image, 0, _parent.x+_x, _parent.y+_y, 64, 64);
									draw_set_color(c_dkgray);
									draw_set_font(fnt_Label_1);
									draw_set_valign(fa_top);
									if (_icon_display_fullname) {
										var distxt = string_split_to_width(_icon_name, 12, "\n")
										draw_text(_parent.x+_x, (_parent.y+_y)+72, distxt);
									} else {
										draw_text(_parent.x+_x, (_parent.y+_y)+72, string_copy(_icon_name, 1, 10));	
									}
									if (point_in_rectangle(mouse_x, mouse_y, _parent.x+_x, _parent.y+_y, _parent.x+_x+64, _parent.y+_y+64) && WIN_ACTIVE == _parent) && (!instance_exists(obj_FileDropMenu)) {
										//outline
										draw_set_color(c_dkgray);
										draw_rectangle(_parent.x+_x, _parent.y+_y, _parent.x+_x+64, _parent.y+_y+64, true);	
										draw_rectangle(_parent.x+_x+1, _parent.y+_y+1, _parent.x+_x+65, _parent.y+_y+65, true);	
										
										//full name
										_icon_display_fullname = true;
										
										//left click
										if (mouse_check_button_released(mb_left) && (!instance_exists(obj_FileDropMenu))) {
											if (script_exists(asset_get_index(_icon_pointer))) {
												script_execute_ext(asset_get_index(_icon_pointer), _icon_arguments);
											} else if (file_exists(_icon_pointer)) {
												run(_icon_pointer);	
											} else {
												ds_list_add(RUNTIME_ERRORS, "Icon pointer (" + string(_icon_pointer) + ") was not found.");	
											}
										}
										
										//right click
										if (mouse_check_button_released(mb_right)) {
											if (!instance_exists(obj_FileDropMenu)) {
												var fd = instance_create_layer(_parent.x+_x, _parent.y+_y+64, "ui_layer", obj_FileDropMenu);
												fd.myfile_path = _icon_arguments[0];
											}
										}
									} else { _icon_display_fullname = false; }
									
									draw_set_valign(fa_middle);
								}
							break;
							case "button":
								var bbx = (_parent.x+_x);
								var bby = (_parent.y+_y);
								var bbw = (_parent.x+_x+_button_width);
								var bbh = (_parent.y+_y+_button_height);
								var bbs = string(_button);
								var button_center = (bbw - (_button_width/2));
							
								if (point_in_rectangle(mouse_x, mouse_y, bbx, bby, bbw, bbh) && (WIN_ACTIVE == _parent)) {
									draw_set_color(c_dkgray);
									if (global.__rounded_elements) {
										draw_roundrect(bbx, bby, bbw, bbh, false);
									} else {
										draw_rectangle(bbx, bby, bbw, bbh, false);	
									}
									draw_set_halign(fa_center);
									draw_set_color(c_white);
									draw_set_font(fnt_Label);
									draw_text(button_center, bby+(_button_height/2), _button);
									draw_set_halign(fa_left);
								
									if (mouse_check_button_released(mb_left)) {
										if (script_exists(asset_get_index(_button_action))) {
											script_execute_ext(asset_get_index(_button_action), _button_arguments);
										} else if (file_exists(_button_action)) {
											show_debug_message("running button event...");
											run(_button_action);
										} else {
											ds_list_add(RUNTIME_ERRORS, "Button script or dependency not found.");	
										}
									}
								} else {
									draw_set_color(c_dkgray);
									if (global.__rounded_elements) {
										draw_roundrect(bbx, bby, bbw, bbh, true);
									} else {
										draw_rectangle(bbx, bby, bbw, bbh, true);	
									}
									draw_set_color(c_dkgray);
									draw_set_font(fnt_Label);
									draw_set_halign(fa_center);
									draw_text(button_center, bby+(_button_height/2), bbs);
									draw_set_halign(fa_left);
								}
							break;
							case "input":
								var ibx = (_parent.x + _x);
								var iby = (_parent.y + _y);
								var ibw = (_parent.x + _x + _input_width);
								var ibh = (_parent.y + _y + _input_height);
							
								if (_input_selected) && (WIN_ACTIVE == _parent) {
									_input = keyboard_string;
								}
							
								if (point_in_rectangle(mouse_x, mouse_y, ibx, iby, ibw, ibh) && (WIN_ACTIVE == _parent)) {
									if (mouse_check_button_released(mb_left)) {
										if (_input != "") {
											_input_selected = !_input_selected;	
											global.CAN_TYPE = !global.CAN_TYPE;
										} else {
											_input_selected = !_input_selected;	
											global.CAN_TYPE = !global.CAN_TYPE;
											keyboard_string = "";
										}
									}
								}
							
								draw_set_color(c_dkgray);
								draw_set_font(fnt_Label);
								draw_set_halign(fa_left);
								draw_set_valign(fa_middle);
								
								if (global.__rounded_elements) {
									draw_roundrect(ibx, iby, ibw, ibh, true);
								} else {
									draw_rectangle(ibx, iby, ibw, ibh, true);	
								}
								draw_set_color(c_dkgray);
								draw_text(ibx + 4, iby + ((ibh-iby)/2), string(_input) + string(_curs));
							break;
							case "dropdown":
								var dsx = (_parent.x + _x);
								var dsy = (_parent.y + _y);
								var dex = (_parent.x + _x + _drop_width);
								var dey = (_parent.y + _y + _drop_height);
								var dsyy = dsy+28;
								var deyy = dsyy+20;
							
								draw_set_color(c_dkgray);
								draw_set_font(fnt_Label);
								if (point_in_rectangle(mouse_x, mouse_y, dsx, dsy, dex, dey) && (WIN_ACTIVE == _parent)) {
									if (global.__rounded_elements) { 
										draw_roundrect(dsx, dsy, dex, dey, false); 
									} else {
										draw_rectangle(dsx, dsy, dex, dey, false);
									}
									draw_set_color(c_white);
									draw_text(dsx+8, dsy+10, "> " + string(_drop_title) + " <");
									
									if (mouse_check_button_released(mb_left)) {
										show_drop = !show_drop;
									}
								} else {
									if (global.__rounded_elements) { 
										draw_roundrect(dsx, dsy, dex, dey, true); 
									} else {
										draw_rectangle(dsx, dsy, dex, dey, true);
									}
									draw_set_color(c_dkgray);
									draw_text(dsx+8, dsy+10, "> " + string(_drop_title) + " <");
								}
							
								if (show_drop) {
									//draw_set_color(c_gray);
									//draw_roundrect(dsx, dsy+_drop_height+4, dex, dey+120, false);
									draw_set_color(c_dkgray);
									draw_set_alpha(1);
									for (var m = ds_map_find_first(_drop_options); !is_undefined(m); m = ds_map_find_next(_drop_options, m)) {
										var v = _drop_options[? m];
									
										if (!point_in_rectangle(mouse_x, mouse_y, dsx, dsyy, dex, deyy)) {
											draw_set_color(c_dkgray);
											if (global.__rounded_elements) { draw_roundrect(dsx+1, dsyy, dex-1, deyy, true); } else {
												draw_rectangle(dsx+1, dsyy, dex-1, deyy, true);
											}
											draw_text(dsx+8, dsyy+8, string(m));
										} else if (point_in_rectangle(mouse_x, mouse_y, dsx, dsyy, dex, deyy) && WIN_ACTIVE == _parent) {
											draw_set_color(c_dkgray);
											if (global.__rounded_elements) { draw_roundrect(dsx+1, dsyy, dex-1, deyy, false); } else {
												draw_rectangle(dsx+1, dsyy, dex-1, deyy, false);	
											}
											draw_set_color(c_white);
											draw_text(dsx+8, dsyy+10, string(m));
										
											//execute the pointer or script for the option
											if (mouse_check_button_released(mb_left)) {
												if (file_exists(string(v[0]))) {
													run(string(v[0]));	
												} else if (script_exists(asset_get_index(string(v[0])))) {
													script_execute(asset_get_index(string(v[0])), v[1], v[2]);	
												} else {
													ds_list_add(RUNTIME_ERRORS, string(v) + " dependency or script was not found.");
												}
												show_drop = !show_drop;
											}
										}
									
										dsyy += 23;
										deyy = dsyy + 20;
									}
									draw_set_alpha(1);
								}
							break;
							case "line":
								var lsx = (_parent.x + _line_sx);
								var lsy = (_parent.y + _line_sy);
								var lex = (_parent.x + _line_ex);
								var ley = (_parent.y + _line_ey);
							
								draw_set_color(_line_color);
								draw_line(lsx, lsy, lex, ley);
							break;
							case "rectangle":
								var rsx = (_parent.x + _rec_sx);
								var rsy = (_parent.y + _rec_sy);
								var rex = (_parent.x + _rec_ex);
								var rey = (_parent.y + _rec_ey);
								var rec_fill = real(_rec_fill);
							
								draw_set_color(_rec_color);
								draw_rectangle(rsx, rsy, rex, rey, rec_fill);
							break;
							case "circle":
								var csx = (_parent.x + _cir_x);
								var csy = (_parent.y + _cir_y);
								var cir_col = _cir_color;
								var cir_radius = _cir_rad;
								var cir_fill = _cir_fill;
							
								draw_set_color(cir_col);
								draw_circle(csx, csy, cir_radius, cir_fill);
							break;
						}
					}
				}
	
				//Resize Anchor
				draw_set_color(c_dkgray);
				draw_circle(window_width, window_height, 5, false);
				if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 10) && (WIN_ACTIVE == id)) {
					draw_text(window_width + 16, window_height, "Resize");
					if (mouse_check_button(mb_left) && (!window_drag)) {
						window_resize = true;
					}
				}
			
				if (window_resize) {
					window_width = mouse_x;
					window_height = mouse_y;
					current_width = window_width - window_start_x;
					current_height = window_height - window_start_y;
					
					current_width = clamp(current_width, min_window_width, max_window_width);
					current_height = clamp(current_height, min_window_height, max_window_height);
					window_width = clamp(window_width, x+min_window_width, x + max_window_width);
					window_height = clamp(window_height, y+min_window_height, y + max_window_height);
				}
			
				//Dock Anchor
				if (point_in_circle(mouse_x, mouse_y, window_start_x+8, window_start_y+8, 6) && WIN_ACTIVE == id) {
					draw_set_color(c_dkgray);
					draw_circle(window_start_x+8, window_start_y+8, 5, false);
					draw_text(window_start_x+16, window_start_y+8, "Dock");
					if (mouse_check_button_released(mb_left)) {
						if (!window_resize) {
							var check_win=0, check_winval=0;
							do {
								check_win = ds_list_find_value(WINDOWS, check_winval);
								check_winval ++;
							} until (check_win != id);
							
							var nd = instance_create_layer(-200, docky, layer, obj_WindowTab);
							nd.title = title;
							nd.my_app = id;
						
							__nodock = false;
							ds_list_add(dock_apps, nd);
							
							if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Click, 1, false); }
						}
					}
				} else {
					draw_set_color(c_dkgray);
					draw_circle(window_start_x+8, window_start_y+8, 5, true);
				}
	
				//Movement Anchor
				//draw_circle(window_start_x, window_start_y, 5, false);
				if (point_in_rectangle(mouse_x, mouse_y, window_start_x, window_start_y, window_width, window_start_y+22) && (WIN_ACTIVE == id)) {
					draw_set_color(c_dkgray);
					//draw_text(window_start_x, window_start_y, "Relocate");
					if (mouse_check_button(mb_left) && (!window_resize) && (!window_drag)) {
						pmouse_x = window_start_x - mouse_x;
						pmouse_y = window_start_y - mouse_y;
						window_drag = true;
					}
				}
			
				if (window_drag) {
					//window_start_x = mouse_x;
					//window_start_y = mouse_y;
					window_start_x = mouse_x + pmouse_x;
					window_start_y = mouse_y + pmouse_y;
					
					window_width = window_start_x + current_width;
					window_height = window_start_y + current_height;	
				}
				
				if (point_in_rectangle(mouse_x, mouse_y, self.window_start_x, self.window_start_y, self.current_width, self.current_height)) {
					mouse_in_window = true;	
				} else {
					mouse_in_window = false;	
				}
	
				//Close Button
				if (point_in_circle(mouse_x, mouse_y, window_width-10, window_start_y+8, 6) && (WIN_ACTIVE == id)) {
					draw_circle(window_width-10, window_start_y+8, 5, false);
					draw_text(window_width+8, window_start_y+8, "Exit");
					if (mouse_check_button_released(mb_left)) {
						if (!window_resize) {
							if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Click, 1, false); }
							instance_destroy();
						}
					}
				} else {
					draw_circle(window_width-10, window_start_y+8, 5, true);
				}
			
				//Stop resize and drag
				if (mouse_check_button_released(mb_left)) {
					window_drag = false;	
					window_resize = false;
				}
			
				//Debug
				if (obj_Console.Debug) {
					draw_set_color(c_red);
					draw_set_font(fnt_Label);
					draw_text(window_width+8, window_height, "ID: " + string(window_idd) + "\n" + string(window_start_x) + "\n" + 
					string(window_start_y) + "\n" + string(current_width) + "\n" + string(current_height) + "\n\n" + 
					string(window_width) + "\n" + string(window_height));
				}
			
			} //end with()
			} //end if noDock=true
		} else {
			show_debug_message("window not stored.");	
		}
	}

}
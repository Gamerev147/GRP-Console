function os_draw_runners(){

	//RUNNERS
	for (var j = ds_list_size(RUNNERS)-1; j >= 0; j --) {
		var runner_idd = ds_list_find_value(RUNNERS, j);
	
		if (runner_idd != 0) && (runner_idd != undefined) {
			if (runner_idd.__nodock = true) {
				with (runner_idd) {
					if (RUN_ACTIVE == id) {
						if (global.__rounded_windows) {
							draw_set_alpha(0.95);
							draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.8));
							draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
							draw_set_alpha(1);
							draw_set_color(obj_Console.Outline_Color);
							draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
							draw_roundrect(window_start_x-1, window_start_y-1, window_width+1, window_height+1, true);
						} else {
							draw_set_alpha(0.95);
							draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.8));
							draw_rectangle(window_start_x, window_start_y, window_width, window_height, false);
							draw_set_alpha(1);
							draw_set_color(obj_Console.Outline_Color);
							draw_sprite_stretched_ext(sprBorder, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.8);
							draw_sprite_stretched_ext(sprBorder, 0, window_start_x-1, window_start_y-1, current_width+1, current_height+1, obj_Console.Outline_Color, 0.8);
						}
					} else {
						if (global.__rounded_windows) {
							draw_set_alpha(0.7);
							draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.9));
							draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
							draw_set_alpha(0.9);
							draw_set_color(obj_Console.Outline_Color);
							draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);
							draw_roundrect(window_start_x-1, window_start_y-1, window_width+1, window_height+1, true);
						} else {
							draw_set_alpha(0.7);
							draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.9));
							draw_rectangle(window_start_x, window_start_y, window_width, window_height, false);
							draw_set_alpha(0.9);
							draw_set_color(obj_Console.Outline_Color);
							draw_sprite_stretched_ext(sprBorder, 0, window_start_x, window_start_y, current_width, current_height, obj_Console.Outline_Color, 0.8);
							draw_sprite_stretched_ext(sprBorder, 0, window_start_x-1, window_start_y-1, current_width+1, current_height+1, obj_Console.Outline_Color, 0.8);
						}
					}
					TextAlpha = 1;

					//Text Lines
					draw_set_color(c_white);
					draw_set_font(fntConsole);
					draw_set_halign(fa_left);
					draw_set_valign(fa_bottom);
					draw_set_alpha(TextAlpha);
					var TextLines = array_length(Text_);

					for (var i = 0 ; i < TextLines; i ++) {
						if (i <= round(window_height/32)) {
							var VSLineSize;
							var LineString = string_split_to_width(Text_[i], 200, "#");
							VSLineSize = string_height(string_hash_to_newline(LineString));
							scribble_draw(window_start_x+4, (window_height-48) - (i*VSLineSize), string_hash_to_newline(LineString));
						}
					}

					//Command Line Rectangle
					var VLineSize;
					VLineSize = string_height_ext(string_hash_to_newline(Text_CurrentLine), -1, window_width);
					draw_set_color(c_white);

					//Draw Command Line Text
					draw_set_valign(fa_top);
					draw_text_ext(window_start_x+4, window_height-VLineSize-4, Text_CurrentLine + lCursor, -1, window_width);


					//Resize Anchor
					draw_set_color(obj_Console.Outline_Color);
					draw_circle(window_width, window_height, 5, false);
					if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 10)) {
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
	
					//Movement Anchor
					draw_circle(window_start_x, window_start_y, 5, false);
					if (point_in_circle(mouse_x, mouse_y, window_start_x, window_start_y, 20)) {
						draw_text(window_start_x, window_start_y-16, "Relocate");
						if (mouse_check_button(mb_left) && (!window_resize)) {
							window_drag = true;
						}
					}
			
					if (window_drag) {
						window_start_x = mouse_x;
						window_start_y = mouse_y;
						window_width = window_start_x + current_width;
						window_height = window_start_y + current_height;	
					}
			
					//Dock Anchor
					if (point_in_circle(mouse_x, mouse_y, window_start_x, window_height, 6)) {
						draw_circle(window_start_x, window_height, 5, false);
						draw_text(window_start_x, window_height+16, "Dock");
						if (mouse_check_button_released(mb_left)) {
							if (!window_drag && !window_resize) {
								if (RUN_ACTIVE == id) {
									RUN_ACTIVE = noone;	
								}
							
								var nd = instance_create_layer(-200, docky, layer, obj_WindowTab);
								nd.title = "Runner " + string(id);
								nd.my_app = id;
						
								__nodock = false;
								ds_list_add(dock_apps, nd);
							
								if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Click, 1, false); }
							}
						}
					} else {
						draw_circle(window_start_x, window_height, 5, true);
					}
			
					//Stop resize and drag
					if (mouse_check_button_released(mb_left)) {
						window_drag = false;	
						window_resize = false;
					}
				}
			}
		}
	}

}


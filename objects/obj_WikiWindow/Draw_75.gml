///@description

if ((animate = true) || (animate_done = true)) {

	draw_set_color(c_dkgray);
	draw_set_alpha(0.8);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, false);
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_roundrect(window_start_x, window_start_y, window_width, window_height, true);

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var titlex = (window_start_x + window_width)/2;
	var titley = window_start_y + 16;

	var str = "";
	draw_set_color(c_green);
	draw_text(titlex, titley, string(title));
	
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_font(fntConsole);
	
	//Image
	if (sprite != -1) {
		draw_sprite_stretched(sprite, -1, window_start_x+32, titley+32, 240, 240);	
	}
	
	//Load Page
	if (search = -1) { //if the search isn't loading
		if (result != -1) { //if there is a page
			for(i=0; i<ds_list_size(result); i++) // draw list of result
	        {
	            var m=result[| i], X=10, Y=40+i*30, t=m[? "title"];
	            draw_set_colour(c_white)
	            if point_in_rectangle(mouse_x, mouse_y, X, Y, X+string_width(t), Y+string_height(t))
	            {
	                draw_set_colour(c_black)
	                str="description: \n" + m[? "description"]
	                draw_text_ext(400, 50, str, -1, 500)
	                if cont!=-1
	                    draw_text_ext(400, 60+string_height_ext(str, -1, 500), content_key+":\n"+string(wiki_content_get(cont, t, content_key)), -1, 500)
                
	                if mouse_check_button_pressed(mb_left)
	                    url_open(m[? "link"])
	            }
            
	            draw_text(X, Y, t) // draw title of page
	        }
		}
	} else {
		draw_text(window_start_x+32, titley+64, "Loading...");	
	}
	
	//Resize Anchor
	draw_set_color(obj_Console.Outline_Color);
	draw_circle(window_width, window_height, 5, false);
	if (point_in_circle(mouse_x, mouse_y, window_width, window_height, 40)) {
		if (mouse_check_button(mb_left)) {
			if (window_width >= min_window_width) {
				if (window_height >= min_window_height) {
					window_width = mouse_x;
					window_height = mouse_y;
					current_width = window_width - window_start_x;
					current_height = window_height - window_start_y;
				} else { window_height = min_window_height; }
			} else { window_width = min_window_width; }
		}
	}
	
	//Movement Anchor
	draw_circle(window_start_x, window_start_y, 5, false);
	if (device_mouse_check_button(0, mb_left)) {
		if (point_in_circle(mouse_x, mouse_y, window_start_x, window_start_y, 40)) {
			window_start_x = floor(device_mouse_x_to_gui(0));
			window_start_y = floor(device_mouse_y_to_gui(0));
			window_width = window_start_x + current_width;
			window_height = window_start_y + current_height;
		}
	}
	
	//Close Button
	if (point_in_circle(mouse_x, mouse_y, window_width, window_start_y, 6)) {
		draw_circle(window_width, window_start_y, 5, false);
		if (mouse_check_button_released(mb_left)) {
			instance_destroy();
		}
	} else {
		draw_circle(window_width, window_start_y, 5, true);
	}

}
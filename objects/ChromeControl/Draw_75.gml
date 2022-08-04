/// @description Draw Browser

//GUI Elements
draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_font(fnt_Label);

#region Backward
if (point_in_rectangle(mouse_x, mouse_y, display_get_gui_width()-208, 16, display_get_gui_width()-110, 36)) {
	draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.5));
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 16, display_get_gui_width()-110, 36, false);
	} else {
		draw_rectangle(display_get_gui_width()-208, 16, display_get_gui_width()-110, 36, false);
	}
	draw_set_color(obj_Console.Outline_Color);
	draw_text(display_get_gui_width()-192, 26, "Backward");
	if (mouse_check_button_released(mb_left) && (gui_can_back)) {
		chromium_back();
	}
} else {
	draw_set_color(obj_Console.Outline_Color);
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 16, display_get_gui_width()-110, 36, true);	
	} else {
		draw_rectangle(display_get_gui_width()-208, 16, display_get_gui_width()-110, 36, true);	
	}
	draw_text(display_get_gui_width()-192, 26, "Backward");
}
#endregion

#region Forward
if (point_in_rectangle(mouse_x, mouse_y, display_get_gui_width()-104, 16, display_get_gui_width()-16, 36)) {
	draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.5));
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-104, 16, display_get_gui_width()-16, 36, false);	
	} else {
		draw_rectangle(display_get_gui_width()-104, 16, display_get_gui_width()-16, 36, false);	
	}
	draw_set_color(obj_Console.Outline_Color);
	draw_text(display_get_gui_width()-88, 26, "Forward");
	if (mouse_check_button_released(mb_left) && (gui_can_forward)) {
		chromium_forward();
	}
} else {
	draw_set_color(obj_Console.Outline_Color);
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-104, 16, display_get_gui_width()-16, 36, true);	
	} else {
		draw_rectangle(display_get_gui_width()-104, 16, display_get_gui_width()-16, 36, true);	
	}
	draw_text(display_get_gui_width()-88, 26, "Forward");
}
#endregion

#region Reload
if (point_in_rectangle(mouse_x, mouse_y, display_get_gui_width()-208, 48, display_get_gui_width()-16, 68)) {
	draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.5));
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 48, display_get_gui_width()-16, 68, false);
	} else {
		draw_rectangle(display_get_gui_width()-208, 48, display_get_gui_width()-16, 68, false);	
	}
	draw_set_color(obj_Console.Outline_Color);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 58, "Reload");
	draw_set_halign(fa_left);
	
	if (mouse_check_button_released(mb_left)) {
		if (loaded) {
			chromium_reload();
		} else {
			chromium_stop();	
		}
	}
} else {
	draw_set_color(obj_Console.Outline_Color);
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 48, display_get_gui_width()-16, 68, true);	
	} else {
		draw_rectangle(display_get_gui_width()-208, 48, display_get_gui_width()-16, 68, true);	
	}
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 58, "Reload");
	draw_set_halign(fa_left);
}
#endregion

#region Page Source
if (point_in_rectangle(mouse_x, mouse_y, display_get_gui_width()-208, 80, display_get_gui_width()-16, 100)) {
	draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.5));
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 80, display_get_gui_width()-16, 100, false);
	} else {
		draw_rectangle(display_get_gui_width()-208, 80, display_get_gui_width()-16, 100, false);	
	}
	draw_set_color(obj_Console.Outline_Color);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 90, "Page Source");
	draw_set_halign(fa_left);
	
	if (mouse_check_button_released(mb_left)) {
		chromium_request_source();
	}
} else {
	draw_set_color(obj_Console.Outline_Color);
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 80, display_get_gui_width()-16, 100, true);	
	} else {
		draw_rectangle(display_get_gui_width()-208, 80, display_get_gui_width()-16, 100, true);	
	}
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 90, "Page Source");
	draw_set_halign(fa_left);
}
#endregion

#region New Tab
if (point_in_rectangle(mouse_x, mouse_y, display_get_gui_width()-208, 112, display_get_gui_width()-16, 132)) {
	draw_set_color(decrease_color_rgb(obj_Console.Outline_Color, 0.5));
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 112, display_get_gui_width()-16, 132, false);
	} else {
		draw_rectangle(display_get_gui_width()-208, 112, display_get_gui_width()-16, 132, false);	
	}
	
	if (mouse_check_button_released(mb_left)) {
		var nbt = instance_create_layer(display_get_gui_width()-24, bdocky, "ui_layer", obj_BrowserTab);
		nbt.my_url = "www.google.com/";
		nbt.title = string_copy(nbt.my_url, 1, 24);
		ds_list_add(browserTabs, nbt);
	}
	
	draw_set_color(obj_Console.Outline_Color);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 122, "New Tab");
	draw_set_halign(fa_left);
} else {
	draw_set_color(obj_Console.Outline_Color);
	if (global.__rounded_elements) {
		draw_roundrect(display_get_gui_width()-208, 112, display_get_gui_width()-16, 132, true);	
	} else {
		draw_rectangle(display_get_gui_width()-208, 112, display_get_gui_width()-16, 132, true);	
	}
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()-112, 122, "New Tab");
	draw_set_halign(fa_left);
}
#endregion


//Address Bar
draw_set_color(obj_Console.Outline_Color);
draw_roundrect(224, display_get_gui_height()-26, display_get_gui_width()-224, display_get_gui_height()-4, true);
draw_text(228, display_get_gui_height()-14, string(gui_url));


//Browser Tabs
bdocky = 220;
for (var d = 0; d < ds_list_size(browserTabs); d++) {
	var dock_element = ds_list_find_value(browserTabs, d);
	with (dock_element) {	
		draw_set_color(obj_Console.Outline_Color);
		draw_set_alpha(1);
		
		if (point_in_rectangle(mouse_x, mouse_y, x, bdocky, x+220, bdocky+24)) {
			dist = 200;	
			if (mouse_check_button_released(mb_left)) {
				chromium_set_url(my_url);
				audio_play_sound(snd_Click, 1, false);
			}
			
			if (global.__rounded_elements) {
				draw_roundrect(x, bdocky, x+220, bdocky+24, false);
			} else {
				draw_rectangle(x, bdocky, x+220, bdocky+24, false);
			}
		} else {
			dist = 0;	
			
			if (global.__rounded_elements) {
				draw_roundrect(x, bdocky, x+220, bdocky+24, true);
			} else {
				draw_rectangle(x, bdocky, x+220, bdocky+24, true);
			}
		}
		
		draw_set_color(c_gray);
		draw_set_font(fnt_Label);
		draw_text(x+16, bdocky+12, string(title));
	}
	
	bdocky += 32;
}


#region Browser Surface
if (is_undefined(surf) || !surface_exists(surf)) {
	surf = surface_create(width, height);
	surf_update = true;
}

if (surf_update) {
	surf_update = false;
	
	if (is_undefined(surf_raw) || !surface_exists(surf_raw)) {
		surf_raw = surface_create(width, height);	
	}
	
	buffer_set_surface(buff, surf_raw, 0);
	
	surface_set_target(surf);
	shader_set(shd_bgr_flip);
	
	draw_surface(surf_raw, 0, 0);
	
	shader_reset();
	surface_reset_target();
}

draw_surface(surf, x, y);

#endregion

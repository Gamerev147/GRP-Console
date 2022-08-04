///@description Draw System Stats
/*
if (!surface_exists(surf)) {
	surf = surface_create(room_width, room_height);	
}

	surface_set_target(surf);
	surface_depth_disable(1);
	draw_clear_alpha(c_black, 0);
	gpu_set_blendmode(bm_add);

	//Draw Header
	draw_set_color(obj_Console.Outline_Color);
	draw_set_font(fnt_Label_2);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(8, 16, "System");

	//Draw Version
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_font(fnt_Label);
	draw_text(8, 48, "Version: " + string(global.VERSION));

	//Test FPS Graph
	draw_rectangle_color(48, 72, 132, 80, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	draw_rectangle_color(48, 72, 48 + (ffps/84), 80, c_gray, c_gray, c_gray, c_gray, false);
	draw_text(8, 72, "[FPS]");
	draw_text(164, 72, "[" + string(round(ffps)) + "]");

	//Draw Object List
	draw_text(8, 96, "Active Processes:");
	draw_set_font(fnt_Label_1);
	var name_yy = 112;
	for (var i = 0; i < array_length(global.OBJECT_NAMES); i++) {
	
		var name = global.OBJECT_NAMES[i];
		var idd = global.OBJECT_ID[i];
		draw_text(8, name_yy, "[" + string(idd) + "] " + string(name));
		name_yy += 16;
	
	}

	var new_yy = name_yy+32;

	#region Networking Section
	draw_set_color(obj_Console.Outline_Color);
	draw_line(0, new_yy, 224, new_yy);
	draw_set_font(fnt_Label_2);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(8, new_yy+16, "Network");

	draw_set_color(obj_Console.Outline_Color);
	draw_line(0, new_yy+32, 224, new_yy+32);

	new_yy = new_yy+48;
	draw_set_font(fnt_Label);
	draw_set_valign(fa_top);
	draw_set_color(obj_Console.Outline_Color);

	var nstr = "";
	var connected_clients = 0;
	if (instance_exists(obj_Server)) { connected_clients = ds_list_size(obj_Server.sockets); } 
	if (os_is_network_connected()) { nstr = "Connected"; } else { nstr = "Disconnected"; }
	draw_text(8, new_yy, "Status: " + string(nstr));
	draw_text(8, new_yy+16, "Speed: " + string(global.latency) + "m/s");
	draw_text(8, new_yy+48, "Running Servers: " + "\nPort " + string(global.SERVER_PORT) + "\nConnected: " + string(connected_clients));
	#endregion

	new_yy = new_yy+124;

	#region Shortcuts Section
	draw_set_font(fnt_Label_2);
	draw_set_valign(fa_middle);
	draw_set_color(obj_Console.Outline_Color);
	draw_line(0, new_yy, 224, new_yy);
	draw_line(0, new_yy+32, 224, new_yy+32)

	draw_set_color(obj_Console.Outline_Color);
	draw_text(8, new_yy+16, "Shortcuts");

	draw_set_font(fnt_Label);
	draw_set_valign(fa_top);
	draw_text(8, new_yy+48, "Up Arrow: Previous CMD \nDown Arrow: Cycle CMD \nCTRL+C: Copy CMD \nCRTL+V: Paste CMD");
	
	surface_reset_target();
	draw_surface(surf, 0, 0);
	gpu_set_blendmode(bm_normal);


#endregion

*/

//Draw UI
draw_set_alpha(1);
draw_set_color(obj_Console.Outline_Color);

if (!global.SYSTEM_PERFORM) {
	if (global.__rounded_windows) {
		draw_roundrect(224, 2, display_get_gui_width()-224, display_get_gui_height()-4, true);
	} else {
		draw_rectangle(224, 2, display_get_gui_width()-224, display_get_gui_height()-4, true);
	}
}
	
//Draw Apps button
if (point_in_rectangle(mouse_x, mouse_y, 8, 8, 128, 8+24)) {
	if (global.__rounded_elements) {
		draw_set_alpha(0.5);
		draw_roundrect(8, 8, 120, 8+24, false);
		draw_set_alpha(1);
		draw_roundrect(8, 8, 120, 8+24, true);	
	} else {
		draw_set_alpha(0.5);
		draw_rectangle(8, 8, 120, 8+24, false);
		draw_set_alpha(1);
		draw_rectangle(8, 8, 120, 8+24, true);	
	}
		
	if (mouse_check_button_released(mb_left)) {
		if (!instance_exists(obj_AppsMenu)) {
			instance_create_layer(8, 8+28, layer, obj_AppsMenu);	
		}
	}
} else {
	if (global.__rounded_elements) {
		draw_roundrect(8, 8, 120, 8+24, true);
	} else {
		draw_rectangle(8, 8, 120, 8+24, true);
	}
}

draw_set_color(obj_Console.Text_SecondaryColor);
draw_set_halign(fa_left);
draw_set_font(fnt_Label);
draw_text(16, 8+12, "Applications");



//Draw App Docks
docky = 100;
for (var d = 0; d < ds_list_size(dock_apps); d++) {
	var dock_element = ds_list_find_value(dock_apps, d);
	with (dock_element) {	
		draw_set_color(obj_Console.Outline_Color);
		
		if (point_in_rectangle(mouse_x, mouse_y, x, docky, x+220, docky+24)) {
			dist = 200;	
			if (mouse_check_button_released(mb_left)) {
				my_app.__nodock = true;
				ds_list_delete(dock_apps, ds_list_find_index(dock_apps, id));
				if (global.SYSTEM_AUDIO) { audio_play_sound(snd_Click, 1, false); }
				instance_destroy();
			}
			
			if (global.__rounded_elements) {
				draw_roundrect(x, docky, x+220, docky+24, false);
			} else {
				draw_rectangle(x, docky, x+220, docky+24, false);
			}
		} else {
			dist = 0;	
			
			if (global.__rounded_elements) {
				draw_roundrect(x, docky, x+220, docky+24, true);
			} else {
				draw_rectangle(x, docky, x+220, docky+24, true);
			}
		}
		
		draw_set_color(c_gray);
		draw_set_font(fnt_Label);
		var drawTitle = string_copy(title, 1, 24);
		draw_text(x+16, docky+12, string(drawTitle));
	}
	
	docky += 32;
}


//Draw Notifications
notsy = 160;
for (var n = 0; n < ds_list_size(nots); n++) {
	var not_element = ds_list_find_value(nots, n);
	with (not_element) {
		if (point_in_rectangle(mouse_x, mouse_y, x, notsy, x+208, notsy+100)) {
			alph = 1;
			draw_set_alpha(alph);
			if (global.__rounded_elements) {
				draw_set_color(c_gray);
				draw_roundrect(x, notsy, display_get_gui_width()-16, notsy+100, false);
				draw_set_color(obj_Console.Outline_Color);
				draw_roundrect(x, notsy, display_get_gui_width()-16, notsy+100, true);
			} else {
				draw_set_color(c_gray);
				draw_rectangle(x, notsy, display_get_gui_width()-16, notsy+100, false);
				draw_set_color(obj_Console.Outline_Color);
				draw_rectangle(x, notsy, display_get_gui_width()-16, notsy+100, true);
			}
			draw_text(x+8, notsy+12, title);
			draw_text(x+8, notsy+26, text);
			draw_set_alpha(1);
		} else {
			draw_set_alpha(alph);
			if (global.__rounded_elements) {
				draw_set_color(c_gray);
				draw_roundrect(x, notsy, display_get_gui_width()-16, notsy+100, false);
				draw_set_color(obj_Console.Outline_Color);
				draw_roundrect(x, notsy, display_get_gui_width()-16, notsy+100, true);
			} else {
				draw_set_color(c_gray);
				draw_rectangle(x, notsy, display_get_gui_width()-16, notsy+100, false);
				draw_set_color(obj_Console.Outline_Color);
				draw_rectangle(x, notsy, display_get_gui_width()-16, notsy+100, true);
			}
			draw_text(x+8, notsy+12, title);
			draw_text_ext(x+8, notsy+26, text, -1, 190);
			draw_set_alpha(0.9);
		}
	}
	notsy += 116;
}


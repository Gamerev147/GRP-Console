///
///@function tte_ext_input_draw()
///@syntax tte_ext_input_draw()
///
///@description This script should be called in the Draw or Draw GUI event
///							of the object representing the text input.
///
function tte_ext_input_draw() {
	if (tte_update && surface_exists(tte_surface)) {

    var l,px,py,ch, mx, my;
    ch = 0;
    mh = 0;
    mx = ( mouse_x - x - padding_left ) + scrollx;
    my = ( mouse_y - y - padding_top ) + scrolly;
    
	surface_set_target(tte_surface);
        draw_clear_alpha( c_white, 0 );
        
        draw_set_font( font );
        draw_set_color( fg );
        draw_set_alpha( fg_alpha );
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
        
        mh = string_height("|");
        
        var tcx = string_width( string_copy( lines[| line], 1, column-1 ) ) - scrollx;
        if( tcx < 0 ) scrollx = max( 0, scrollx-abs(tcx) );
        if( tcx >= (width-padding_left-padding_right-2) ) scrollx += tcx - ( width - padding_left - padding_right - 2 );
        
        var i,tcy=0,clh;
        for( i=0; i<line; i++ ) tcy += max( mh, string_height( lines[| i] ) );
        tcy -= scrolly;
        clh = max( mh, string_height( lines[| line] ) );
        if( tcy < 0 ) scrolly = max( 0, scrolly-abs(tcy) );
        if( tcy >= (height-padding_top-padding_bottom-2 - clh) ) scrolly += tcy - ( height-padding_top-padding_bottom-2 - clh);
        
        
        for( l=0; l<ds_list_size( lines ); l++ ) {
        
            if( selVisible ) {
                draw_set_color( sel );
                draw_set_alpha( sel_alpha );
                if( l >= selStartLine && l <= selEndLine ) {
                    if( l == selStartLine && l == selEndLine ) draw_rectangle(
                        string_width( string_copy( lines[| l], 1, selStartCol-1 ) ) -scrollx,
                        ch - scrolly,
                        string_width( string_copy( lines[| l], 1, selEndCol-1 ) ) - scrollx,
                        ch + max( mh, string_height( lines[| l] ) )-1 - scrolly,
                        false
                    );
                    else if( l == selStartLine ) draw_rectangle(
                        string_width( string_copy( lines[| l], 1, selStartCol-1 ) ) - scrollx,
                        ch - scrolly,
                        string_width( lines[| l] ) - scrollx,
                        ch + max( mh, string_height( lines[| l] ) )-1 - scrolly,
                        false
                    );
                    else if( l == selEndLine ) draw_rectangle(
                        -scrollx,
                        ch - scrolly,
                        string_width( string_copy( lines[| l], 1, selEndCol-1 ) ) - scrollx,
                        ch + max( mh, string_height( lines[| l] ) )-1 - scrolly,
                        false
                    );
                    else draw_rectangle(
                        -scrollx,
                        ch - scrolly,
                        string_width( lines[| l] ) - scrollx,
                        ch + max( mh, string_height( lines[| l] ) )-1 - scrolly,
                        false
                    );
                }
                draw_set_color( fg );
                draw_set_alpha( fg_alpha );
            }
            
            if( l == line && caretVisible ) {
                px = string_width( string_copy( lines[| l], 1, column-1 ) ) - scrollx;
                py = ch - scrolly;
                draw_line( px, py, px, py + max( mh, string_height( lines[| l] ) )-1 );
            }
            draw_text( -scrollx, ch - scrolly, lines[| l] );
            ch += max( mh, string_height( lines[| l] ) );
        }
    
	surface_reset_target();
    tte_update = false;
	}

	//draw window
	draw_set_color( bg );
	draw_set_alpha( bg_alpha );
	draw_rectangle( x, y, x+width, y+height, false);
	
	//Toolbar
	var numlines = ds_list_size(lines);
	
	draw_set_font( font );
	draw_set_color(obj_Console.Outline_Color);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_rectangle(x, y, x+width, y+22, true);
	
	if (global.custom_edit) {
		var editor_toolbar_string = "[c_green]Custom Script File: " + string(file_name) + "    |    [c_white]Lines: " + string(numlines);
		scribble_draw(x+padding_left, y+2, editor_toolbar_string);
		
		draw_line((x+width)-242, y+22, (x+width)-242, y+22+(height-22));
		
		
		var lly = y + padding_top;
		var llspc = string_height(lines[| 0])
		for (var ll=0; ll < ds_list_size(lines); ll++) {
			draw_text(padding_left, scrolly+lly, string(ll));	
			lly += llspc;
		}
		
		
		//toolbar buttons for script editor
		var x1 = (x+width)-120;
		
		//Save and close button
		if (point_in_rectangle(mouse_x, mouse_y, x1, y, x1+120, y+22)) {
			draw_set_color(c_white);
			draw_rectangle(x1, y, x1+120, y+22, false);
			
			draw_set_color(c_dkgray);
			draw_text(x1+8, y+2, "Save & Close");
			
			if (mouse_check_button_pressed(mb_left)) {
				save_text_input(file_name);
				global.CAN_TYPE = true;
				instance_destroy();	
			}
		} else {
			draw_set_color(c_white);
			draw_rectangle(x1, y, x1+120, y+22, true);
			draw_text(x1+8, y+2, "Save & Close");
		}
		
		//Add file button
		if (point_in_rectangle(mouse_x, mouse_y, x1-121, y, x1-1, y+22)) {
			draw_set_color(c_white);
			draw_rectangle(x1-121, y, x1-1, y+22, false);
			
			draw_set_color(c_dkgray);
			draw_text(x1-111, y+2, "Add File");
			
			if (mouse_check_button_pressed(mb_left)) {
				if (!instance_exists(obj_InputScriptFile)) {
					var ifn = instance_create_layer(x, y, "ui_layer", obj_InputScriptFile);	
					ifn.title = "Enter a new or existing file: ";
					ifn.animate = true;
				}
			}
		} else {
			draw_set_color(c_white);
			draw_rectangle(x1-121, y, x1-1, y+22, true);
			draw_text(x1-111, y+2, "Add File");
		}
		
		
		//section for creating active file buttons
		var sfilesX = (x+width)-200;
		var sfilesY = y+30;
		
		//loop the file map and create buttons
		for (var ds_display_name = ds_map_find_first(file_map); !is_undefined(ds_display_name); ds_display_name = ds_map_find_next(file_map, ds_display_name)) {
			var ds_file_name = file_map[? ds_display_name];
			//Draw file button
			if (point_in_rectangle(mouse_x, mouse_y, sfilesX, sfilesY, sfilesX+100, sfilesY+22)) {
				draw_set_color(c_white);
				draw_rectangle(sfilesX, sfilesY, sfilesX+120, sfilesY+22, false);
			
				draw_set_color(c_dkgray);
				draw_text_ext(sfilesX+8, sfilesY+2, string(ds_file_name), -1, 72);
				
				if (mouse_check_button_pressed(mb_left)) {
					//save the current file
					//save_text_file(file_name);
					
					//load the requested file
					load_text_file(ds_file_name);
					file_name = ds_file_name;
				}
			} else {
				draw_set_color(c_white);
				draw_rectangle(sfilesX, sfilesY, sfilesX+120, sfilesY+22, true);
				draw_text_ext(sfilesX+8, sfilesY+2, string(ds_file_name), -1, 72);
			}
			
			sfilesY += 26;
		}
		
		
		//create easy window dropdown
		var ew_x = x1 - 242;
		draw_set_color(c_white);
		draw_rectangle(ew_x, y+24, ew_x+120, y+46, true);
		draw_text(ew_x+4, y+26, "Window >");
		
		if (point_in_rectangle(mouse_x, mouse_y, ew_x, y+24, ew_x+120, y+46)) {
			if (mouse_check_button_pressed(mb_left)) {
				easy_window_toggle = !easy_window_toggle;	
			}
		}
		
		if (easy_window_toggle) {
			var ewd_y = y+46;
			for (var k = ds_map_find_first(easy_window); !is_undefined(k); k = ds_map_find_next(easy_window, k)) {	
				var v = easy_window[? k];
				
				if (point_in_rectangle(mouse_x, mouse_y, ew_x, ewd_y, ew_x+120, ewd_y+22)) {
					draw_rectangle(ew_x, ewd_y, ew_x+120, ewd_y+22, false);
					draw_set_color(c_dkgray);
					draw_text(ew_x+4, ewd_y+2, string(k));
					draw_set_color(c_white);
					
					if (mouse_check_button_pressed(mb_left)) {
						show_debug_message("The stupid button was clicked!!!!");
						tte_ext_input_insert(v);
						easy_window_toggle = false;
					}
				} else {
					draw_rectangle(ew_x, ewd_y, ew_x+120, ewd_y+22, true);
					draw_text(ew_x+4, ewd_y+2, string(k));	
				}
				
				ewd_y += 22;
			}
		}
		
		
		//easy element dropdown
		draw_set_color(c_white);
		draw_rectangle(ew_x-121, y+24, ew_x, y+46, true);
		draw_text(ew_x-116, y+26, "Element >");
		
		if (point_in_rectangle(mouse_x, mouse_y, ew_x-121, y+24, ew_x, y+46)) {
			if (mouse_check_button_pressed(mb_left)) {
				easy_element_toggle = !easy_element_toggle;	
			}
		}
		
		if (easy_element_toggle) {
			var ewd_y = y+46;
			for (var k = ds_map_find_first(easy_element); !is_undefined(k); k = ds_map_find_next(easy_element, k)) {	
				var v = easy_element[? k];
				
				if (point_in_rectangle(mouse_x, mouse_y, ew_x-121, ewd_y, ew_x, ewd_y+22)) {
					draw_rectangle(ew_x-121, ewd_y, ew_x, ewd_y+22, false);
					draw_set_color(c_dkgray);
					draw_text(ew_x-116, ewd_y+2, string(k));
					draw_set_color(c_white);
					
					if (mouse_check_button_pressed(mb_left)) {
						show_debug_message("The stupid button was clicked!!!!");
						tte_ext_input_insert(v);
						easy_element_toggle = false;
					}
				} else {
					draw_rectangle(ew_x-121, ewd_y, ew_x, ewd_y+22, true);
					draw_text(ew_x-116, ewd_y+2, string(k));	
				}
				
				ewd_y += 22;
			}
		}
		
		
		//display errors
		if (display_script_error) {
			draw_set_color(c_red);
			draw_text(x+32, (y+height)-32, "Script on current line not found!");
		}
		
		if (display_namespace_error) {
			if (display_script_error) {
				draw_set_color(c_red);
				draw_text(x+32, (y+height)-48, "Variable being referenced not found in namespace!");
			} else {
				draw_text(x+32, (y+height)-32, "Variable being referenced not found in namespace!");
			}
		}
		
	} else if (global.bug_report) {
		draw_rectangle(x, y, x+width, y+height, true);
		draw_text(x+padding_left, y+2, "Bug Report: Please type a description of the bug.");
		
		
	} else {	//no custom editor open
		draw_text(x+padding_left, y+2, "File: " + string(file_name) + "    |    Lines: " + string(numlines));	
	}
	
	//draw to surface (won't work without this shit)
	if( surface_exists( tte_surface ) ) draw_surface( tte_surface, x+padding_left, y+padding_top );
}



function tte_ext_input_get_text() {
	/// tte_ext_input_get_text()
	var txt = "";
	for(var l = 0; l < ds_list_size(lines); l++) {
		if (lines[| l] == "") {
			txt += "\n";	
		}
		
	    if (lines[| l] != "") {
			txt += lines[| l];
		}
	}
	return txt;
}

function tte_ext_input_getln() {
	var rtxt = ds_list_find_value(lines, line);
	return rtxt;
}

function tte_ext_input_save_tofile() {
	var filename = argument[0];
	var openfile = file_text_open_write(string(filename));
	for (var f = 0; f < ds_list_size(lines); f++) {
		show_debug_message(string(ds_list_find_value(lines, f)));
		var str_val = string(lines[| f]);
		if (str_val != "\n") {
			file_text_write_string(openfile, lines[| f]);
			file_text_writeln(openfile);
		}
	}
	file_text_close(openfile);
	//ConsoleLog("File (" + string(filename) + ") [c_green]has been saved successfully.", 0);
}

function tte_ext_input_set_text() {
	/// tte_ext_input_set_text( text )
	var c,t,w,l;
	t = argument[0];
	l = ds_list_create();
	w = "";

	var p = string_pos( "\n", t );

	while( p > 0 ) {
	    ds_list_add( l, w + string_copy( t, 1, p ) );
	    t = string_copy( t, p+1, string_length( t ) - p  );
	    p = string_pos( "\n", t );
	}

	if( t != "" ) ds_list_add( l, t );

	ds_list_clear( lines );
	ds_list_destroy( lines );

	lines = l;

	var lastl = ds_list_size( lines )-1;
	tte_ext_move_cursor( lastl, string_length( lines[| lastl] )+1 );
}

function tte_ext_input_set_multiline() {
	/// tte_ext_input_set_multiline( multiline=true );
	if( argument_count > 0 ) multline = argument[0];
	else multiline = true;
}

function tte_ext_input_set_size() {
	/// tte_ext_input_set_size( width, height )
	width = argument[0];
	height = argument[1];

	if( surface != -1 ) surface_free( surface );
	surface = -1;
}

function tte_ext_input_set_padding() {
	/// tte_ext_input_set_padding( left, right, top, bottom );
	padding_left = argument[0];
	padding_top = argument[2];
	padding_right = argument[1];
	padding_bottom = argument[3];
}

function tte_ext_input_set_text_color() {
	/// tte_ext_input_set_text_color( color, alpha );
	fg = argument[0];
	fg_alpha = argument[1];
}

function tte_ext_input_set_background_color() {
	/// tte_ext_input_set_background_color( color, alpha );
	bg = argument[0];
	bg_alpha = argument[1];
}

function tte_ext_input_set_selection_color() {
	/// tte_ext_input_set_selection_color( color, alpha );
	sel = argument[0];
	sel_alpha = argument[1];
}

function tte_ext_input_set_font() {
	/// tte_ext_input_set_font( font );
	font = argument[0];
}

function tte_ext_input_set_on_changed() {
	/// tte_ext_input_set_on_changed( script )
	if( script_exists( argument[0] ) ) on_changed = argument[0];
}

function tte_ext_input_clear_on_changed() {
	/// tte_ext_input_clear_on_changed()
	on_changed = noone;
}

function tte_ext_input_get_surface() {
	/// tte_ext_input_get_surface()
	return surface;
}

function tte_ext_cleanup() {
	ds_list_destroy(lines);
	surface_free( surface );
}


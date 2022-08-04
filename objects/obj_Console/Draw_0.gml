///@description Draw Console

if !Focus { exit;}
var defcol = draw_get_color();
var defalp = draw_get_alpha();

switch (global.TAB) {
	#region MAIN
	case "MAIN":
		if (show_console = true) {
			//Draw Background
			if (Background_Image = undefined) && (Background_Path = "") {
				background_color = Background_Color;
			} else {
				draw_sprite_stretched(Background_Image, 0, 0, 0, room_width, room_height);	
			}

			//Draw Log Text
			draw_set_valign(fa_bottom);
			draw_set_halign(fa_left);
			draw_set_alpha(1);
			
			if (!global.__INIT__) {
				for (var i = 0 ; i < array_length(Text_); i ++) {
					var LineString = string(Text_[i]);
					scribble_draw(226, VSize - (i*20) - 28, LineString);
				}
			}

			//Draw Console Line Text
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			draw_set_alpha(1);
			draw_set_color(c_yellow);
			draw_set_font(fntConsole);
			draw_text(228, VSize-4, string(Text_DefText));
			draw_set_colour(Text_SecondaryColor);
			var dispText = string_insert(lCursor, Text_CurrentLine, lCursorPos);
			draw_text_ext(228 + string_width(Text_DefText)+4, VSize-4, dispText, -1, HSize-352);
			
			//Draw Debug
			if (Debug) {
				draw_set_color(c_red);
				draw_set_font(fnt_Label);
				
				draw_text(16, 260, "active runner: " + string(RUN_ACTIVE) + "\n" + "active window: " + string(WIN_ACTIVE) + 
				"\n" + "runner buffer: " + string(ds_list_size(RUNNERS)) + "\n" + 
				"window buffer: " + string(ds_list_size(WINDOWS)));
			}
		}
	break;
	#endregion
	
	#region NET
	case "NET":
		//Draw Background Rectangle
		draw_set_color(Background_Color);
		draw_rectangle(0, 0, room_width, room_height, false);

		//Draw Net Line Text
		draw_set_font(fntConsole);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		draw_set_colour(Text_SecondaryColor);
		var netLines = array_length(netText_);

		for (var i = 0 ; i < netLines; i ++) {
			var VSLineSize;
			VSLineSize = string_height(string_hash_to_newline(netText_[i]));
			scribble_draw(226, VSize - (i*VSLineSize) - 28, string_hash_to_newline(netText_[i]));
		}

		//Draw Net Console Line Rectangle
		var VLineSize;
		VLineSize = string_height_ext(string_hash_to_newline(net_currentLine), -1, HSize);
		//draw_set_color(Outline_Color);
		//draw_rectangle(226, VSize, HSize-172, VSize + VLineSize - 4, true);

		//Draw Net Console Line Text
		draw_set_colour(Text_SecondaryColor);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		draw_text_ext(226, VSize-4, string_hash_to_newline(net_currentLine + lCursor), -1, HSize);
	break;
	#endregion
	
	case "ALI":
		//Draw Background Rectangle
		draw_set_color(Background_Color);
		draw_rectangle(0, 0, room_width, room_height, false);

		//Draw Net Line Text
		draw_set_font(fntConsole);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		draw_set_colour(Text_SecondaryColor);
		var setLines = array_length(setText_);

		for (var i = 0 ; i < setLines; i ++) {
	
			var VSLineSize;
			VSLineSize = string_height(string_hash_to_newline(setText_[i]));
			scribble_draw(226, VSize - (i*VSLineSize) - 16, string_hash_to_newline(setText_[i]));
	
		}

		//Draw Net Console Line Rectangle
		var VLineSize;
		VLineSize = string_height_ext(string_hash_to_newline(set_currentLine), -1, HSize);
		//draw_set_color(Outline_Color);
		//draw_rectangle(226, VSize, HSize-172, VSize + VLineSize - 4, true);

		//Draw Net Console Line Text
		draw_set_colour(Text_SecondaryColor);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text_ext(226, VSize, string_hash_to_newline(setDef + set_currentLine + lCursor), -1, HSize);
	break;

}

/*
if (show_ui = true) {
	draw_set_alpha(1);
	//Draw Center Clock
	if (clock = true) {
		draw_sprite_ext(spr_clock_outside, 0, room_width/2, room_height/2, 1, 1, clock_outside, c_white, 0.2);
		draw_sprite_ext(spr_clock_middle, 0, room_width/2, room_height/2, 1, 1, clock_inside, c_white, 0.2);
		draw_sprite_ext(spr_clock_center, 0, room_width/2, room_height/2, 1, 1, 0, c_white, 0.1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_Time);
		draw_text_color(room_width/2, room_height/2-4, string(global.day) + "\n" + string(global.time), c_white, c_white, c_white, c_white, 0.3);
		if (clock_date = true) { draw_text_color(room_width/2, room_height/2 + 32, string(global.date), c_white, c_white, c_white, c_white, 0.3); }
	}
}
*/

//Ids
if ShowIds {
    with(all) {
        draw_set_colour(c_red);
        draw_text(x, y, string_hash_to_newline(id));
        draw_set_colour(c_white);
    }
}

//Reset Drawing
draw_set_colour(defcol);
draw_set_alpha(defalp);


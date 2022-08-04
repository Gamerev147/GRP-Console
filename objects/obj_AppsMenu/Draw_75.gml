/// @description Draw the box

draw_set_color(back_color);
draw_set_alpha(back_alpha);

if (global.__rounded_windows) {
	draw_roundrect(x1,ty1,x2,ty2,false);
} else {
	draw_rectangle(x1,ty1,x2,ty2,false);
}

draw_set_alpha(outline_alpha);
draw_set_color(border_color);

if (global.__rounded_windows) {
	draw_roundrect(x1,ty1,x2,ty2,true);
} else {
	draw_rectangle(x1,ty1,x2,ty2,true);	
}

draw_set_color(sep_color);

for(var i = 0; i < num; i++) {
    var y1 = y+(item_height*i)+y_offset+1;
    var y2 = y+(item_height*(i+1))+y_offset;
    
    var icon = icons[i];
    if(sprite_exists(icon)) {
        draw_sprite_ext(icon,0,x1+total_icon_size/2,y1+total_icon_size/2,sprite_get_width(icon)/total_icon_size,sprite_get_height(icon)/total_icon_size,0,icon_color,image_alpha);
    }
    
    draw_set_color(sep_color);
    
    if (draw_separator[i]) {
        draw_line(x1+total_icon_size,y1,x2,y1);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(text_color);
	draw_set_alpha(text_alpha);
	draw_set_font(fnt_Label);
    draw_text(x1+total_icon_size+item_padding, y1+item_padding, string_hash_to_newline(option_text[i]));
    
    var action_icon = action_icons[i];
    if (sprite_exists(action_icon)) {
        draw_sprite_ext(action_icon,0,x2-total_icon_size/2,y1+total_icon_size/2,sprite_get_width(action_icon)/total_icon_size,sprite_get_height(action_icon)/total_icon_size,0,icon_color,image_alpha);
    }
    
    if (i == selected) {
        draw_set_color(select_color);
        draw_set_alpha(.2);
        draw_roundrect(x1+select_padding,y1+select_padding,x2-select_padding,y2-select_padding,false);
        draw_set_alpha(.6);
        draw_roundrect(x1+select_padding,y1+select_padding,x2-select_padding,y2-select_padding,true);
        draw_set_alpha(1);
    }
}

draw_set_alpha(1);


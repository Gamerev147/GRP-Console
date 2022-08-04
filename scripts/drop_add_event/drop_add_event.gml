/// @Description
/// @Param
function drop_add_event(_array_pos, _main_icon, _event_text, _icon, _sep) {
	
	var option_num = _array_pos;
	var icon = _main_icon;
	var text = _event_text;
	var act_icon = _icon;
	var add_sep = _sep;
	
	if (option_num < 0) return noone;
	
	icons[option_num] = icon;
	option_text[option_num] = text;
	action_icons[option_num] = act_icon;
	draw_separator[option_num] = add_sep;

}
/// @description 
if (!global.SYSTEM_PERFORM) {
	
	image_blend = obj_Console.Outline_Color;
	image_xscale = lerp(image_xscale, scale, spd);
	image_yscale = image_xscale;
	image_angle += room_speed/100;

	cx = display_get_gui_width()/2;
	cy = display_get_gui_height()/2;


	//circular movement
	theta += theta_speed;
	if (theta >= 360) theta -= 360;
	x = cx + lengthdir_x(r, theta);
	y = cy + lengthdir_y(r, theta);
	
}


if (global.time_format == "12") {
	if (current_hour >= 0 && current_hour <= 11) {
		am = true;	
		hour = current_hour;
	} else {
		am = false;	
		hour = current_hour - 12;
	}
	
	minute = current_minute;
} else {
	hour = current_hour;
	minute = current_minute;
}


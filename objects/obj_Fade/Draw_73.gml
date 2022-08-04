///@description Draw Fade Black

a = clamp(a + (fade * 0.02), 0, 1);

if (a == 1) {
	
	if (target = "next") {
		room_goto_next();	
	} else if (target = "display") {
		instance_create(0, 0, obj_DisplayName);
	} else if (target = "factor") {
		instance_create(x, y, obj_LoginFactor);	
	} else {
		instance_create(x, y, obj_LoginPassword);	
	}
	
	fade = -1;
	
}

if (a == 0) && (fade == -1) {
	
	instance_destroy();
	
}

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(1);

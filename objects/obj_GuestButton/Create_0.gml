/// @description 

alph = 1;
fo = false;

text = "Guest Login"; 
hover = 0;

function get_hover() {
	var mx = mouse_x;
	var my = mouse_y;
	return point_in_rectangle(mx, my, x-50, y-10, x+50, y+10);
}


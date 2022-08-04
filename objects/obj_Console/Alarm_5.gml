/// @description System Update Interval

//Aspect Ratio
HSize = window_get_width();
VSize = window_get_height() - 20;
room_width = HSize;
room_height = VSize + 20;
surface_resize(application_surface, HSize, VSize + 20);

//reset interval
alarm[5] = global.__sys_update_int*2;

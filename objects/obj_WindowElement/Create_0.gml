/// @description Init Window Text

//parent and type of element
_type = "";
_parent = noone;

//element type variables

//text
_text = "";

//images
_image = undefined;
_image_width = 32;
_image_height = 32;
_image_path = "";
alarm[1] = 5;

//videos
_video = -1;
_video_path = "";
_video_width = 320;
_video_height = 160;
alarm[3] = 5;

//icons
_icon_name = "";
_icon_image_path = "";
_icon_image = undefined;
_icon_pointer = "";
_icon_directory = undefined;
_icon_arguments = [];
_icon_display_fullname = false;
alarm[2] = 5;

//buttons
_button = "";
_button_action = undefined;
_button_arguments = [];
_button_width = 32;
_button_height = 12;

//input
_input = "";
_input_selected = false;
_input_var = "";
_input_width = 48;
_input_height = 16;
_curs = "";
alarm[0] = 15;

//dropdown boxes
_drop_title = "";
_drop_options = ds_map_create();
_drop_width = 48;
_drop_height = 16;
show_drop = false;

//draw line
_line_sx = 0;
_line_sy = 0;
_line_ex = 0;
_line_ey = 0;
_line_color = c_white;

//draw rectangles
_rec_sx = 0;
_rec_sy = 0;
_rec_ex = 0;
_rec_ey = 0;
_rec_fill = 0; //0 = fill	1 = outline
_rec_color = c_white;

//draw circles
_cir_x = 0;
_cir_y = 0;
_cir_color = c_white;
_cir_rad = 0;
_cir_fill = 0; //0 = fill   1 = outline

//position
_x = x;
_y = y;

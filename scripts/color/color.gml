/// @Description color(scheme_num)
/// @Param scheme_num

function color(_scheme) {

	var scheme = "";
	scheme += string(_scheme) + "";
	
	switch (scheme) {
		
		//Default Case
		case "0":	
			with (obj_Console) {
				Background_Color = c_black;
				Outline_Color = c_white;
			}
		break;
		
		case "1":
			with (obj_Console) {
				Background_Color = c_black;
				Outline_Color = c_red;
			}
		break;
		
		case "2":
			with (obj_Console) {
				Background_Color = c_navy;
				Outline_Color = c_aqua;
			}
		break;
		
		case "3":
			with (obj_Console) {
				Background_Color = c_black;
				Outline_Color = c_green;
			}
		break;
		
		case "4":
			with (obj_Console) {
				Background_Color = c_black;
				Outline_Color = c_purple;
			}
		break;
		
		case "5":
			with (obj_Console) {
				Background_Color = c_dkgray;
				Outline_Color = c_white;
			}
		break;
		
	}
	
	//Save Color
	if (global.USER != "Guest") {
		var ufname = ("users/" + string(global.USER) + ".user");
		if (file_exists(ufname)) {
			fast_file_encrypt(ufname, ufname, false);
			ini_open(ufname);
			ini_write_real("style", "color_b", obj_Console.Background_Color);
			ini_write_real("style", "color_o", obj_Console.Outline_Color);
			ini_write_real("style", "color_t", obj_Console.Text_SecondaryColor);
			ini_close();
		}
		fast_file_encrypt(ufname, ufname, true);
	}

}

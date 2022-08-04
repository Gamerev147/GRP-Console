/// @Description color(scheme_num)
/// @Param scheme_num

function colort(_scheme) {

	var scheme = "";
	scheme += string(_scheme) + "";
	
	switch (scheme) {
		
		//Default Case
		case "0":	
			with (obj_Console) {
				Text_SecondaryColor = c_white;
			}
		break;
		
		case "1":
			with (obj_Console) {
				Text_SecondaryColor = c_red;
			}
		break;
		
		case "2":
			with (obj_Console) {
				Text_SecondaryColor = c_blue;
			}
		break;
		
		case "3":
			with (obj_Console) {
				Text_SecondaryColor = c_green;
			}
		break;
		
		case "4":
			with (obj_Console) {
				Text_SecondaryColor = c_orange;
			}
		break;
		
		case "5":
			with (obj_Console) {
				Text_SecondaryColor = c_silver;
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

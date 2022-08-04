
function ConsoleInit() {
	
	//Time Format
	global.time_format = "12";
	global.date = string(current_month) + "/" + string(current_day) + "/" + string(current_year);
	global.time = string(current_hour) + ":" + string(current_minute);
	global.day = current_weekday;
	switch(global.day) {
		case 0: global.day = "Sunday";		break;
		case 1: global.day = "Monday";		break;
		case 2: global.day = "Tuesday";		break;
		case 3: global.day = "Wednesday";	break;
		case 4: global.day = "Thursday";	break;
		case 5: global.day = "Friday";		break;
		case 6: global.day = "Saturday";	break;
	}
	
	//Confirmation Box
	global.confirmOption = -1;

	//User
	global.e_userName = "";
	global.e_userPass = "";

	//User Creation Windows
	global.c_userName = "";
	global.c_userPass = "";
	
	
	globalvar HIDDEN_SCRIPTS;
	HIDDEN_SCRIPTS = ds_list_create();
	
	ds_list_add(HIDDEN_SCRIPTS, "ConsoleInit", "ConsoleHelp", "Wait", "return_pass", "scr_PacketHandling", "GetReturn");
	ds_list_add(HIDDEN_SCRIPTS, "cr_inputbox","draw_window", "str_to_bin", "string_is_url", "StringSplit", "random_password");
	ds_list_add(HIDDEN_SCRIPTS, "scr_chromium_convert_cursor", "scr_chromium_get_modifiers", "struct_create", "struct_delete");
	ds_list_add(HIDDEN_SCRIPTS, "fast_file_crypt", "fast_file_encrypt", "fast_file_key_crypt", "fast_file_key_crypt_compress", "hex_to_dec_fast");
	ds_list_add(HIDDEN_SCRIPTS, 
		"wiki_content",
		"wiki_content_decode",
		"wiki_content_destroy",
		"wiki_content_get",
		"wiki_get", "wiki_init", "wiki_init_ext",
		"wiki_pageimage",
		"wiki_pageimage_destroy",
		"wiki_pageimage_decode",
		"wiki_pageimage_get",
		"wiki_pageimage_size",
		"wiki_search",
		"wiki_search_decode",
		"wiki_search_output_ext",
		"drop_add_event",
		"CH", "DBL_INT_ADD", "EP0", "EP1",
		"ROTRIGHT", "MAJ", "new_ctx", 
		"SIG0", "SIG1",
		"array_has_value",
		"array_to_list", 
		"array_log_to_console",
		"editor_error_check"
	);
	
	//Needed Core Files
	globalvar CORE_SCRIPTS;
	CORE_SCRIPTS = ds_list_create();
	
	ds_list_add(CORE_SCRIPTS, 
		"core/background_wizard.grp", 
		"core/bkgnd_wizard_2.grp", 
		"core/image_viewer.grp", 
		"core/profile_wizard.grp", 
		"core/settings.grp", 
		"core/sppw.grp", 
		"core/grp_scripter.grp",
		"core/grp_scripter_launch.grp",
		"core/rename_wizard.grp",
		"core/twofact_inpt.grp",
		
		"core/set/cg_pass1.grp", 
		"core/set/cg_pass2.grp", 
		"core/set/cg_user1.grp", 
		"core/set/cg_user2.grp", 
		"core/set/cst_res.grp", 
		"core/set/cst_res1.grp", 
		"core/set/cst_res2.grp", 
		"core/set/set_outline_default.grp", 
		"core/set/set_outline_rounded.grp", 
		"core/set/set_outline_square.grp", 
		"core/set/settings_gear.png",
		"core/set/sysinf.grp",
		
		"core/editor/custom_edit.grp",
		"core/editor/custom_edit_fl.grp",
		"core/editor/custom_edit2.grp",
		
		"core/directory_icon.png",
		"core/document_icon.png",
		"core/image_icon.png",
		"core/script_icon.png"
	);
	
	//Scripting Keywords
	globalvar KEYWORDS;
	KEYWORDS = ds_list_create();
	ds_list_add(KEYWORDS, "if", "ifnot", "rpt", "..", "var", "In", "function", "#Call", "#call");
	
	//Initialize Skip Words for AI
	globalvar SKIP;
	SKIP = ds_list_create();
	ds_list_add(SKIP, "the", "but", "so", "it");
	
	

}

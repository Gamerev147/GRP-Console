///@description Console Commanding

clock_outside ++;
clock_inside --;

if (keyboard_check_pressed(KFocus)) {
	ConsoleTogle();	
}

//Disable Console Background Checking
if (!Focus) { exit;}

//Pop array values
//if (array_length(Text_) > 48) {
	//array_delete(Text_, array_length(Text_), 1);	
//}

#region Erase and Copy
switch (global.TAB) {
	case "MAIN":
		if (global.CAN_TYPE) {
			if (keyboard_check(KErase) && string_length(Text_CurrentLine) > 0) {
			    if (EraseTime >= room_speed/6) {
			        Text_CurrentLine = string_delete(Text_CurrentLine, lCursorPos-1, 1);
			        EraseTime = 0;
					lCursorPos -= 1;
			    } else {
			        EraseTime ++
			    }
			} else {
				EraseTime = room_speed/6;
			}
		
			//Copy Text
			if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C"))) {
				clipboard_set_text(Text_CurrentLine);
				ConsoleLog("Command Text Copied.", 0);
				keyboard_lastkey = -1;
			}

			//Paste Text
			if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V"))) {
			    if clipboard_has_text() {
			        Text_CurrentLine = string_insert(clipboard_get_text(), Text_CurrentLine, lCursorPos);
			        keyboard_lastkey = -1;
			    } 
			}
		
			//Move caret
			if (keyboard_check_pressed(KLeft)) { lCursorPos -= 1; }
			if (keyboard_check_pressed(KRight)) { lCursorPos += 1; }
			if (keyboard_check_pressed(vk_home)) { lCursorPos = 1; }
			if (keyboard_check_pressed(vk_end)) { lCursorPos = string_length(Text_CurrentLine); }
			
			//attempt at scrolling
			if (mouse_wheel_down()) {
				for(var i = array_length_1d(Text_) - 1 ; i >= 0; i --) {
			        Text_[i + 1] = Text_[i];
					show_debug_message(string(i));
			    }	
				show_debug_message(" ");
			}
			
			if (mouse_wheel_up()) {
				for(var i = 1; i < array_length_1d(Text_); i ++) {
			        Text_[i - 1] = Text_[i];
					show_debug_message(string(i));
			    }	
				show_debug_message(" ");
			}
		}
	break;
	case "NET":
		if (keyboard_check(KErase) && string_length(net_currentLine) > 1) {
		    if (EraseTime >= room_speed/6) {
		        net_currentLine = string_copy(net_currentLine, 1, string_length(net_currentLine) - 1);
		        EraseTime = 0;
		    } else {
		        EraseTime ++
		    }
		} else {
		    EraseTime = room_speed/6;
		}
	break;
	case "ALI":
		if (keyboard_check(KErase) && string_length(set_currentLine) > 1) {
		    if (EraseTime >= room_speed/6) {
		        set_currentLine = string_copy(set_currentLine, 1, string_length(set_currentLine) - 1);
		        EraseTime = 0;
		    } else {
		        EraseTime ++
		    }
		} else {
		    EraseTime = room_speed/6;
		}
	break;
	case "WEB":
	if (data_isSelected) {
		if (keyboard_check(KErase) && string_length(data_currentLine) > 1) {
		    if (EraseTime >= room_speed/6) {
		        data_currentLine = string_copy(data_currentLine, 1, string_length(data_currentLine) - 1);
		        EraseTime = 0;
		    } else {
		        EraseTime ++
		    }
		} else {
		    EraseTime = room_speed/6;
		}
	}
	break;
}
#endregion

//Get Last Text to Current Line
if (global.CAN_TYPE) {
	if keyboard_check_released(KLast) {
	    if (array_length_1d(Text_LastLine) - 1 > Text_Last) { Text_Last ++ }
	    Text_CurrentLine = Text_LastLine[Text_Last];
	}

	if keyboard_check_released(KNext) {
	    if (Text_Last > 0) { Text_Last -- }
	    Text_CurrentLine = Text_LastLine[Text_Last];
	}
}

//IF IN MAIN TAB:
switch(global.TAB) {
	#region MAIN
	case "MAIN":
		//Console Logic
		var Script = "";
		var Argument;
		Argument[0] = "";
		var ArgCount = 0;

		//Enter text
		if (global.CAN_TYPE) {	
			if keyboard_check_released(KEnter) and (string_length(Text_CurrentLine) >= 1) {
				if (global.TextStringOnly != true) {
	
				    //add a final space
				    Text_CurrentLine = Text_CurrentLine + " "
    
				    //define word as an empty string
				    var Word = "";
    
				    //iterate after ">. "(Text_DefText)
				    for(var i = 0; i < string_length(Text_CurrentLine); i ++) {
		
				        //define the actual character
				        var NextChar = string_char_at(Text_CurrentLine, i + 1);
		
				        //check for spaces
				        if (NextChar != " ") {
				            Word += NextChar;
				        } else {
				            //define script
				            if Script = "" {
				                Script = asset_get_index(Word);
								var ScriptIsHidden = ds_list_find_index(HIDDEN_SCRIPTS, Word);
				                if script_exists(Script) && (ScriptIsHidden == -1) {
				                    Script = Word;
				                    Word = "";
				                    continue;    
				                } else if (file_exists(Text_CurrentLine)) {
									ConsoleLog("[c_yellow]" + Text_DefText + Text_CurrentLine, 1);
									var ff = string_copy(Text_CurrentLine, 1, string_length(Text_CurrentLine)-1);
									run(ff);
									break;
								} else {
					                //script not found
					                ConsoleLog("[c_yellow]" + Text_CurrentLine, 0);
					                ConsoleLog("Function, command, or file not recognized.", 0);
									ConsoleLog(" ", 0);
                    
				                    Script = ""
				                    Word = ""
				                    break;
				                }  
				            } else {
				                //set arguments in array
				                Argument[ArgCount] = Word;
				                ArgCount ++;
				                Word = "";
				            }
				        }
				    }       
	
				    //execute script
					if script_exists(asset_get_index(Script)) {
						if (Text_CurrentLine != "n_snd_server") {
							ConsoleLog("[c_yellow]" + Text_DefText + Text_CurrentLine, 1);
						}
					    script_execute_ext(asset_get_index(Script), Argument)
					}
					audio_play_sound(snd_Readout, 1, false);
				} else {
					global.TextStringInput = string_copy(Text_CurrentLine, 1, string_length(Text_CurrentLine));
					
					if (global.TextStringInput != "--exit") {
						ConsoleLog("[c_green]" + global.TextStringInput, 0, RUN_ACTIVE);
					
						//if we have run-file data
						if (global.TextStringVar != "") && (global.TextStringFile != "") {
							//add the input to the map
							if (ds_map_exists(VARMAP, global.TextStringVar)) {
								ds_map_replace(VARMAP, global.TextStringVar, global.TextStringInput);	
							} else {
								ds_map_add(VARMAP, global.TextStringVar, global.TextStringInput);	
							}
						
							//run the saved file starting at the saved line
							if (global.TextStringFileLine != 0) {
								var tsfn = global.TextStringFile;
								var tsfrl = global.TextStringFileLine;
								
								//reset input values
								global.TextStringInput = "";
								global.TextStringFile = "";
								global.TextStringFileLine = 0;
								global.TextStringVar = "";
								
								//resume the calling file
								run(tsfn, "", tsfrl);	
								//global.TextStringOnly = false;
							}
						}
					} else {
						ConsoleLog("Input listening has been canceled.", 0, RUN_ACTIVE);
						ConsoleLog("[c_red]Execution stopped.", 0, RUN_ACTIVE);
						global.TextStringOnly = false;
					}
				}
			}
		}
	break;
	#endregion
	
	case "NET":
		if (keyboard_check_released(vk_enter) && string_length(net_currentLine) > 1) {
			var iterate_com = StringSplit(net_currentLine);
			
			if (iterate_com[0] != "img") {
				if (instance_exists(obj_Client)) {
					buffer_seek(obj_Client.buffer, buffer_seek_start, 0);
					buffer_write(obj_Client.buffer, buffer_u8, CHAT);
					buffer_write(obj_Client.buffer, buffer_string, global.USER);
					buffer_write(obj_Client.buffer, buffer_string, net_currentLine);
					network_send_packet(obj_Client.socket, obj_Client.buffer, buffer_tell(obj_Client.buffer));
					audio_play_sound(snd_Readout, 1, false);
				} else {
					NetLog("(failed) " + net_currentLine);	
					audio_play_sound(snd_LoginFail, 1, false);
				}
			} else {
				if (instance_exists(obj_Client)) {
					var img_path = iterate_com[1];
					var img_send = sprite_add(img_path, 0, false, true, 0, 0);
					
					buffer_seek(obj_Client.buffer, buffer_seek_start, 0);
					
				}
			}
		}
	break;
	case "ALI":
		if (set_currentLine == " ") || (set_currentLine == "|") {
			setDef = "Type something...";	
		} else {
			setDef = "";	
		}
	
		if (keyboard_check_released(vk_enter)) {
			set_currentLine = set_currentLine + " ";
			var inpt = string_lower(set_currentLine);
			var ParseArray = [];
			var Response = "";
			
			var _word = "";
			for (var s = 0; s < string_length(inpt); s++) {
				var next = string_char_at(inpt, s+1);
				if (next != " ") {
					_word += next;	
				} else {
					array_push(ParseArray, string(_word));	
					_word = "";
				}
			}

			for (var a = 0; a < array_length_1d(ParseArray); a++) {
				var find_token = string(ParseArray[a]);
				if (ds_map_exists(AIDIC, find_token)) {
					var find_def = ds_map_find_value(AIDIC, string(ParseArray[a]));
					if (!is_undefined(find_def)) {
						var find_resp = ds_map_find_value(AIRESP, find_def);
						var resp_list = array_to_list(find_resp);
					}
					ds_list_shuffle(resp_list);
					if (ds_list_find_value(resp_list, 0) != undefined) && (ds_list_find_value(resp_list, 0) != 0) {
						Response += ds_list_find_value(resp_list, 0);
						Response += " ";
					} else {
						Response += "I don't understand. Please rephrase.";	
						Response += " ";
						break;
					}
				}
			}

			AliLog(set_currentLine);
			AliLog("[c_green]Ali: " + Response);
			AliLog(" ");
			Response = "";
			audio_play_sound(snd_Readout, 1, false);
		}
	break;
	
	#region DATA
	case "WEB":
		//search text
		
	break;
	#endregion
}

//input timer
global.__it -- ;

//Conflict Keys
if keyboard_lastkey != -1 {
    switch keyboard_lastkey { 
    case vk_control:
    case vk_lcontrol:
    case vk_rcontrol:
    case vk_ralt:
    case vk_alt:
    case vk_lalt:
    case vk_shift:
    case vk_lshift:
    case vk_rshift:
    case vk_left:
    case vk_right:
    case vk_down:
    case vk_up:
	case vk_home:
	case vk_end:
    case KEnter:
    case KFocus:
    case KErase:
        keyboard_lastkey = -1;
        keyboard_lastchar = -1;
        exit;
    break;
    }
	if (global.CAN_TYPE = true) {
		switch (global.TAB) {
			case "MAIN":
				Text_CurrentLine = string_insert(keyboard_lastchar, Text_CurrentLine, lCursorPos);
				lCursorPos += 1;
			break;
			case "NET":
				net_currentLine += keyboard_lastchar
			break;
			case "ALI":
				set_currentLine += keyboard_lastchar
			break;
			case "DATA":
				data_currentLine += keyboard_check_direct(vk_anykey)
			break;
		}
	}
    keyboard_lastkey = -1;
}

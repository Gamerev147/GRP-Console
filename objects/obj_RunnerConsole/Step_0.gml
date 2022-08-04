/// @description Runner Command Handling

x = window_start_x;
y = window_start_y;

Text_DefText = obj_Console.Text_DefText;
if (RUN_ACTIVE != id) { exit; }

//Erase
if (keyboard_check(KErase) && string_length(Text_CurrentLine) > string_length(Text_DefText)) {
	if (EraseTime >= room_speed/6) {
		Text_CurrentLine = string_copy(Text_CurrentLine, 1, string_length(Text_CurrentLine) - 1);
		EraseTime = 0;
	} else {
		EraseTime ++
	}
} else {
	EraseTime = room_speed/6;
}

//Get Last Text to Current Line
if keyboard_check_released(KLast) {
    if (array_length_1d(Text_LastLine) - 1 > Text_Last) { Text_Last ++ }
    Text_CurrentLine = Text_LastLine[Text_Last];
}

if keyboard_check_released(KNext) {
    if (Text_Last > 0) { Text_Last -- }
    Text_CurrentLine = Text_LastLine[Text_Last];
}

//Copy Text
if (keyboard_check_direct(vk_control) && keyboard_check_pressed(ord("C"))) {
    clipboard_set_text(string_copy(Text_CurrentLine, 1, string_length(Text_CurrentLine) - 1));
    RunnerLog("Command Text Copied.", 0);
    keyboard_lastkey = -1;
}

//Paste Text
if (keyboard_check_direct(vk_control) && keyboard_check_pressed(ord("V"))) {
    if clipboard_has_text() {
        Text_CurrentLine = clipboard_get_text();
        keyboard_lastkey = -1;
    } 
}

//Take Command
var Script = "";
var Argument;
Argument[0] = "";
var ArgCount = 0;

if keyboard_check_released(KEnter) and (string_length(Text_CurrentLine) > 3) {
	Text_CurrentLine = Text_CurrentLine + " "
	var Word = "";
	
	for (var i = 3; i < string_length(Text_CurrentLine); i++) {
		var nextChar = string_char_at(Text_CurrentLine, i+1);
		if (nextChar != " ") {
			Word += nextChar;	
		} else {
			if (Script = "") {
				Script = asset_get_index(Word);
				var ScriptIsHidden = ds_list_find_index(HIDDEN_SCRIPTS, Word);
				if (script_exists(Script) && (ScriptIsHidden == -1)) {
					Script = Word;
					Word = "";
					continue;
				} else {
					RunnerLog(Text_CurrentLine, 0);
					RunnerLog("Function or command not recognized.", 0);
					RunnerLog(" ", 0);
					Script = "";
					Word = "";
					break;
				}
			} else {
				Argument[ArgCount] = Word;
				ArgCount ++;
				Word = "";
			}
		}
	}
	
	if (script_exists(asset_get_index(Script))) {
		RunnerLog(Text_CurrentLine, 0);
		script_execute_ext(asset_get_index(Script), Argument);
	}
	
	audio_play_sound(snd_Readout, 1, false);
}

//Conflict Keys
if keyboard_lastkey != -1{
    switch keyboard_lastkey{ 
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
    case KEnter:
    case KFocus:
    case KErase:
        keyboard_lastkey = -1;
        keyboard_lastchar = -1;
        exit;
    break;
    }
	if (global.CAN_TYPE = true) {
		Text_CurrentLine += keyboard_lastchar
	}
    keyboard_lastkey = -1;
}

/// @description Main Variables

#macro CHAT 0
#macro PING 0
randomize();

//Console Core Variables
Focus = true;
show_ui = true;
show_console = true;
Text_ = "";                    
Text_DefText = string(global.CURRENT_PATH) + ">. ";          
Text_[0] = "";
Text_CurrentLine = "";
Text_LastLine[0] = Text_[0];
Text_Last = 0;
EraseTime = -1;

//Console Raw Input
global.TextStringOnly = false;
global.TextStringInput = "";
global.TextStringFile = "";
global.TextStringFileLine = 0;
global.TextStringVar = "";

//update variables
global.__sys_update_int = room_speed;
global.__it = 30;

//File Downloading
global.SYSTEM_UPDATE = false;
downloadUrl = "";
downloadFile = 0;
downloadFileName = "";
downloadDest = game_save_id;
downloaded = -2;

//Cursor
selected = true;
lCursor = "|";
lCursorPos = 1;
lDelay = 15;
alarm[2] = lDelay;

//Net Console Core Variables
net_currentLine = " ";
netText_ = "";
netText_[0] = "";

//Settings Core Variables
set_currentLine = " ";
setText_ = "";
setText_[0] = "";
setDef = "";

//Data Core
dataText_ = "";
dataText_[0] = "";
data_currentLine = "";
data_isSelected = false;
global.database = ds_map_create();

global.sUpdate = false;
global.TAB = "MAIN";

//Extra
ShowIds = false;
ShowIdsTime = 5;
IdsColor = c_red;
Debug = false;

//Settings
global.__rounded_windows = false;
global.__rounded_elements = false;
global.__opaque_windows = true;

//Scripting VARMAP
globalvar VARMAP, RUNTIME_ERRORS, RUNTIME_CALLBACK, DEBUG_LOG;
VARMAP = ds_map_create();
RUNTIME_ERRORS = ds_list_create();
DEBUG_LOG = ds_list_create();

//Global Window Runner Variables
globalvar RUNNERS, WINDOWS, WIN_ACTIVE, RUN_ACTIVE;
RUNNERS = ds_list_create();
WINDOWS = ds_list_create();
WIN_ACTIVE = noone;
RUN_ACTIVE = noone;

//Init
ConsoleInit();
ConsoleAI();

//KeyConfig
KFocus = vk_pageup;
KLast = vk_up;
KNext = vk_down;
KEnter = vk_enter;
KErase = vk_backspace;
KLeft = vk_left;
KRight = vk_right;

//Style
Font = fntConsole;
HSize = window_get_width();
VSize = window_get_height() - 20;
room_width = HSize;
room_height = VSize + 20;

//Style
Text_MainColor = c_black;
Text_MainAlpha = 0.9;
Text_LineColor = c_dkgray
Text_LineAlpha = 0.9;
Text_PrimaryColor = c_green;
Text_ScriptColor = c_green;
Text_SecondaryColor = c_white;

Background_Color = c_black;
Background_Image = undefined;
Background_Path = "";
Outline_Color = c_white;

clock = true;
clock_date = false;
clock_outside = 0;
clock_inside = 0;

audio_play_sound(snd_Welcome, 1, false);

ConsoleLog("GRP Kernel", 0);
ConsoleLog("[slant]All rights reserved. (c) Gamerev Productions.[/slant]", 0);
ConsoleLog(" ", 0);
ConsoleLog("For updates and more information, visit: [c_aqua]https://gmrvproductions.000webhostapp.com/", 0);
ConsoleLog(" ", 0);

//Set Window Sizing
display_set_gui_size(window_get_width(), window_get_height());
display_reset(2, true);

//Create Controllers
instance_create_layer(0, 0, "ui_layer", obj_Loading);
instance_create_layer(0, 0, "Instances", obj_WindowControl);
instance_create_layer(0, 0, "ui_layer", obj_SystemControl);
instance_create_layer(0, 0, "ui_layer", obj_ServerPing);
instance_create_layer(228, 6, "Instances", ChromeControl);

alarm[5] = global.__sys_update_int;
alarm[4] = global.__sys_update_int*2;

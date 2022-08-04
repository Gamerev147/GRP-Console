///@description Init Variables

global.OBJECT_NAMES = "";
global.OBJECT_ID = "";
global.OBJ_IND = 0;

//dock coordinates
globalvar docky;
docky = 100;

//app dock vars
globalvar dock_apps;
dock_apps = ds_list_create();

//notifications
globalvar nots, notsy, __show_nots;
nots = ds_list_create();
notsy = 16;
__show_nots = false;

//extras
ffps = 0;
global.latency = 0;

//timers
alarm[0] = 10; //objects
alarm[1] = global.__sys_update_int; //system wait timer

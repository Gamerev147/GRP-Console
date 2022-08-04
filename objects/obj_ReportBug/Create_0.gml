/// @description Init Bug Report

keyboard_string = "";
global.CAN_TYPE	= false;

fdate = string(current_month) + "_" + string(current_day) + "_" + string(current_year);
bug_fname = "reports/report_" + fdate + ".txt";

tte_ext_input_create(600, 400, true);


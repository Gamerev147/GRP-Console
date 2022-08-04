
function run(_fname, _mode="", _startln="") {

	var fname = string(_fname);	
	var error_mode;
	var break_mode;
	var debug_mod;
	var startln = _startln;
	var specStart = false;
	var lines = 0;
	
	if (startln == "") || (startln == undefined) {
		startln = 0;	
	}
	
	if (startln > 0) {
		specStart = true;	
	}
	
	#region Mode
	switch (string(_mode)) {
		case "--e":
			error_mode = true;	
			break_mode = false;
			debug_mod = false;
			show_debug_message("Error mode set.");
		break;
		case "--b":
			break_mode = true;
			error_mode = false;
			debug_mod = false;
			show_debug_message("Break mode set.");
		break;
		case "--eb":
			error_mode = true;	
			break_mode = true;
			debug_mod = false;
			show_debug_message("Error-Break mode set.");
		break;
		case "--d":
			error_mode = false;
			break_mode = false;
			debug_mod = true;
			show_debug_message("Debug mode set.");
		break;
		case "--de":
			error_mode = true;
			break_mode = false;
			debug_mod = true;
			show_debug_message("Debug-Error mode set.");
		break;
		case "--a":
			error_mode = true;
			break_mode = true;
			debug_mod = true;
			show_debug_message("All modes set.");
		break;
		case "--db":
			error_mode = false;
			break_mode = true;
			debug_mod = true;
		break;
		case "--api":
			file_get_grp_api(fname, false);
			error_mode = false;
			break_mode = false;
			debug_mod = false;
		break;
		default:
			error_mode = false;
			break_mode = false;
			debug_mod = false;
			show_debug_message("Default mode set.");
		break;
	}
	#endregion
	
	//Check if file is .grp
	var fileIdentifier = string_pos(".", fname);
	var fileExt = string_copy(fname, fileIdentifier+1, 4);
	var can_execute = false;
	
	if (file_exists(fname) && (fileExt == "grp" || fileExt == "tgrp")) {
		can_execute = true;
	} else if (directory_exists(fname)) {
		can_execute = true;	
		fname = fname + "/" + fname + ".grp";
	} else {
		can_execute = false;	
	}
	
	if (can_execute) {
		var readFile = file_text_open_read(fname);
		
		while (!file_text_eof(readFile)) {
			//start reading the file at the specified starting point
			if (specStart) {
				show_debug_message("Resuming at line (" + string(startln) + ")");
				repeat(startln) {
					lines ++;
					file_text_readln(readFile);
				}
				var currentLine = file_text_read_string(readFile);
				lines += 1;
				specStart = false;
			} else {
				var currentLine = file_text_read_string(readFile);
				file_text_readln(readFile);
				lines += 1;
			}
			
			var Script = "";
			var Argument;
			Argument[0] = "";
			var ArgCount = 0;
			
			if (currentLine != "" && string_pos_ext("//", currentLine, 0) == 0) {
				currentLine = currentLine + ">";
				if (string_char_at(currentLine, 0) != ":") && (string_char_at(currentLine, 0) != "	") {
					var Word = "";
					for (var i = 0; i < string_length(currentLine); i++) {
						var nextChar = string_char_at(currentLine, i+1);
					
						//check for identifier
						if (nextChar != ">") {
							Word += nextChar;
						} else {
							if Script = "" {	//if there is no script already
								var found_keyword = ds_list_find_index(KEYWORDS, string(Word));
								var referenceChar = string_pos(".", string(Word));
								var ScriptName = string(Word);
								if (found_keyword == -1) && (referenceChar == 0) {	//If the script isn't a keyword
									Script = ScriptName;
						
									if (script_exists(asset_get_index(Script))) {
										Script = Word;
										Word = "";
										continue;
									} else if (ds_map_exists(VARMAP, string(Script))) {
										Script = Word;
										Word = "";
										continue;
									} else { //the script being called wasn't found
										throw_error("Dependency (" + string(ScriptName) + ") not found.", lines);
								
										Script = "";
										Word = "";
									
										if (break_mode) {
											exit;
										} else { break; }
									}
								} else {	
									//If the script IS a keyword
									Script = Word;	//set the script as the keyword
									Word = "";
									continue;	//continue looping each character
								}
							} else {	//if the script is already filled
								//check if the argument string contains a variable
								
								var start_ind = string_pos("^", Word);
								var end_ind = string_pos_ext("^", Word, start_ind+1);
								var str_count = end_ind - start_ind;
								var raw_word = string_copy(Word, start_ind, str_count+1);
								var check_word = string_copy(Word, start_ind+1, str_count-1);
							
								if (ds_map_exists(VARMAP, string(check_word))) {
									var find_value = ds_map_find_value(VARMAP, string(check_word));
									Word = string_replace(Word, string(raw_word), string(find_value));
									show_debug_message(string(raw_word) + " replaced with " + string(find_value));
								}
							
								//set arguments
								var tempArg = ds_map_find_value(VARMAP, Word);	//check if the argument is a user-variable
								if (!is_undefined(tempArg)) && (Script != "ClearVar") && (Script != "var") && (Script != "#call") {	//if it IS a user-variable
									show_debug_message("temp variable: " + string(Word) + "  found!");
									Argument[ArgCount] = tempArg;	//set the argument = value of user-variable
									ArgCount ++;
									Word = "";
								} else {		//if it ISN'T a user-variable
									//check_arg_for_variable(Word);
									Argument[ArgCount] = check_arg_for_variable(Word);  //** recursive check for variables
									ArgCount ++;
									Word = "";
								}
								//show_debug_message(string(Argument));
							}
						}
					}
				
					//Execute
					switch (Script) {
						#region IF
						case "if":
							if (Argument[1] = "=") {
								if (Argument[0] = Argument[2]) {
									var lines_skip = get_statement_content(fname, ":", lines, true);
									repeat(lines_skip) { file_text_readln(readFile); }
									show_debug_message(string(Argument[0])+" = " + string(Argument[2]) + ". Skipping " + string(lines_skip) + " lines...");
								} else {
									var lines_skip = get_statement_content(fname, ":", lines, false);
									repeat(lines_skip) { file_text_readln(readFile); }
									show_debug_message("Condition not met. Skipping " + string(lines_skip) + " lines...");
								}
							} else if (Argument[1] = "!=") {
								if (Argument[0] != Argument[2]) {
									show_debug_message("Condition satisfied. Continuing...");
									var lines_skip = get_statement_content(fname, ":", lines, true);
									repeat(lines_skip) { file_text_readln(readFile); }		
								} else {
									show_debug_message("The condition being checked was not met.");
									var lines_skip = get_statement_content(fname, ":", lines, false);
									repeat(lines_skip) { file_text_readln(readFile); }
								}
							} else if (Argument[1] = "->") {
								if (Argument[0] > Argument[2]) {
									show_debug_message("Condition satisfied. Continuing...");
									var lines_skip = get_statement_content(fname, ":", lines, true);
									repeat(lines_skip) { file_text_readln(readFile); }		
								} else {
									show_debug_message("The condition being checked was not met.");
									var lines_skip = get_statement_content(fname, ":", lines, false);
									repeat(lines_skip) { file_text_readln(readFile); }
								}
							} else if (Argument[1] = "<") {
								if (Argument[0] < Argument[2]) {
									show_debug_message("Condition satisfied. Continuing...");
									var lines_skip = get_statement_content(fname, ":", lines, true);
									repeat(lines_skip) { file_text_readln(readFile); }	
								} else {
									show_debug_message("The condition being checked was not met.");
									var lines_skip = get_statement_content(fname, ":", lines, false);
									repeat(lines_skip) { file_text_readln(readFile); }
								}
							} else {
								var conditionalScript = asset_get_index(Argument[0]);
								if (script_exists(conditionalScript)) {
									if (array_length(Argument) == 2) {
										var conditionalReturn = script_execute(conditionalScript, Argument[1]);
									} else if (array_length(Argument == 1)) {
										var conditionalReturn = script_execute(conditionalScript);
									}
									if (conditionalReturn) { 
										var lines_skip = get_statement_content(fname, ":", lines, true);
										repeat(lines_skip) { file_text_readln(readFile); } 
									} else { 
										var lines_skip = get_statement_content(fname, ":", lines, false);
										repeat(lines_skip) { file_text_readln(readFile); }
									}
								} else {	
									throw_error("Method (" + string(Script) + ") does not exist.", lines);
								}
							}
						break;
						#endregion
					
						#region IFNOT
						case "ifnot":
							var conditionalScript = asset_get_index(Argument[0]);
							if (script_exists(conditionalScript) && (Argument[1] != "")) {
								var conditionalReturn = script_execute(conditionalScript, Argument[1]);
								if (!conditionalReturn) { continue; } else { file_text_readln(readFile); }
							} else if (script_exists(conditionalScript)) {
								var conditionalReturn = script_execute(conditionalScript);
								if (!conditionalReturn) { continue; } else { file_text_readln(readFile); }
							} else {	
								throw_error("Method (" + string(Script) + ") does not exist.", lines);
							}
						break;
						#endregion
					
						#region REPEAT
						case "rpt":
							var repAmount = real(Argument[0]);
							var repScript = asset_get_index(Argument[1]);
							var repArgs;
							if (Argument[2] != "") repArgs[0] = Argument[2];
					
							repeat(repAmount) {
								if (script_exists(repScript)) {
									script_execute_ext(repScript, repArgs);	
								} else {
									show_debug_message("script not found");	
									throw_error("Method (" + string(Script) + ") does not exist.", lines);
								}
							}
						break;
						#endregion
					
						#region SKIP
						case "..":
							for (var l = 0; l < 100; l++) {
								//wait a tiny bit?	
							}
							continue;
						break;
						#endregion
					
						#region VAR
						case "var":
							// [0] =   Variable Name
							// [1] =   Script or value
							// [2..] = Optional Arguments
							if (Argument[0] != "") && (Argument[0] != undefined) {
								var arrIndex = string_pos(",", Argument[1]);
							
								if (arrIndex <= 0) {
									if (!ds_map_exists(VARMAP, string(Argument[0]))) {	//ADD TO VARMAP
										if (script_exists(asset_get_index(Argument[1]))) {
											switch (array_length(Argument)) {
												case 2:
													ds_map_add(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1])));
													show_debug_message("\nScript return value added.\n");
												break;
												case 3:
													ds_map_add(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1]), Argument[2]));	
													show_debug_message("\nScript return value added.\n");
												break;
												case 4:
													ds_map_add(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1]), Argument[2], Argument[3]));
													show_debug_message("\nScript return value added.\n");
												break;
											}
										} else {
											if (string_is_real(string_char_at(Argument[1], 1))) {
												ds_map_replace(VARMAP, string(Argument[0]), txr_exec(txr_compile(Argument[1])));
											} else {
												ds_map_replace(VARMAP, string(Argument[0]), string(Argument[1]));	
											}
										}
									} else {	//REPLACE IN VARMAP
										if (script_exists(asset_get_index(Argument[1]))) {
											switch (array_length(Argument)) {
												case 2:
													ds_map_replace(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1])));
													show_debug_message("\nScript return value added.\n");
												break;
												case 3:
													ds_map_replace(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1]), Argument[2]));	
													show_debug_message("\nScript return value added.\n");
												break;
												case 4:
													ds_map_replace(VARMAP, string(Argument[0]), script_execute(asset_get_index(Argument[1]), Argument[2], Argument[3]));
													show_debug_message("\nScript return value added.\n");
												break;
											}
										} else {
											if (string_is_real(string_char_at(Argument[1], 1))) {
												ds_map_replace(VARMAP, string(Argument[0]), txr_exec(txr_compile(Argument[1])));
											} else {
												ds_map_replace(VARMAP, string(Argument[0]), string(Argument[1]));	
											}
										}
										show_debug_message("REPLACED " + Argument[0] + " : " + Argument[1]);
									}
								} else { //variable is defining array
									var arrValues = StringSplitChar(Argument[1], ",");
								
									//check if variable exists for overwrite
									if (ds_map_exists(VARMAP, Argument[0])) {
										ds_map_replace(VARMAP, Argument[0], arrValues);
										show_debug_message("REPLACED " + Argument[0] + ": " + string(arrValues));
									} else {
										ds_map_add(VARMAP, Argument[0], arrValues);
										show_debug_message("DEFINED " + Argument[0] + ": " + string(arrValues));
									}
								}
							}
						break;
						#endregion
						
						#region FUNCTION DEFINE
						case "function":
							var fcName = string(Argument[0]);
							show_debug_message("FUNCTION " + fcName);
							
							//get function info from the stub
							var FunctionContent = get_function_content(fname, fcName, lines);
							
							//write the function to VARMAP (saving the tempFile path)
							if (ds_map_exists(VARMAP, fcName)) {
								ds_map_replace(VARMAP, fcName, FunctionContent);	
								show_debug_message("FUNCTION CONTENT REPLACED " + fcName);
							} else {
								ds_map_add(VARMAP, fcName, FunctionContent);	
								show_debug_message("FUNCTION CONTENT ADDED " + fcName);
							}
						break;
						#endregion
						
						#region FUNCTION CALL
						case "#Call":
						case "#call":
							//get the name of the function
							var funcName = string(Argument[0]);
							
							//quick-run the content of the array in the VARMAP
							if (ds_map_exists(VARMAP, funcName)) {
								var funcTempPath = ds_map_find_value(VARMAP, funcName);
								show_debug_message("LOOKING FOR FUNCTION.......  " + string(funcTempPath));
								run(funcTempPath);
								//continue;
							} else {
								throw_error("Function (" + funcName + ") has not been defined.", lines);	
							}
						break;
						#endregion
					
						#region IN
						case "In": //In>Argument[0]>Argument[1]...
							var inpt_prompt = string(Argument[0]);
							var inpt_var = string(Argument[1]);
							var inpt_linecall = lines;
							var inpt_callfile = fname;
						
							show_debug_message(inpt_prompt);
							ConsoleLog(inpt_prompt + "  (type '--exit' to cancel)", 0, RUN_ACTIVE);
						
							global.TextStringFile = inpt_callfile;
							global.TextStringFileLine = inpt_linecall+1;
							global.TextStringVar = inpt_var;
							global.TextStringOnly = true;
						
							//break;
							return 0;
						break;
						#endregion
					
						#region DEFAULT
						default:
							if (referenceChar == 0) {
								show_debug_message(Script);
								if (script_exists(asset_get_index(Script))) {
									script_execute_ext(asset_get_index(Script), Argument);	
								} else if (ds_map_exists(VARMAP, string(Script))) {
									var u_tmp_val = ds_map_find_value(VARMAP, Script);
									if (string_is_real(u_tmp_val)) {
										show_debug_message("operating on real variable");
										opp_real(Script, Argument);	
									} else if (is_string(u_tmp_val)) {
										show_debug_message("operating on string variable");
										opp_string(Script, Argument);	
									}
								} else {
									continue;
								}
							} else {
								#region Handle Reference call
								//the script contains a reference keyword
							
								//  referenceScript.referenceKeyword(referenceVar)>Argument[0]>Argument[1]  //
							
								var referenceScript = string_copy(string(Script), 1, referenceChar-1);
								var referenceKeyword = string_copy(Script, referenceChar+1, string_pos("(", Script)-referenceChar-1);
								show_debug_message("** REFERENCE SCRIPT " + string(referenceScript));
								show_debug_message("** REFERENCE KEYWORD " + string(referenceKeyword));
							
								var refCount = string_pos(")", Script) - string_pos("(", Script);
								var referenceVar = string_copy(string(Script), string_pos("(", Script)+1, refCount-1);
								show_debug_message("** REFERENCE VARIABLE " + string(referenceVar));
							
								switch (referenceKeyword) {
									case "return":
										if (script_exists(asset_get_index(referenceScript))) {
											var referenceReturn = script_execute_ext(asset_get_index(referenceScript), Argument);
											ds_map_add(VARMAP, referenceVar, referenceReturn);
										} else {
											throw_error("Script does not exists.", lines);	
										}
									break;
									case "open":
										if (!ds_map_exists(VARMAP, referenceVar)) {
											ds_map_add(VARMAP, referenceVar, Argument[0]);	
										} else {
											throw_error("File reference variable does not exist.", lines);	
										}
									break;
									case "write":
										if (ds_map_exists(VARMAP, referenceVar)) {
											var userOpenFile = ds_map_find_value(VARMAP, referenceVar);
											var tmpFile = file_text_open_write(userOpenFile);
											file_text_write_string(tmpFile, Argument[0]);
											file_text_close(tmpFile);
										} else {
											throw_error("File reference variable does not exist.", lines);	
										}
									break;
									case "read":
										if (ds_map_exists(VARMAP, referenceVar)) {
											var userOpenFile = ds_map_find_value(VARMAP, referenceVar);
											if (file_exists(userOpenFile)) {
												var userFileContent = file_text_read_all(userOpenFile);
												ds_map_add(VARMAP, Argument[0], userFileContent);
											} else {
												throw_error("File was not opened for reading.", lines);	
											}
										} else {
											throw_error("File reference variable does not exist.", lines);		
										}
									break;
									case "walk":
										if (ds_map_exists(VARMAP, referenceScript)) {
											var refVal = ds_map_find_value(VARMAP, referenceScript);
											if (referenceVar == "") { //functions available with no looping variable
												switch (Argument[0]) {
													case "print":
													case "log":
													case "Log":
														if (is_array(refVal)) {
															for (var a = 0; a < array_length(refVal); a++) {
																ConsoleLog(string(refVal[a]), 0);	
															}
														} else if (file_exists(refVal)) {
															var aFile = file_text_open_read(refVal);
															while (!file_text_eof(aFile)) {
																var aFileLine = file_text_read_string(aFile);
																file_text_readln(aFile);
																ConsoleLog(string(aFileLine), 0);
															}
														} else {
															throw_error("Cannot walk (" + referenceScript + ")", lines);	
														}
													break;
													default:
														throw_error("Unknown walk function (" + string(Argument[0]) + ")", lines);
													break;
												}
											} else {
												//functions available with a looping variable
												/*
													Check if Argument[0] contains Arithmetic (+, -, /, *)
													Run Arithmetic parser
												*/
											}
										} else {
											throw_error("Reference variable does not exist.", lines);	
										}
									break;
									case "len":
									case "length":
										if (ds_map_exists(VARMAP, referenceScript)) {
											var refVal = ds_map_find_value(VARMAP, referenceScript);
											if (is_string(refVal)) {
												if (!ds_map_exists(VARMAP, Argument[0])) {
													ds_map_add(VARMAP, Argument[0], string_length(refVal));	
												} else {
													ds_map_replace(VARMAP, Argument[0], string_length(refVal));	
												}
											}
										} else {
											throw_error("Reference variable does not exist.", lines);	
										}
									break;
									case "get":
										if (ds_map_exists(VARMAP, referenceScript)) {
											var refVal = ds_map_find_value(VARMAP, referenceScript);
											if (is_array(refVal)) {
												var saveVar = Argument[0];
												if (ds_map_exists(VARMAP, saveVar)) {
													ds_map_replace(VARMAP, saveVar, refVal[real(referenceVar)]);
												} else {
													ds_map_add(VARMAP, saveVar, refVal[real(referenceVar)]);
												}
											} else {
												throw_error("Cannot get from non-array type.", lines);	
											}
										} else {
											throw_error("Reference variable does not exist.", lines);	
										}
									break;
									case "add":
										if (ds_map_exists(VARMAP, referenceScript)) {
											var refVal = ds_map_find_value(VARMAP, referenceScript);
											if (is_array(refVal)) {
												array_push(refVal, Argument[0]);
												ds_map_replace(VARMAP, referenceScript, refVal);
												show_debug_message("Added " + Argument[0] + " to " + referenceScript);
											} else {
												throw_error("Cannot append value to non-array type.", lines);	
											}
										} else {
											throw_error("Reference variable does not exist.", lines);	
										}
									break;
									case "close":
										if (ds_map_exists(VARMAP, referenceVar)) {
											ds_map_delete(VARMAP, referenceVar);	
										}
									break;
									
									//  referenceScript.referenceKeyword(referenceVar)>Argument[0]>Argument[1]
									case "terminate":
										if (referenceScript == "main") {
											if (script_exists(asset_get_index(referenceVar))) {
												script_execute_ext(asset_get_index(referenceVar), Argument);
												return;
											} else {
												return;	
											}
										} else {
											throw_error("<terminate> must refer to <main>.", lines);	
										}
									break;
									default:
										ds_list_add(RUNTIME_ERRORS, "Reference keyword (" + string(referenceKeyword) + ") not found. Line(" + string(lines));
										if (break_mode) { exit; }
									break;
								}
							
								#endregion
							}
						break;
						#endregion
					}
				
					Argument = [];
				
				} else {
					continue;
				}
			} else {
				continue;	
			}
		}
		
		//if (lines == 0) {
			//ConsoleLog("File is empty.", 0, RUN_ACTIVE);	
		//}
		
		file_text_close(readFile);
		
	} else {
		ConsoleLog("[c_red]Error: [c_white]Could not run file.", 0, RUN_ACTIVE);
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}
	
	//Display error log
	if (error_mode) {
		ConsoleLog(" ", 0, RUN_ACTIVE);
		ConsoleLog("[c_green]Execution complete. (" + string(ds_list_size(RUNTIME_ERRORS)) + ")", 0, RUN_ACTIVE);
		ConsoleLog("Lines parsed: " + string(lines), 0);
		ConsoleLog(" ", 0, RUN_ACTIVE);
		ConsoleLog("Error Log -- " + "[slant]" + string(fname) + "[/slant]", 0);
		for (var e = 0; e < ds_list_size(RUNTIME_ERRORS); e++) {
			var ce = ds_list_find_value(RUNTIME_ERRORS, e);
			ConsoleLog("    " + string(ce), 0, RUN_ACTIVE);
		}
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}
	
	//Display debug log
	if (debug_mod) {
		ConsoleLog(" ", 0, RUN_ACTIVE);	
		ConsoleLog("Debug Log -- " + "[slant]" + string(fname) + "[/slant]", 0);
		for (var d = 0; d < ds_list_size(DEBUG_LOG); d++) {
			var de = ds_list_find_value(DEBUG_LOG, d);
			ConsoleLog("    " + string(de), 0, RUN_ACTIVE);
		}
		ConsoleLog(" ", 0, RUN_ACTIVE);
	}
	
	//Wipe the logs
	ds_list_clear(RUNTIME_ERRORS);
	ds_list_clear(DEBUG_LOG);
	
	//delete the file if it was temporary
	if (fileExt == "tgrp") {
		file_delete(fname);	
	}

}

/// @description ConsoleLog(Print,SaveInMemory)
/// @param Print
/// @param SaveInMemory
function RunnerLog(argument0, argument1) {

	if (!instance_exists(obj_RunnerConsole)) { exit; }

	with (obj_RunnerConsole) {
	
	    if (argument1) {
		
	        Text_Last = 0;
		
	        for(var i = array_length_1d(Text_LastLine)-1; i >= 0; i --) {
			
	            Text_LastLine[i + 1] = Text_LastLine[i];
			
	        }
		
	        Text_LastLine[0] = string_copy(Text_CurrentLine, 1, string_length(Text_CurrentLine) - 1);
		
	    }
	
	    //Scroll the arrays for the console
	    for(var i = array_length_1d(Text_) - 1 ; i >= 0; i --) {
		
	        Text_[i + 1] = Text_[i];
		
	    }
	
	    Text_[0] = string(argument0);
	    Text_CurrentLine = Text_DefText;
	
	}



}

/// @Description NetLog()
/// @Param String

function AliLog(_str) {
	
	if (!instance_exists(obj_Console)) { exit; }
	
	with (obj_Console) {
		
		for (var i = array_length(setText_)-1; i >= 0; i--) {	
			setText_[i + 1] = setText_[i];
		}
		
		setText_[0] = string(_str);
		set_currentLine = " ";
		
	}

}

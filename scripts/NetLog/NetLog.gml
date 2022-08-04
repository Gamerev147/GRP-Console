/// @Description NetLog()
/// @Param String

function NetLog(_str) {
	
	if (!instance_exists(obj_Console)) { exit; }
	
	with (obj_Console) {
		
		for (var i = array_length(netText_)-1; i >= 0; i--) {	
			netText_[i + 1] = netText_[i];
		}
		
		netText_[0] = string(_str);
		net_currentLine = " ";
		
	}

}

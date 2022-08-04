/// @Description NetLog()
/// @Param String

function DataLog(_str) {
	
	if (!instance_exists(obj_Console)) { exit; }
	
	with (obj_Console) {
		
		for (var i = array_length(dataText_)-1; i >= 0; i--) {	
			dataText_[i + 1] = dataText_[i];
		}
		
		dataText_[0] = string(_str);
		
	}

}

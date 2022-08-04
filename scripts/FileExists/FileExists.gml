// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FileExists(_fname) {
	
	if (file_exists(_fname)) {
		return true;	
	} else {
		return false;	
	}

}
